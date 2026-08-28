Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8A9C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 13:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EA510E4AE;
	Fri, 28 Aug 2026 13:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="abMQUCU5";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D038710E4AE
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 13:27:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BD611601FD;
 Fri, 28 Aug 2026 13:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199991F000E9;
 Fri, 28 Aug 2026 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787923656;
 bh=YTCgUoAZ1ZfbO0L3ubdbAAlcEQUDIr3UnJj3q/JxPiw=;
 h=Date:From:To:Cc:Subject;
 b=abMQUCU54E80mxD2Jr9Zgxx7dgkK7wu/QPHf/BNYBPZEDE75qSffMSDUbT7ADiqWR
 /0HYTDq7HesfiZEfuHK95ujOPqZ0uw3/+KZWYS61jb/9yEMW3Ota0Gevix/DTWyPVo
 mdTzB6dQmHz6C6BCZrRw/RLeRW6wDpI/MethHVLT/MHFmw4Jvq5M3S3/xz+0yaroin
 SK+6SqoJbRyz2QU6wIjqqf9BY/aSFCYM+Or9YD1K+nxVADHvrXGemNctTlg+8f3PYa
 l2gWXTdfYXPaD/LAkFbjdwLisIavyQyaAbBuo5IsHdI/atEgPY0nB0GEqzMRUn5rfy
 sysBvAxcMwIhQ==
Date: Fri, 28 Aug 2026 14:27:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matt Roper <matthew.d.roper@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <apGMw8Xl8Si7WupD@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UV7McFlZIvnc2/cB"
Content-Disposition: inline
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


--UV7McFlZIvnc2/cB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_i2c.c

between commits:

  e766abbc5191b ("drm/xe/i2c: use platform_device_set_fwnode()")
  0f485f88656af ("drm/xe/i2c: use device_create_managed_software_node()")
  5d8ed6b64220a ("drm/xe/i2c: Allow per domain unique id")
  f43fa4b8522ba ("drm/xe/i2c: Fix the interrupt handling")
  244abef7f280a ("drm/xe/i2c: Keep the i2c controller always enabled")

=66rom the origin tree and commits:

  a55b76b8bc2c4 ("drm/xe/i2c: Fix the interrupt handling")
  76cc14e2faed1 ("drm/xe/i2c: Keep the i2c controller always enabled")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_i2c.c
index 399099ff0dbc1,d8fa68206f418..0000000000000
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@@ -111,9 -111,14 +111,9 @@@ static int xe_i2c_register_adapter(stru
  {
  	struct pci_dev *pci =3D to_pci_dev(i2c->drm_dev);
  	struct platform_device *pdev;
 -	struct fwnode_handle *fwnode;
  	int ret;
  	u32 id;
 =20
 -	fwnode =3D fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
 -	if (IS_ERR(fwnode))
 -		return PTR_ERR(fwnode);
 -
  	id =3D (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
 =20
  	/*
@@@ -123,16 -128,14 +123,16 @@@
  	 * platform_device_register_full() is done.
  	 */
  	pdev =3D platform_device_alloc(adapter_name, id);
 -	if (!pdev) {
 -		ret =3D -ENOMEM;
 -		goto err_fwnode_remove;
 -	}
 +	if (!pdev)
 +		return -ENOMEM;
 +
 +	ret =3D device_create_managed_software_node(&pdev->dev,
 +						  xe_i2c_adapter_properties,
 +						  NULL);
 +	if (ret)
 +		goto err_pdev_put;
 =20
  	pdev->dev.parent =3D i2c->drm_dev;
 -	pdev->dev.fwnode =3D fwnode;
 -	i2c->adapter_node =3D fwnode;
  	i2c->pdev =3D pdev;
 =20
  	ret =3D platform_device_add(pdev);
@@@ -143,6 -146,8 +143,6 @@@
 =20
  err_pdev_put:
  	platform_device_put(pdev);
 -err_fwnode_remove:
 -	fwnode_remove_software_node(fwnode);
 =20
  	return ret;
  }
@@@ -150,6 -155,7 +150,6 @@@
  static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
  {
  	platform_device_unregister(i2c->pdev);
 -	fwnode_remove_software_node(i2c->adapter_node);
  }
 =20
  /**

--UV7McFlZIvnc2/cB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqRjMIACgkQJNaLcl1U
h9DmTwf+LwEdmVPYgyAxtmX65fZhuPt0PgvL2RudnZJQ/AczD9Wx8btZR6eSqJzf
+kSMVh1lbKZFGkeQOGrQVQF9EdEW0MmHj7AyfIYIfcVfiV8ah83cR2B612pHwDY/
NkIby/y4Hd6P97DXFGFEA04T40E8S5ICZebAoMrYg3t+1xQQAhtZPKqxE86VDjdX
KirRuaXjbQnQCS20U43ueZKJ5bZ5/Z2aZzjBRo1xTlQky3y3ZzUo/XV2VSOq5bKT
PRGligbt2r3fCM5S9wmex+EuVNFx9xx2fnDRUFw5PfJAJvfB3BJTgSsGghr7Fm3n
mU7pRQ+csiFpNPdixRs7pw4aVze6Pw==
=uGsR
-----END PGP SIGNATURE-----

--UV7McFlZIvnc2/cB--
