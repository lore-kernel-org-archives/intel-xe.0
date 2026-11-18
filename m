Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDB7606A32A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jcx67SOl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A8E1120B4;
	Wed, 18 Nov 2026 22:49:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5227E10E1C6
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:49:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2111040C48;
 Wed, 18 Nov 2026 22:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A5F1F000C5;
 Wed, 18 Nov 2026 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795042141;
 bh=WQ7azKxl6ZlQjBSRv0da2UGMxK2QIvjfN9CU1tD/pcc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Jcx67SOlpH7zaGx9FKsnGCyRC9o2Jq/6lgHSV/MPCk6BlIOGg72pqcVTIvwcsAe2a
 smqBp66/Gr20U8RB2waUSugDwI04h98OeQ9I/4lVDM/wIns4eb6WmUnBMnVTlKSSK7
 tbxsj7Fm1ypyWPFTopD1nA/8bwGMaaHcNoUuZJfn8VFKC4baLTCoRvEEkxjAOlcply
 ZNSLrnUvEeEDJK2i8PaP2OJL/kyRI7PLidIqqWVY7/JfpDO7lG92cBZNJxqZeoV59c
 raYjrWnafJ08bcr9WMNUoSvUg9w/1IeJ8hd5xhb4ziksruH7kkyFCbIfYAtky8Xd5d
 pN+VdkQmecj5Q==
Message-ID: <sashiko-outbox-222127@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261118223023.19653-4-stuart.summers@intel.com>
References: <20261118223023.19653-3-stuart.summers@intel.com>
 <20261118223023.19653-4-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 22:49:00 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] driver core: test: platform_device_swnode_shared() tests
  unmanaged swnode
- [Low] driver core: test: unsafe device lifetime in
  platform_device_swnode_shared()
--

commit 456e50d0c4a7cd5e70182bbae38d6d777a4710e4
Author: Stuart Summers <stuart.summers@intel.com>

driver core: platform: tests: add a shared software node test case

This commit adds a KUnit test case verifying that sharing a platform
device's software node with a second device via device_set_node() leaves
the owner's software node intact when the second device is unregistered.

Link: https://patchwork.freedesktop.org/series/175858/ [1]

> diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test=
/platform-device-test.c
> index 9ce563f76aad6..378ba7fab2acf 100644
> --- a/drivers/base/test/platform-device-test.c
> +++ b/drivers/base/test/platform-device-test.c
> @@ -420,9 +420,66 @@ static void platform_device_two_swnodes(struct kunit=
 *test)
>  			    "Expected errno =3D=3D -EINVAL, got: %pe", pdev);
>  }
> =20
> +static void platform_device_swnode_sharer_release(struct device *dev)
> +{
> +}
> +
> +/*
> + * A software node assigned as a platform device's primary firmware node=
 may be
> + * shared with other devices: i2c-designware passes dev_fwnode() of its =
platform
> + * device down to the i2c adapter device it creates. Check that removing=
 the
> + * sharing device leaves the owner's software node intact.
> + */
> +static void platform_device_swnode_shared(struct kunit *test)
> +{
> +	static const struct property_entry properties[] =3D {
> +		PROPERTY_ENTRY_STRING("compatible", "test,shared-swnode"),
> +		{ }
> +	};
> +	struct fwnode_handle *fwnode;
> +	struct platform_device *pdev;
> +	struct device *shared;
> +	int ret;
> +
> +	pdev =3D platform_device_alloc(DEVICE_NAME, PLATFORM_DEVID_NONE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
> +
> +	fwnode =3D fwnode_create_software_node(properties, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
> +	platform_device_set_fwnode(pdev, fwnode);

[Severity: Medium]
Does platform_device_swnode_shared() exercise the managed software node
path that caused the drm/xe + i2c-designware platform_device_release()
use-after-free?

In xe_i2c_register_adapter(), drm/xe attaches the node via
device_create_managed_software_node(&pdev->dev, ...), which sets
swnode->owner =3D &pdev->dev.  Creating the node with
fwnode_create_software_node() and platform_device_set_fwnode() leaves
swnode->owner as NULL and takes an extra fwnode reference, so
software_node_notify_remove(shared) never reaches the managed-node
release check fixed in f8623ce59649 ("software node: only let the owner
release a managed node"):

drivers/base/swnode.c:software_node_notify_remove() {
    ...
	if (swnode->owner =3D=3D dev) {
		set_secondary_fwnode(dev, NULL);
		swnode_put(swnode);
	}
}

As written, the test passes even without that fix.

> +
> +	ret =3D platform_device_add(pdev);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	/*
> +	 * A second, non-platform device referencing the same fwnode, like the
> +	 * i2c adapter device created by i2c-designware.
> +	 */
> +	shared =3D kunit_kzalloc(test, sizeof(*shared), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shared);
> +
> +	device_initialize(shared);
> +	shared->release =3D platform_device_swnode_sharer_release;
> +	ret =3D dev_set_name(shared, "test-swnode-sharer");
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	device_set_node(shared, dev_fwnode(&pdev->dev));
> +
> +	ret =3D device_add(shared);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	device_unregister(shared);

[Severity: Low]
Can allocating shared with kunit_kzalloc() and an empty release callback
cause a use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=3Dy?

Under CONFIG_DEBUG_KOBJECT_RELEASE=3Dy, device_unregister(shared) ->
put_device() -> kobject_release() schedules shared->kobj.release as
delayed work instead of cleaning up synchronously, so KUnit frees shared
when the test exits while kobject_delayed_cleanup() is still queued.
Also, if any intermediate KUNIT_ASSERT_* fails before the end of the
test, the unmanaged pdev, fwnode and shared allocations and registrations
are leaked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118223023.1965=
3-3-stuart.summers@intel.com?part=3D1
