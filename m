Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7A7C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502C910FE70;
	Mon, 18 Mar 2024 19:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bkl14SJI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAEE10FE70
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710791165; x=1742327165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ahrNr9DoSKjhxqdylxrYSeW4tcJJ61IgG6e/Kzz3Oa8=;
 b=Bkl14SJIWjDGVuFV+lggeVazMee3tqqUp1oOlxgF/EIHCT5pFSJL0+22
 AaLThF88H4oiMno7eot8/N1QWChN+4vq+kjh/bGyUtfizT+yRdH3SSgP9
 IAkS7tWV0A0/0sPCpsrol2Evz+/TxGUSTxNHEWTjN16CksiIk3dZEqKF/
 JonyzTJshAgvyX/zeBfKXz+FZDKwWv0KGexJ13lV7JSb/2xwSOhnlu0CA
 lqyG6gucZroV5XNpNu/krCSra1xy0uFqzH8OASxv4UPXLU9rVUD1ky4or
 tjsdiMpubPhRzdfBfHqHslMm6eCYPrguOxRumKD44hfJeG9aTvYwoyu+e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5488064"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5488064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18045158"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 12:46:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:46:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 12:46:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 12:46:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YP3aQUnAtxvnErNT89PuyOrWO1sjeYiB2lIabXdtSZfZi1PIrNXOO1sslc4WN/NnVdZ6SqjZCTmqD9MowJjKBToyiXm6N/0GpArjVeHU+Qdx/fPQt6fsEzQrbEdDRzoU93MbMLPbQbh4pNry5yL8TIB86voriTKvgGBGutgYK6ox/Q+C6CBpXNatc3/ROXIFoZAbZ43BsPZw2PKkavDiGTm/Qx4MVj6E1zOfM3mhfaxzpesNRbQcpUI7gTqRJSoCb3H3S6n5IxgebArMDbk0+bVqO9En7AwfjPzNsTrEFgxCtV5Ef8UtwUF29qpCz2HPsOmBi9HLAeyxDhFevVbLiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76/DrkXOPJJyS3v0bVWjT6V/9fRAH66l++gF0i/f5Ps=;
 b=es+/2J0aE5OmXAQ36v9VsBcraqT4cvLYlxQ+w8z5iJkbCLyJ1s1ipQGnck2bopvaXozvNIfaKpflbdFf4QL/6gI92197K2P69Wl/vIM7gPMzN1iTLFN4JVx0RiBQfNK1XQ0KOvFfeI9QZ6sWqgkNuA+r5WvZNhpvMUqgXm+NFoVHF2sNaoIvF/8/0mC4gOd2AMsnSmn9Eu3ooU857IpNwc7hBJBzJqwBaZ+o8N2lnJVggTQh1M5EC16vFX7wuMANbgsPi5ryQU4HmIAifvRNEL0TUaYkWEAKfJ5+otnaViTUK9ahNbbnMMoczMKOI7GUBUQRyb7aH5Zfp+yg5Ov44g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7477.namprd11.prod.outlook.com (2603:10b6:510:279::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 19:46:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 19:46:02 +0000
Date: Mon, 18 Mar 2024 15:45:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe: Introduce the busted_mode debugfs
Message-ID: <ZfiZ9Y9M_tF-GBNv@intel.com>
References: <20240315140108.217862-1-rodrigo.vivi@intel.com>
 <20240315140108.217862-5-rodrigo.vivi@intel.com>
 <qntepfekkplyecpcjgvosunoxvg7xdtrrgo6d6j6kgoai6lz54@3wc7rqxj3pdk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <qntepfekkplyecpcjgvosunoxvg7xdtrrgo6d6j6kgoai6lz54@3wc7rqxj3pdk>
X-ClientProxiedBy: BYAPR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:a03:54::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: c5464574-f83c-41cd-624e-08dc47840a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mRBh8szMbDJPer6ewpuKY5nqLZPIyBr4HklAXoy2nZs5A9OBFhX3YLMArNCdOjYy/FM/i5q5q+y7GIaEAmopIy0HmGG+qLlbZe0rDwnLgeNlqkJKjFOM9r77PUotqWI1wReJe4r58JzzE5d/aTsYvO4hC1yNOcrK73iA4G4XnqoIYMZXwtRmE5VxaTyxm+MP3DBPj3CZa8XcF7PCsLcMglE2IXQRLwThgE98p9TNf6Z9L9UWB9ep7Sd1aEZflzeryf432/s4Jy8OdcPjeyytNJseC+2930eSUVgQf+TismQTM9jDoJ16B9wShfhBqr+hA3WmVujLkAgu4buQXvAXXSBS+mQXXQvXC65N8jjZfxPpQSIoMGUFwLAxqpgnVyMDyjafQ0VTRHfPtF2twXl+eZzjbNanbE3lMhsF1bpbkxdYZ0XO/SSxpoSxC91oK0Ifxx2GKtNAfJZgdxgVMQwtdEOTAXajOnFNTT0nU2CqCMi94VzOCs3n+3cet/b9OO6FJPmxn5eBW12ECU4gd780cSuk2hGt61qC911SMZaZwtTHaz7KiQ/3nmStj0eZ/aVUELhU8pfoJXHAqRZdjmcFenbokWyyhot17IBVXxUatRpsu1v3OClJ0UV9gI+1iIiDnQfbr65BnweEnoDwAHpidlxayvum8VKWynWdy31Jfnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EiYh9Kz25l7pTByX7IZrdYDjbOVBRSskbnqw6PMLqI2Flae7MUAyiCZRmUiJ?=
 =?us-ascii?Q?zcGo93XCnzoGrts1iU7RufISi6jWvNRwD6+6NhC5nP133XdXLCraSYkQPMUs?=
 =?us-ascii?Q?4TIuhbuvaTqcqopFTzrkWtloavJWyeh/Ylq0wYBndjTY8ShT+Lq6OkypzOfA?=
 =?us-ascii?Q?sSlQwcwj/j87Q/FL0ZdEBqaDPCR9l7sLo1vOezwCBAlBDCfaVW7cwtqhWY0z?=
 =?us-ascii?Q?yxhgxV1qoy95q22UHU/L/hmHeCbCEe2JNQk+WK+i1Zob1kviqhAVpqryAV1A?=
 =?us-ascii?Q?7aoArwhk5amY0/Eeew2Hj5wWni9EU9bke/FVHpXsUpjbXd06snyIlA/Vhfhj?=
 =?us-ascii?Q?pZLyki00UuDKgY03N6Fa0fJ2N0cdde2hQQi1bzxJHRRDt/A1i/o/tidYFQYj?=
 =?us-ascii?Q?V0SaQ3x3+kbOnpUZ/XwMOy4qxLz1yPddjk1V52xNAXmlcceXzJW1hfEjUkvL?=
 =?us-ascii?Q?ng4+7uksrVBpzcSujcJyu6vyMZUrdF1sLlIu4XgeDSvj9Gku11ik//Xt9IU9?=
 =?us-ascii?Q?F8iWTUDnFfbX6tpLbh+ERBQo7PCj7KdcZHCcBdTs+J/CvSZzrX19WBGtp7QH?=
 =?us-ascii?Q?wfBkLSFwLye3kdDrOfnB6mLXAQgljLx+r5DerMdn5U3rXpTsLaRDervkuDTQ?=
 =?us-ascii?Q?c8a4dK3NeTe4I7+2kmunLYBXDtJ/6WqEPXlJLLFAjfVAw+GQTa/SssjEEBgh?=
 =?us-ascii?Q?M49O3+SRYzk1Fu1kug5/u9l2/2oTRwV+UfGpmQPMih7zWGM1veQDHAIUBmcF?=
 =?us-ascii?Q?Q9b12uNnVqaoclFy7SQMlzpp7RVIODR2gyrIlWoJaKnlR0/zd/xBPorNMJWs?=
 =?us-ascii?Q?C1ZDTDeiqsuJb7ewg+R8qfAe1+QxoDcdtWBXCTTnBSly5YnKfiTE4uPtIZhK?=
 =?us-ascii?Q?OilcST4rUBSSKlcOECgEslJPraKcAfkM5PXwiqA3nQMT0xcGLjGy1iLypvaV?=
 =?us-ascii?Q?P8xE0QlUy36pMBImXETovtr5o65cJvphGCAjvRDNkWdxuqOtMitr5z+HBO5u?=
 =?us-ascii?Q?3/uc+UL03dVrx4qiMgPgmtIQeNlyfMkB+wdcsRUGp1mBQ8K9CA8919/H44XJ?=
 =?us-ascii?Q?eKRJM+J9Q60o0XfnuRZd1ziP6vUhozdc+BwMDA6HC7GNmqUtHFfHISbr3Fef?=
 =?us-ascii?Q?anCto8f+7m4MdhFwmSnjc7reh8QTPBgSeDTJ20jjRH9dehwKlbDVSClg4El3?=
 =?us-ascii?Q?IGm+kMMwJDAZ1Nqhkztsvgl9FLJPwPCwzMO56QPCS0lkH3rT9kzf5XNOo51k?=
 =?us-ascii?Q?M8BW5WMxgLe2ElEDMtC6W5w7QkVBWdCWV8pCO8z251AXUPZv2YSfxFIZ2lZa?=
 =?us-ascii?Q?bW3JqT9UQcShOkJr4oBSQTUZAxTknGMvwgx2hEamfLW9cOV1wgHq9FgOL7oe?=
 =?us-ascii?Q?UPateRLK+ZX+Yj9oyPBFItTgEhefYtdOUhrFGbWgk8PqX9wxPcxMJ1gqup1/?=
 =?us-ascii?Q?O8JDMi2/uxn9UPozINhLsV+ciYnGRCmIR/ne3jWZmx0jZvPp/FyhAiJFRas+?=
 =?us-ascii?Q?uFg2KyuyU/yLHhkFVABcOhL29XDH0zTpqTfFsvob3gKD1zdC1d6FWxZbOL+E?=
 =?us-ascii?Q?CVxv0aQp+s2IveKYSybuFaUDiUwgM77ZT2Ks0JKr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5464574-f83c-41cd-624e-08dc47840a9f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 19:46:02.1335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZRpxxh+qWQqwqUfMNf5RLCREvQVYIYVqTTVBvJTB2C5aDTtHHsuMECMx6ILhQ5ibMC4z398DzoCmPMwfUzERw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7477
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

On Mon, Mar 18, 2024 at 02:16:49PM -0500, Lucas De Marchi wrote:
> On Fri, Mar 15, 2024 at 10:01:07AM -0400, Rodrigo Vivi wrote:
> > So, the busted mode can be selected per device at runtime,
> > before the tests or before reproducing the issue.
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_debugfs.c      | 44 ++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_device.c       | 12 ++++++--
> > drivers/gpu/drm/xe/xe_device.h       |  2 +-
> > drivers/gpu/drm/xe/xe_device_types.h | 11 +++++--
> > drivers/gpu/drm/xe/xe_guc_ads.c      |  6 ++--
> > drivers/gpu/drm/xe/xe_guc_submit.c   |  5 ++--
> > 6 files changed, 71 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 8abdf3c17e1d..175ba306c3eb 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -106,6 +106,47 @@ static const struct file_operations forcewake_all_fops = {
> > 	.release = forcewake_release,
> > };
> > 
> > +static ssize_t busted_mode_show(struct file *f, char __user *ubuf,
> > +				size_t size, loff_t *pos)
> > +{
> > +	struct xe_device *xe = file_inode(f)->i_private;
> > +	char buf[32];
> > +	int len = 0;
> > +
> > +	mutex_lock(&xe->busted.lock);
> > +	len = scnprintf(buf, sizeof(buf), "%d\n", xe->busted.mode);
> > +	mutex_unlock(&xe->busted.lock);
> > +
> > +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> > +}
> > +
> > +static ssize_t busted_mode_set(struct file *f, const char __user *ubuf,
> > +			       size_t size, loff_t *pos)
> > +{
> > +	struct xe_device *xe = file_inode(f)->i_private;
> > +	u32 busted_mode;
> > +	ssize_t ret;
> > +
> > +	ret = kstrtouint_from_user(ubuf, size, 0, &busted_mode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (busted_mode > 2)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&xe->busted.lock);
> > +	xe->busted.mode = busted_mode;
> > +	mutex_unlock(&xe->busted.lock);
> > +
> > +	return size;
> > +}
> > +
> > +static const struct file_operations busted_mode_fops = {
> > +	.owner = THIS_MODULE,
> > +	.read = busted_mode_show,
> > +	.write = busted_mode_set,
> > +};
> > +
> > void xe_debugfs_register(struct xe_device *xe)
> > {
> > 	struct ttm_device *bdev = &xe->ttm;
> > @@ -123,6 +164,9 @@ void xe_debugfs_register(struct xe_device *xe)
> > 	debugfs_create_file("forcewake_all", 0400, root, xe,
> > 			    &forcewake_all_fops);
> > 
> > +	debugfs_create_file("busted_mode", 0400, root, xe,
> > +			    &busted_mode_fops);
> > +
> > 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
> > 		man = ttm_manager_type(bdev, mem_type);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index e28e3628744f..49dc2a061463 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -434,6 +434,9 @@ int xe_device_probe_early(struct xe_device *xe)
> > 	if (err)
> > 		return err;
> > 
> > +	mutex_init(&xe->busted.lock);
> > +	xe->busted.mode = xe_modparam.busted_mode;
> > +
> > 	return 0;
> > }
> > 
> > @@ -791,10 +794,15 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> >  */
> > void xe_device_declare_busted(struct xe_device *xe)
> > {
> > -	if (xe_modparam.busted_mode == 0)
> > +	/*
> > +	 * It is okay to check unlocked.
> > +	 * busted disabled should be done at boot with parameter or with debugsfs
> > +	 * way before starting the workload.
> > +	 */
> > +	if (xe->busted.mode == 0)
> > 		return;
> > 
> > -	if (!atomic_xchg(&xe->busted, 1))
> > +	if (!atomic_xchg(&xe->busted.flag, 1))
> > 		drm_err(&xe->drm,
> > 			"CRITICAL: Xe has declared device %s as busted.\n"
> > 			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index e6edf2d3ee4a..a8074975538e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -178,7 +178,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
> > 
> > static inline bool xe_device_busted(struct xe_device *xe)
> > {
> > -	return atomic_read(&xe->busted);
> > +	return atomic_read(&xe->busted.flag);
> > }
> > 
> > void xe_device_declare_busted(struct xe_device *xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 2633fdfc1a38..f68beb660f90 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -455,8 +455,15 @@ struct xe_device {
> > 	/** @needs_flr_on_fini: requests function-reset on fini */
> > 	bool needs_flr_on_fini;
> > 
> > -	/** @busted: Xe device faced a critical error and is now blocked. */
> > -	atomic_t busted;
> > +	/** @busted: Struct to control Busted States and mode */
> > +	struct {
> > +		/** @busted.flag: Xe device faced a critical error and is now blocked. */
> > +		atomic_t flag;
> > +		/** @busted.mode: Mode controlled by kernel parameter and debugfs */
> > +		int mode;
> > +		/** @busted.lock: To protect @busted.mode */
> > +		struct mutex lock;
> > +	} busted;
> > 
> > 	/* private: */
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index ecf45289b187..43f0a88bbe8a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -18,7 +18,6 @@
> > #include "xe_lrc.h"
> > #include "xe_map.h"
> > #include "xe_mmio.h"
> > -#include "xe_module.h"
> > #include "xe_platform_types.h"
> > 
> > /* Slack of a few additional entries per engine */
> > @@ -313,6 +312,7 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
> > 
> > static void guc_policies_init(struct xe_guc_ads *ads)
> > {
> > +	struct xe_device *xe = ads_to_xe(ads);
> > 	u32 global_flags = 0;
> > 
> > 	ads_blob_write(ads, policies.dpc_promote_time,
> > @@ -320,8 +320,10 @@ static void guc_policies_init(struct xe_guc_ads *ads)
> > 	ads_blob_write(ads, policies.max_num_work_items,
> > 		       GLOBAL_POLICY_MAX_NUM_WI);
> > 
> > -	if (xe_modparam.busted_mode == 2)
> > +	mutex_lock(&xe->busted.lock);
> > +	if (xe->busted.mode == 2)
> 
> I'm confused about this added lock. Why is it ok to check it unlocked
> in xe_device_declare_busted() and not here... we don't even have debugfs
> here yet.

right... we could simply remove the locks from here as well.

or perhaps we could then make the declare_busted to always
grab the lock.

but then we need to split that in 2 or change that to be something
like

void xe_device_possibly_busted(struct xe_device *xe, bool in_timeout_path)
{
	mutex_lock();

	if (mode == 0)
	   goto out;

	if (in_timeout_path && mode != 2)
   	   goto out;

	if (!atomic_xchg(&xe->busted.flag, 1))
   	   drm_err();

out:
mutex_unlock();
}

thoughts? preferences?

> 
> Lucas De Marchi
> 
> > 		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> > +	mutex_unlock(&xe->busted.lock);
> > 
> > 	ads_blob_write(ads, policies.global_flags, 0);
> > 	ads_blob_write(ads, policies.is_valid, 1);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 3f3160373631..cdda533ab317 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -34,7 +34,6 @@
> > #include "xe_macros.h"
> > #include "xe_map.h"
> > #include "xe_mocs.h"
> > -#include "xe_module.h"
> > #include "xe_ring_ops_types.h"
> > #include "xe_sched_job.h"
> > #include "xe_trace.h"
> > @@ -951,8 +950,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	simple_error_capture(q);
> > 	xe_devcoredump(job);
> > 
> > -	if (xe_modparam.busted_mode == 2)
> > +	mutex_lock(&xe->busted.lock);
> > +	if (xe->busted.mode == 2)
> > 		xe_device_declare_busted(xe);
> > +	mutex_unlock(&xe->busted.lock);
> > 
> > 	trace_xe_sched_job_timedout(job);
> > 
> > -- 
> > 2.44.0
> > 
