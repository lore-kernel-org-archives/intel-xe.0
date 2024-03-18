Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC49BC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E2410FDB1;
	Mon, 18 Mar 2024 19:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZ81eyeR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FF110FDB1
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 19:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710789416; x=1742325416;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ETSmyInrKFDWC5mJHThotyclsn1CvdR9NBZ5Nnghzo0=;
 b=gZ81eyeR8UK0wawZadBjIV25RADMnq+gjSqmG7qLO+yZrVgrC3+qqSSh
 I6DqG/esA1VabQ6NXVfPbj7x3hpTAyyA99l1GgW9WU9duz8gjaw9uAQqI
 8+aKiLJaGeT50GRvv3L5VkyVzpbu7tnezaH5jKIVvrgGFHfXF/dSJPdWS
 cZYyh2gDPPm8HeUToAF1/8D12MRfXvn71PfHG05UddjPFE3lunpSfVsM6
 BIxxA/sjSwSfBSkmmd4DQYJBJ6ZLHQjEw7nmmddkstifqAbB6zMFWEXMO
 wrCITwz6aO2ooqRDxopG3WJ/JD3RRg+Da8u+rKQQlw/OL4zdirgCg2YLA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5746493"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5746493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18135994"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 12:16:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:16:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 12:16:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 12:16:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fr9yk9HweFS2jQD5RzheIpnBdXEou9UvgFxKsyeRm1gxg62CJJ4LAchNzSGFIIFS7Bj5BT6j7oFAsCACLnj80VOwS7ZE6oRC8Fm+TVhovJ2wBB4hzKJ1ozGHuYo9wRmr3EQwDiMCVMS9RmqO29e67i9PUHQGCf0+bMMWbtIcIFv9PTOfAG9pmm853Sh6kjMQ/aRCSi/g4aITtdI1DOdGhp9obvr/ThdXKFvG9ovZD43v2sCwo1Rw8qaVuyDpdDic/Gl9hE3AHp1utPUvAuYBXCamDbzOIMoPtTbkIIcJWrkOsD3chFfQSGj4vdY1vCB+J0S97xZiLm3l4Zlj3Gadyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dviP7utHCFevdgJG9yxVqCZP/8rwpGClFdglPGnXAXo=;
 b=X+fyZu7+m0ipQNYeze6gLLDv0tDm/8BKjzu8QkHSlzuputQKQ80K1OktaqUgTu73ePTC4AFRBZBksP7mILyhFt448AGy62TafkVEq5kMJn15S4dB/U/VJGjDUBowxO8JmySuLVum27s9rytL+JgoXCayh8Ckvr65CIDlCeQ003FXqtdeezU4lS2b6hNvkAtODaEe17PbRFTuWhnlgErX9Arc9+l4xVm72MYR7G2ewrmrLjrLtld9EbRP62p9SrmnKSj9BeoXpQm5x/eUeJSW1kOmuEb3HcR5uRLtoXDvaXvJqzKIWQK/LkaWaOw8XOIwGR7CeQGKuSiHlfKZVbEUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5263.namprd11.prod.outlook.com (2603:10b6:5:38a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 19:16:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 19:16:51 +0000
Date: Mon, 18 Mar 2024 14:16:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe: Introduce the busted_mode debugfs
Message-ID: <qntepfekkplyecpcjgvosunoxvg7xdtrrgo6d6j6kgoai6lz54@3wc7rqxj3pdk>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
 <20240315140108.217862-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240315140108.217862-5-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:a03:80::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: e84966ec-ab5c-47ed-6e7e-08dc477ff76a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Jb7POZVB21jFE5TNMtteYPLPm4N3oDin7cxEPw7JsLPjiaJM4VMRdIFVw9SOHvy9XHv5hw1fjZTPxRm2pSq51axKInA021nc3CZHF6YwnfMnk89qU7wP3XEM96zSUnO+7JsYm1pLHMhmPjESwuukcNpqxJxZfb7vaIwb+eRfyBH1b2KkLAgom3v3MfEhTaCBlsh8G4l8nMVt8Z86GJx8Tj5Z/SwETqDK2GnevHbPW7brZ7O+fAnVfLANpeFSG6LC5qTBi1i/5P8+vWQGiROTqVi2oZfyCvPOHKqjDK0TX0P/SkIfCn93MhS0KYXLR4hZAxcnWYMp/mbmjluFvtq6YP7KkZTxuSdRnHGVaXG4UlxIkdaKQmMWE4wx2l7rC5EcIYJRvOCzbS7dPdJJYevgbKlkvl65MVNHFih+OV2RI4VCOQ3DrKPywSnEuM0SffNfkLLlqoWxEohVHqgz6F5FxCKGHKFOEkN58eKvrKQZeju+7vkIb8qHKC/PbVnPqUM8jezHPREB95yd7QTxE74HFAPzBQh+d8ZlzF1wDaLAVBK/AAy1XWrGBLfAo/Bo7KQ2KvwZUYwaz5jdz4FKEYEWnZ2dSnC6QQ12RSrl1H61S3GaAtkr88QhAeLU5ISFsZUnnWlRbxUki3R8hsgyei1LJtupP19ehr9HDI8hr3bDGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L9qGF7h7aIN61WM2IcmVUO1KOop3hxx1tGRv1y5xN3hDBa9rLnmti+wJkrzx?=
 =?us-ascii?Q?gzffPnCHKxAYhRjfXoAw+2+4g9grdr9ltV3wx+zUFIXH2em62ReSCrvd78er?=
 =?us-ascii?Q?3ahKiAoD5DR0lty7T/RyDbFdkOusRHAHkf2QRW9OkeG+avrEZzXBRp9SFdi3?=
 =?us-ascii?Q?Jl2AQVC/ZXhF/MVg5IIZaeyiHFgQ5SRnY4s6kde03BEboQsIURbuYRUixymm?=
 =?us-ascii?Q?1dtEVjGuQhzwpfHQ8B+67qT7F1T87BjdkX3397gv2tMrThjzeM9qfyheIAv6?=
 =?us-ascii?Q?L/JZ61pt47lYgaKsTpV0W/Nr1Wagh6vzZ15Bep5cboXIy8PCNI9sOHQgqTiY?=
 =?us-ascii?Q?kbynWEO+QTPC8Te1fyJYZ3SIw6wrgWr8fEhwX6IF8v7g52AARWY2gyWkzjt8?=
 =?us-ascii?Q?DZ4RCbHIfxClJcEvmcCvxnhlx2ekvUFKyp66JepJ+h51UvckUmsqcujCRshG?=
 =?us-ascii?Q?1VVfSMRC4/TLV4HlIxzx9HEgxSCjKwGXZCfa0MuL5FqFPwHpt2YIEk5TDyKu?=
 =?us-ascii?Q?GpyQ2KYcCBQ+Z9Hs5Eq105KXR+xwyYU3zXv83qGpAjuy/ul4SLqNRVqK5pG/?=
 =?us-ascii?Q?m6U6uGJC2NgKYVUWa+L4F/HhqF3hH70QJgsyjyYjmpqsekLFJ1Y4DjWoftv4?=
 =?us-ascii?Q?1romzrf6uVEC05FkShQxRzuVH+i1gNDA47c+kekaAN5wHKST2xE4/QxGaept?=
 =?us-ascii?Q?RJLOfE3Cgyfr+xOQUVcSyj7DGQ0vy21v9qqnpBDmItTBE9Mjrw094Jf8myrB?=
 =?us-ascii?Q?Tki22werY73JO6Q3/pvRhFCWxuUM0TpMxn2cQmoN/HWYidvjtSf5aOyK79Vw?=
 =?us-ascii?Q?Y4baxq3zPMUpcpuxKPbizNIQLFK7nkZX/EuUIacdjeeiJEfMwJq9zTVDzyxN?=
 =?us-ascii?Q?m1dFmKFw1bams1iYtMxCXDw6Jcafq0W4l7mRxEnVaW+o3KORWxByXTihFm+T?=
 =?us-ascii?Q?mA1/LEo/pFw4yE2UvOGFUddPEzAXz00POQ7qk5HEoBIUn46JN4UZsMesJUis?=
 =?us-ascii?Q?cq8Fzd2E+oHB0aixRAg7hfDjemtbxNbcXDM8QZrAe2pJoqg43mTWO/vU5PDp?=
 =?us-ascii?Q?YkClo2owZgg3aQ2iAdQeCd0Tn2IW4rFz63cCgxDYylitr/Ix+ztqy0OBiqbc?=
 =?us-ascii?Q?0NW9cWgRDMvuC/CbyfGTGoL99kaIJa8zfr0A1inZWiJ45mZWg3cnx4XEdfjm?=
 =?us-ascii?Q?dgs1B+aW2HehqpLSNkxJ255T8cfXPx1ssr+dVKGy/cjDtolj3aV0DdDQym2r?=
 =?us-ascii?Q?OiXR7pLwmWyqtodMQ0HooWZZIZORVA4sz0IvBFxSJbgJ+zVrnpE4+x7AoJqD?=
 =?us-ascii?Q?jcROMmwt1Lafi1ORSJk4u2zl1DuqWQ49MYcbUX0LALFzXyO6UAtSdjD2bE5U?=
 =?us-ascii?Q?fXrNcmpzcR7yRo/pX3aMYpn7gLdmeKWUKnOYOzW6JLb/I/y2vS4XXlGYT4iH?=
 =?us-ascii?Q?9o8P/lkiApuv/FrbAfJ1qEYVL7pGU5PN2v4DKgGEBetvVXDkLJVIOtyclooQ?=
 =?us-ascii?Q?BugapRyUZjoT0NaX11vl327s/8FMGjzIAtBKlelaoNIC+6Q6f4NdlxGljlhY?=
 =?us-ascii?Q?Govp8Srqbc8M8+ke9SGJvnkrGGt42rF38Fdt71NTjfh43K1knWGlcRUHP6p3?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e84966ec-ab5c-47ed-6e7e-08dc477ff76a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 19:16:51.9160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5E+ySTYpVB102pOIvaDQ3xt8IL/rvUckuRAbjvNmknwOIDi4ehhn6Mv+PXNe/SFy1eMYVScvFYl9X5nRCOXXYz/DliltLZE25DbRP+q+jrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5263
X-OriginatorOrg: intel.com
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

On Fri, Mar 15, 2024 at 10:01:07AM -0400, Rodrigo Vivi wrote:
>So, the busted mode can be selected per device at runtime,
>before the tests or before reproducing the issue.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_debugfs.c      | 44 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device.c       | 12 ++++++--
> drivers/gpu/drm/xe/xe_device.h       |  2 +-
> drivers/gpu/drm/xe/xe_device_types.h | 11 +++++--
> drivers/gpu/drm/xe/xe_guc_ads.c      |  6 ++--
> drivers/gpu/drm/xe/xe_guc_submit.c   |  5 ++--
> 6 files changed, 71 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>index 8abdf3c17e1d..175ba306c3eb 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -106,6 +106,47 @@ static const struct file_operations forcewake_all_fops = {
> 	.release = forcewake_release,
> };
>
>+static ssize_t busted_mode_show(struct file *f, char __user *ubuf,
>+				size_t size, loff_t *pos)
>+{
>+	struct xe_device *xe = file_inode(f)->i_private;
>+	char buf[32];
>+	int len = 0;
>+
>+	mutex_lock(&xe->busted.lock);
>+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->busted.mode);
>+	mutex_unlock(&xe->busted.lock);
>+
>+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>+}
>+
>+static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
>+			       size_t size, loff_t *pos)
>+{
>+	struct xe_device *xe = file_inode(f)->i_private;
>+	u32 busted_mode;
>+	ssize_t ret;
>+
>+	ret = kstrtouint_from_user(ubuf, size, 0, &busted_mode);
>+	if (ret)
>+		return ret;
>+
>+	if (busted_mode > 2)
>+		return -EINVAL;
>+
>+	mutex_lock(&xe->busted.lock);
>+	xe->busted.mode = busted_mode;
>+	mutex_unlock(&xe->busted.lock);
>+
>+	return size;
>+}
>+
>+static const struct file_operations busted_mode_fops = {
>+	.owner = THIS_MODULE,
>+	.read = busted_mode_show,
>+	.write = busted_mode_set,
>+};
>+
> void xe_debugfs_register(struct xe_device *xe)
> {
> 	struct ttm_device *bdev = &xe->ttm;
>@@ -123,6 +164,9 @@ void xe_debugfs_register(struct xe_device *xe)
> 	debugfs_create_file("forcewake_all", 0400, root, xe,
> 			    &forcewake_all_fops);
>
>+	debugfs_create_file("busted_mode", 0400, root, xe,
>+			    &busted_mode_fops);
>+
> 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
> 		man = ttm_manager_type(bdev, mem_type);
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index e28e3628744f..49dc2a061463 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -434,6 +434,9 @@ int xe_device_probe_early(struct xe_device *xe)
> 	if (err)
> 		return err;
>
>+	mutex_init(&xe->busted.lock);
>+	xe->busted.mode = xe_modparam.busted_mode;
>+
> 	return 0;
> }
>
>@@ -791,10 +794,15 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>  */
> void xe_device_declare_busted(struct xe_device *xe)
> {
>-	if (xe_modparam.busted_mode == 0)
>+	/*
>+	 * It is okay to check unlocked.
>+	 * busted disabled should be done at boot with parameter or with debugsfs
>+	 * way before starting the workload.
>+	 */
>+	if (xe->busted.mode == 0)
> 		return;
>
>-	if (!atomic_xchg(&xe->busted, 1))
>+	if (!atomic_xchg(&xe->busted.flag, 1))
> 		drm_err(&xe->drm,
> 			"CRITICAL: Xe has declared device %s as busted.\n"
> 			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index e6edf2d3ee4a..a8074975538e 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -178,7 +178,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>
> static inline bool xe_device_busted(struct xe_device *xe)
> {
>-	return atomic_read(&xe->busted);
>+	return atomic_read(&xe->busted.flag);
> }
>
> void xe_device_declare_busted(struct xe_device *xe);
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 2633fdfc1a38..f68beb660f90 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -455,8 +455,15 @@ struct xe_device {
> 	/** @needs_flr_on_fini: requests function-reset on fini */
> 	bool needs_flr_on_fini;
>
>-	/** @busted: Xe device faced a critical error and is now blocked. */
>-	atomic_t busted;
>+	/** @busted: Struct to control Busted States and mode */
>+	struct {
>+		/** @busted.flag: Xe device faced a critical error and is now blocked. */
>+		atomic_t flag;
>+		/** @busted.mode: Mode controlled by kernel parameter and debugfs */
>+		int mode;
>+		/** @busted.lock: To protect @busted.mode */
>+		struct mutex lock;
>+	} busted;
>
> 	/* private: */
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index ecf45289b187..43f0a88bbe8a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -18,7 +18,6 @@
> #include "xe_lrc.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>-#include "xe_module.h"
> #include "xe_platform_types.h"
>
> /* Slack of a few additional entries per engine */
>@@ -313,6 +312,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>
> static void guc_policies_init(struct xe_guc_ads *ads)
> {
>+	struct xe_device *xe = ads_to_xe(ads);
> 	u32 global_flags = 0;
>
> 	ads_blob_write(ads, policies.dpc_promote_time,
>@@ -320,8 +320,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
> 	ads_blob_write(ads, policies.max_num_work_items,
> 		       GLOBAL_POLICY_MAX_NUM_WI);
>
>-	if (xe_modparam.busted_mode == 2)
>+	mutex_lock(&xe->busted.lock);
>+	if (xe->busted.mode == 2)

I'm confused about this added lock. Why is it ok to check it unlocked
in xe_device_declare_busted() and not here... we don't even have debugfs
here yet.

Lucas De Marchi

> 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>+	mutex_unlock(&xe->busted.lock);
>
> 	ads_blob_write(ads, policies.global_flags, 0);
> 	ads_blob_write(ads, policies.is_valid, 1);
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 3f3160373631..cdda533ab317 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -34,7 +34,6 @@
> #include "xe_macros.h"
> #include "xe_map.h"
> #include "xe_mocs.h"
>-#include "xe_module.h"
> #include "xe_ring_ops_types.h"
> #include "xe_sched_job.h"
> #include "xe_trace.h"
>@@ -951,8 +950,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	simple_error_capture(q);
> 	xe_devcoredump(job);
>
>-	if (xe_modparam.busted_mode == 2)
>+	mutex_lock(&xe->busted.lock);
>+	if (xe->busted.mode == 2)
> 		xe_device_declare_busted(xe);
>+	mutex_unlock(&xe->busted.lock);
>
> 	trace_xe_sched_job_timedout(job);
>
>-- 
>2.44.0
>
