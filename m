Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557CEC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 17:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165541134FE;
	Tue, 23 Apr 2024 17:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0aFfG4Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBED1134FE
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713892380; x=1745428380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0IrgWYhz/3PK+1p8RBlhE9xjN8CDxIx41vgE2nLifIE=;
 b=J0aFfG4QZ3eaQtJ6XODpeFL4Q1utmQHE9QOfFuKFWYuQOSe7VxnsISbZ
 5bO2LBqHmGma8dYVc7Ztwi3XT14lC5iKLJGCS2XEo5gdL5KD6GPeCGJRS
 bk0626Nd5eW5APvF9FpuG9+e0BqPymjd1F9Q1HpxCe1JyXp5XefSNyshc
 Es+Qgx9ZpGksVs7UmBGfaySAPiWzTlMHkCLJunlsPiKsno4kOs2RV2Va+
 Kdu1PJQZwk8WA8p+qhvbO+QISRiyNW549DO8hgoYIeGwzIRNSPw3EaeDS
 KrESKLnFlyO+b5qZuGD6loYR1Xv36rapkhF8SpMp1KQxDcc2f3bmzvcUY Q==;
X-CSE-ConnectionGUID: Ka9w277/TNWDKpYAgOQAcQ==
X-CSE-MsgGUID: 53sYge5wQ3+2v7EUTgSWUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="10034435"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="10034435"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 10:12:59 -0700
X-CSE-ConnectionGUID: jYhntLN8QOKZP1/ZC8JMdg==
X-CSE-MsgGUID: N/MLfhYyRb+B52O9wio5+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24950698"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 10:12:58 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 10:12:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 10:12:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 10:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKUJ0vdhBTyFPTQndJv1vWEPnrXwoHLopzxL5nCzCIZ/Cdb1/rGzO8rjj57/5SqHjgON3DhN0e59SKytSwAuQF7IkO/GIPexI9jyqMNpvzq7HjYOWAdEqIY4MaygCEkjlvGYLLIxtqCaNvGwEptIGj8X5U5bGQrHcrly5bqsPt/jyyvqd26n7D6HTbGCoG+EInBugWE0ACX7jvwwCa987CzY9HAH3Xyf75U00XFwesTonAtfuLY96J4jRgoeFzx0o+Hll38cYulAASN9ME4tv+dMKEtlC7aCSwWzD0vu/AQ6eVyMEKykdlvRKCBwEY6gLklu+mNLdXBJCK4GJYhBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3Xg9R4SSVfk3gUPO4o+Vej33ParGTQaysQhL4odRHQ=;
 b=FwRzwF6WghOP8NxdFcx3CAg3PaoVcSW3YBvMZu4P7CPvdO433hiD7vRS7E1GhAQXi/0B/koycww7idJSy/hvmvMM5Rblqt1FJB3OJCtqJiEJstblpbx/JcUyK71Yo23KAqoEKWeZYP/rwk2BB1OhIo4Gz1Ilozj/1gXcqIWa1OZY7XXz4sVqkW9hLACOBobafkuF86qBVYnTCapENppcY/QrqYl8PiyXQB57VH4EJGiM4bOaJSZDL6WZ0z3DnVMXPbjY7NmE76ouA6T+bEy3l19bbVf86nTZ9F+5oPbXGVmFs8WGqAtexEfcTM5WxiibG66+n5N2c4RfZJfVwepWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 17:12:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 17:12:57 +0000
Date: Tue, 23 Apr 2024 17:12:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vm: Use xe_vm_lock() helper for locking
Message-ID: <Zifr+ArYb4FoGa7L@DUT025-TGLU.fm.intel.com>
References: <20240423070332.2036539-1-himal.prasad.ghimiray@intel.com>
 <8379fc45-959c-409b-af57-06794782c2f8@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8379fc45-959c-409b-af57-06794782c2f8@intel.com>
X-ClientProxiedBy: SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: fda4f4d6-13f2-4047-aab6-08dc63b89eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wOegoozR9SQhp0+cgytFYxFZYkLXx8AQphEm6KFlyuJ1RTNBz29OG4ePljG+?=
 =?us-ascii?Q?07DXszg+7r/wlfbwk1pH4iw/ypMaPQXRJwkPnJb7kVRLgQaTd4L60o1nBsAk?=
 =?us-ascii?Q?UeCE1+UpgGfpKa8egLy1oWXFG2iTKXDsnXQ5EOqzre9J1dM/gM+mQnTkGzlY?=
 =?us-ascii?Q?fk3b5qywuZ/e0YhM5f6pSgGSYFFw0Uua/+GVG2ghy0hy4lGigEiC0O6inFcC?=
 =?us-ascii?Q?AiSMrvngWc6acIw2doWUxqTFN4sE2A5lMmINtqmSg+6R1VF8ZFpS2DO6yipG?=
 =?us-ascii?Q?ly4SyhbNsXzm4tfXfFMgXxyUvpRoOFizFy19NRkGFKtbVAZMDlBGRzDHE7zD?=
 =?us-ascii?Q?v7/UtLQKcHeKFN6b2mOOoFe25jrfPNtNM8PWrU8LPK4oOw9sOKXzaR5L9CJ5?=
 =?us-ascii?Q?kIepGKowzNetyACefPwqPF321I97drLxKpxJ2OUwjN4QAvONT9oHUvU1UHvl?=
 =?us-ascii?Q?K5glSKL1TR0g+e3A3v3uCZfFiycCOC8HYQVwnQIxvLAKngcaZo8GX6ofJO6j?=
 =?us-ascii?Q?Fr5d5wJHjHUYhyqQ/zGbRwcnxLs+KL9bPmrve4iqYu1eDEvpECulyGtEnTqJ?=
 =?us-ascii?Q?gI0A+ibtSY6RMYEIFm3Yy7L2OAwP0XsEThpZukxJnSzfbYQt3UL/qF8Bz9jr?=
 =?us-ascii?Q?YXCQZUIXuDcJ3KAYoaauewuZk/Jrq0v5EvC+XInKvru23lsGnSwGpi5Yr8Y+?=
 =?us-ascii?Q?D91CmqIZ4b9s4Vc9qYaZcA1Khyj1wIf8+NsbFcgBfT6hnIOGosKsvcTWQmo6?=
 =?us-ascii?Q?OIJxlDb9Uu0zFBkrcjzOU/urrYiyxWMbucaC3PUKrgMsEzbY3kx42jBQ7OAW?=
 =?us-ascii?Q?KYw7Nrb0h2QePG4/RekG8YnG7ZOvWJz/6Kt1FnMsm6ekUsvsLi9L6e/kBOTr?=
 =?us-ascii?Q?fqiystEXESKj1/6sYzVzp6O/YjBUXJd0DpnMQ9NXyEN4AS8uBXTeTMxlO/h7?=
 =?us-ascii?Q?OdL9caiMc4YnAFgY/9pmgEmRWdTGn6wY+6Ee3XWhb6m0/Nh3dgag26H2t69a?=
 =?us-ascii?Q?y31cge2LDcTHKG+/Re0qkCSzomzqz+2FKakTEb3+r8hl2+/016F0uX8eKh16?=
 =?us-ascii?Q?1RKjzGu2FPFLgHM0aeVCqMdQzg2FLPY+w5EAhMAvPYd1IQT3WQYU2572yoHa?=
 =?us-ascii?Q?ApcSvfs9+mhW72grVvr1TsLBmr34m2erVa3TZD/prrv+Dnw0pk+dBL0cLaZQ?=
 =?us-ascii?Q?mkysM18GdhwwFYxIqsg6uIIrf1pASnBD5uIxsBKoFrrU+MWJc4ZvW3Xd1YDg?=
 =?us-ascii?Q?QLVMaGkO8/oDx9rqc9/f3Y+JQeeUpF1oIAJKa2ezcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IpKYeMFwYojtB8WlsoAsDbMFsFWc23uEAxjVhT1UZDi3l5jiwHCdDkrcEu4e?=
 =?us-ascii?Q?eEL4iI1fA3Nyng4GLYcWkzm3G+ib10/EB4VaArRWIa7KPxRp2gQwhazNHLqn?=
 =?us-ascii?Q?gq2Ynzg2eCojS2oMV9j2uWCceh1rW8eg867T2W0jZIe525qr5zMdnUKFPISH?=
 =?us-ascii?Q?L3R9jpIcMPjb48Il0FAJub4XYOhqkFs/Innws1G4hSfUDzDQDb1y13zJZxJq?=
 =?us-ascii?Q?uSEkQ2DglhHj5b09Gbznh5SzkgZ8BK+xx0XXoz+qdAlUB4PNY+EOnwpeD6FP?=
 =?us-ascii?Q?64w4ki1whmABSxs6Efper17v2NLjOeUJqLWP09K3WvVnIXRZ1SceoxsClS9y?=
 =?us-ascii?Q?BijwkXoeyAluda6uCxgpHn5OK1pl+2SCpJLa8HsdWjF5+ivRuzPqpBR9pSBc?=
 =?us-ascii?Q?VJ1ERkAnX1C1Djg1E3DPdjUpln6PMK8qIjp7uChqOdGaj92Fbv6pUuEhBFOq?=
 =?us-ascii?Q?EHDFwXyhU5Ws/mZ8yWXTuczs98KP6j8oxH53nawrb3WfMwzhDnASTDqfdHTa?=
 =?us-ascii?Q?BqEW5voC2zI3fAmoAmOeaXHLz27JgbRq9ccsB6RwlD3nk+GzcJiMQfR6EcCV?=
 =?us-ascii?Q?8pY/VZBor0X4HMxDxI39ZPkdcGCs8JwZ1JvWgcMDDBeVsibAEOzB6XbBv9It?=
 =?us-ascii?Q?k97VFzceJNWP32o/1hY+GQcGvdbrzSSPiT1FHJ2MLodfXFG6F20pETbeWxba?=
 =?us-ascii?Q?5hqcqyx0SoQu2lq/+597T1iAyX03umtDG7hol/2+5Fx+4LDf0qlPT6GlUO1o?=
 =?us-ascii?Q?/VLgjemeLhWeoPxYelEFtjO0r7KKZB+L7ecZ8/UovaDXgUUwanxAh+gXOisC?=
 =?us-ascii?Q?mDM6zRU6OIpLSt9iUmvnfPeJlcch2U9ooGwZsGOnfUCzWc4oVvcIUfVTqtz3?=
 =?us-ascii?Q?ADz3GYkho7k7fPiJrXpcjmLylHJHmxZBndxlTFBKQUDCopzrG3k+AH4TfGeG?=
 =?us-ascii?Q?KPxzsJLMkJl4KST7aN6cHPtsqBcXjEnFUE8oWrIiI6Bs25jizUuigyJT7L3q?=
 =?us-ascii?Q?qeH0SDPFjNCNmgf7l5nt2/qToAI02yY/wnF7pXACeaRfMqNC2fiUZvVvU4kI?=
 =?us-ascii?Q?Upw+pe44zdCJu0i1UyhW6/LgM3wgnVykzyzYMMo9TYzCDCLd+AvNELWXAtM+?=
 =?us-ascii?Q?+CFohaZHboWyF6qKeATEH4Y5h5iRozPRi4cLwviI9p1e1GN0Rb1aTPhb2Lmu?=
 =?us-ascii?Q?lR20CNmUXJ4LqYOCF9XW3mWEHnG2wRGFf5py+qcpCq2Tmpl9+Th7UAsphpYV?=
 =?us-ascii?Q?uJKMT06oAnz8cKihwNS2qHOmeOl1LrPxFr4qFmTyEdLq/xoUUcvFDhOeI0ha?=
 =?us-ascii?Q?nGgEGwJcgxAtnV+ZdMUtvAWmqB7yss0k/3c3dhVf4G1ZKotMkpzm/xB3XYdB?=
 =?us-ascii?Q?a8t1zGbLzXC+xerSd+lnwM1TxFsUMagANw8fTyeIil/zTV1t0YT9GsNt1yWY?=
 =?us-ascii?Q?VtOen2cVlmB8Jk428cgR0ZXCl6r8sksHeH/sMJjnzINLNhQ/CdaA2MyHci2T?=
 =?us-ascii?Q?h81vRvqXW/3vJL9+De9VQOKNXTpYloCAkSSkhf6JknR7qm2+ol7CK+ymlZI3?=
 =?us-ascii?Q?GTBy4um6e5r+rj1EuoP+3aJy9mseOtaxOH/iR84x2J07H+1lQYbuGI7KcUh6?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fda4f4d6-13f2-4047-aab6-08dc63b89eba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:12:56.9054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/7SjGT1wxacblxl2Rs4cxwxAI/nrQN97aTzLwyK5IvN15yoYlW+3HqKV6EUPCoITqPTX3MXB7K8/x6P68v/BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
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

On Tue, Apr 23, 2024 at 07:35:41PM +0530, Nilawar, Badal wrote:
> 
> 
> On 23-04-2024 12:33, Himal Prasad Ghimiray wrote:
> > There is no change in functionality. Using the helper function
> > defined within the driver.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Not sure if Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA") need to be
> added here.

Most definitely not a fixes tag. It was correct in "Port Xe to GPUVA" to
use dma_resv_lock_interruptible as xe_vm_lock depended on VM being
fully initialized.

It wasn't until sometime later when dma-resv was moved to the GPUVM base
class this function is safe to call here.

> Otherwise looks good to me.

The patch is not complete. Replying to another message now with details.

Matt

> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 85d6f359142d..e9c8dc6d7b83 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1279,7 +1279,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> >   	drm_gem_object_put(vm_resv_obj);
> > -	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> > +	err = xe_vm_lock(vm, true);
> >   	if (err)
> >   		goto err_close;
