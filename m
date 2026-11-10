Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6FD606A32A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 16:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQ4xVJ6N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E8110E205;
	Tue, 10 Nov 2026 16:45:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D8610E205
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 16:45:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E8E604068F;
 Tue, 10 Nov 2026 16:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12791F0089F;
 Tue, 10 Nov 2026 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794329109;
 bh=9r6L1fa4AmCdtrZ650dwXqcJAvGefUEUjVlHhiIxJhM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=DQ4xVJ6NR0jqoyyrD8iNFa3O7sSenNtuBBztXlTwR2DwF3KeYFfR6eM7phDfhgrAh
 o2zZAY8BEhJ6I2mjFKl/0a0sSM5dBG9vWI1qaanDWujUHOvzUA0wQC6qryl0A5GtNb
 /ajaFIy2SfvdY3ZF7C1BXFcEmZqAs0YvgMCiKip9NsTlOcre+2o7fYuRRC4mEvSGft
 Rf2F7W5s73qGKsdRop7ILoEV8SOtNzG+Fbqudbzwr0wLyKEtkJPQxrZIjq1RR4dlFP
 cs0BfmvK5AfbP9l7rK/OBTeF4lv72kT1mK2ZtFwcXQUY91xbEBCc6agwRLhE7gLe3P
 yvLBOpThSOT0Q==
Message-ID: <sashiko-outbox-207406@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/pf: Reset PF scheduling defaults on auto
 provisioning restore
To: "Rachapalli Bandi Jagadeesh" <jagadeesh.rachapalli.bandi@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110162609.41234-1-jagadeesh.rachapalli.bandi@intel.com>
References: <20261110162609.41234-1-jagadeesh.rachapalli.bandi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 16:45:09 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/pf: missing master mutex around
  pf_reprovision_default() call
--

commit 5801d3ddee06076e86b0973d473b023b281cd2d2
Author: Rachapalli Bandi Jagadeesh <jagadeesh.rachapalli.bandi@intel.com>

drm/xe/pf: Reset PF scheduling defaults on auto provisioning restore

This commit resets PF scheduling defaults via pf_reprovision_default()
when restoring XE_SRIOV_PROVISIONING_MODE_AUTO in
xe_sriov_pf_provision_set_mode().

> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm=
/xe/xe_sriov_pf_provision.c
> index c37e422b5a5cd..6b338f8930753 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -170,12 +170,18 @@ int xe_sriov_pf_provision_set_mode(struct xe_device=
 *xe, enum xe_sriov_provision
>  		return 0;
> =20
>  	if (mode =3D=3D XE_SRIOV_PROVISIONING_MODE_AUTO) {
> +		int err;
>  		if (xe_sriov_pf_num_vfs(xe)) {
>  			xe_sriov_dbg(xe, "can't restore %s: VFs must be disabled!\n",
>  				     mode_to_string(mode));
>  			return -EBUSY;
>  		}
>  		pf_unprovision_all_vfs(xe);
> +
> +		/* custom PF EQ/PT/sched_if_idle would block fair VF scheduling */
> +		err =3D pf_reprovision_default(xe);
> +		if (err)
> +			return err;
>  	}

[Severity: Medium]
Does calling pf_reprovision_default() here without holding
xe_sriov_pf_master_mutex(xe) trigger a lockdep warning and update PF
scheduling state and GuC KLVs without synchronization?

pf_reprovision_default() and the *_locked() helpers it invokes require
xe_sriov_pf_master_mutex(xe):

drivers/gpu/drm/xe/xe_sriov_pf_provision.c:pf_reprovision_default() {
	...
	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));

	for_each_gt(gt, xe, id) {
		err =3D xe_gt_sriov_pf_policy_set_sched_if_idle_locked(gt, false);
	...
}

However, the debugfs caller path (restore_auto_provisioning_write() ->
xe_sriov_pf_restore_auto_provisioning() ->
xe_sriov_pf_provision_set_mode()) does not acquire
xe_sriov_pf_master_mutex(xe), and pf_unprovision_all_vfs() only takes
and releases the mutex internally per VF.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110162609.4123=
4-1-jagadeesh.rachapalli.bandi@intel.com?part=3D1
