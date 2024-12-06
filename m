Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D34BE77179
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 15:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1DC10F123;
	Fri,  6 Dec 2024 15:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGC9BJDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68CE10F123
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 15:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733498742; x=1765034742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EUUX7eQXCl5vYTT9iW5Jrq2lBh/+USFOMTdH/hTjrQY=;
 b=MGC9BJDzImw0Qir9tmsYCEvoT/u6HhrE3GDsQD0cEIxsSk//RSZSds0v
 NDMIaCVJOICfGQ1/2xqxu8H5GzBaMxaBeHIVkkVv1nTSflDdhAffWMyd7
 xXEkGmiK1M7TWvo2O+9NL7UGB/7oC4kde40gl6A6JdZ34ttUVhSHRE8Ah
 JpZ+B6m5ZdgT8me/u29RQdVn3a+Na2s8Jo6Bj+wQ/eYVicDVaicjcDuMz
 niHR/xpXYUq08JU7xgCppFvYpFDnTEgADoNX4FkDNPYDEYdmQRe50d7md
 82kUTZhGcw4ZRG4mF6ND2pvRxMbCvMSSAiCJgKxcJhcwG/VSDAQyfho26 w==;
X-CSE-ConnectionGUID: y3Sji1abTVKXA6b++K1ttQ==
X-CSE-MsgGUID: mJVNrclFSXe87hOMo9x/HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="59254560"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="59254560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 07:25:42 -0800
X-CSE-ConnectionGUID: NaYBeR1LRZO8A3qQC7krcA==
X-CSE-MsgGUID: TiN49XGKSLayMOs7ktz/7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99478220"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 07:25:41 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 07:25:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 07:25:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 07:25:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2wZrHv5RJkWFXRVNogqYFfNPBb2exNG98YyZQ99Rjt4L+q7zA8R5BtxyvxP1Jba+tS0UGiZ4b1reYJ/olg192qgLkEYuwEPgWUP8Glk4pQKDydAQPNa/CgXb64NiBr2XBlOIs8pGEWg3OMy1SMy3rA51dBeQrPDV4pSQ9huIqFKN3G76AxczT0WKXBLh1NASqdUx2i5zevaNeCYdtrCdDuuoflVqNfhXbDU9SEgnHFzNlN6cWZ8f9M3OZLlpVcFAit5HThkw/9mCt+nteUF3sLxLNEMTYQrkCsdz5PEtJLajkD61Cnk+vOkG5rgpV1tGj3+oTlPP2MiLKM2UcI98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3Y6pTavADxpPF1v2zv7It1t7Azl5zu411TJZDLSkjw=;
 b=YH+jW0qVIDIEFvsX0U4PiG4pOZ6GqTxCRnXoLL9nAEvKCZEu5ROarLdJPcyvNkp35odEKJv9KCtHRWWNnikKxOaBZKoe4OPT+ZWE2Qef0Uw1tryZGnjegVko6jpYGEnahr1xBT6XG9wzygmgZR60hOvyGkP9r7YvtrpVclLTzF79MQ3+0wgS9AC0/gBjfLuhNosg+zyUIEirAHUaPpTAFvCBRsOQlnsUnFOU+hCudHdL+pqJSS8ox14HVUSVruw2Ex0mDBDqZ3aQhW7xdAfIHl988WW+UHZBGA0akVl+lo2TmL35R3uQNp7YQjp6UnYhB+aGb9oBgg57GxeuxOkVOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA1PR11MB7130.namprd11.prod.outlook.com (2603:10b6:806:29f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 15:25:37 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Fri, 6 Dec 2024
 15:25:37 +0000
Date: Fri, 6 Dec 2024 10:25:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>
Subject: Re: [PATCH] drm/xe/xe_sync: Add debug printing to check_ufence
Message-ID: <Z1MXbTAqX11wbRmY@intel.com>
References: <20241202194631.106940-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241202194631.106940-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA1PR11MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: c123d961-7351-45e2-cca8-08dd160a3c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n7f2eRK4g8ABlTnWQ1jlYSu9LOQ/WMrdC5ak10KyYdRILVG3sIrwbbZ9w2o2?=
 =?us-ascii?Q?kNIggviwDQz48FKjfxU72uFDrxvUN+k/p3H8K6ocaLZkRtqStiQwbUlYAWR1?=
 =?us-ascii?Q?AlQD6FJDy1OlCaKLc/6qHnpdoQqpX5pBVE4DqlWCy9/ETX5rx/CFTTHq44NH?=
 =?us-ascii?Q?Ks+B16lvs2dh3JrrdD3DyvbV5zjm2rdI0yWDRDi7zCHSRMUX/nIPCgEbiYH+?=
 =?us-ascii?Q?0JACFXUA7otkYLhePS9YaPPiGjs0vgWMLnHZWvnvK2K3LVcNcOxGsaWdc+YA?=
 =?us-ascii?Q?hLV4g4Q6i/m2kcMfVALhUMGI1m4vfJIyCz2A+H6vThCwK6jWAeQpf/KRpbdN?=
 =?us-ascii?Q?C1EuXCaFJF/KJi7axEM1I4+wOol0fQcOxLjVNPg/cifFzyLl2isxb3cRW4H1?=
 =?us-ascii?Q?h8fs8lLzYFphuTnPtvShm0O5BEK6M8g9D7uYeHzytTGFnjidVabweiciW0w8?=
 =?us-ascii?Q?+injbQeJhWY+AcX+uHpy2SkM4dnm5zcbDakKQiDiRsHv7Npu5NNiUSPzDtrX?=
 =?us-ascii?Q?sIpAXHlVThLaeH50sbUdIngFY+Vwxfhzt/Qqi9qinGZf6OpSWogfELci02lq?=
 =?us-ascii?Q?sRCzMJcD2dJhBSwJoMp8djJY9/tVCO1QcpaTK2Whgx84is0N4XRgjcEriZTd?=
 =?us-ascii?Q?bN9B39IKXZHJiFtyMN4hBFa8JFJQN73Z0f+dCS6EUBl8iwU//kybUZdyzutr?=
 =?us-ascii?Q?g3fQaX2jwceQmooVP9+g1ZdsXZS9KMtcfklQEueK8cll/30wySxyxYJL4ZKq?=
 =?us-ascii?Q?VlL51QsdBiNON6Xa9PgD56CP3lATEWYpYNR7nEcdzENlThedomvHtCgyyhxm?=
 =?us-ascii?Q?FPH6ZCqpM8NwL8s6flrWo2Tc/D17NmkWkcZzFyM8670IXP+D/8i5+zAUBYkM?=
 =?us-ascii?Q?AsLi/MZJ3geSWKEewzB2+9F4x3HEsDOIeCvkkqmyuSa9GBh8dSeWSwdMZ+7h?=
 =?us-ascii?Q?R/rXrvkzUVUii+Ra0j5AW0hvOy2Sr7jBTkfvzT34+TgO3mPNvfx38ryDPbyd?=
 =?us-ascii?Q?b4RR5I7tK5KtmMOVhvHSPgbNij++v4fWWny+wSScCpyukLn7bYqOupkElWTM?=
 =?us-ascii?Q?Dx7zFDqb1VtR2pf07Bys2bzpqSqBkx7+fjwwkmW1lM3fXV7mbpFi02Wh9o+p?=
 =?us-ascii?Q?IEB1kPtuFwv7u+ihOI0w1/spItPQ9Cg5kveDOhZBpIa2U3tlcwPc0BZPID44?=
 =?us-ascii?Q?1tIo54DYLO1FGeTkNndEFFskheZsghrAdAN/Jj+X3vVZNJhfwIlqxmfuztcn?=
 =?us-ascii?Q?gi5ChNHKgfshvotw17cW6Iw4td1R1GxNU8bR5dYaTci03FCneIpDfjqmSDrO?=
 =?us-ascii?Q?8Ih6G31fDvAxv/XcvcxN3CLC7JTBR7GyNFer/7Kooi33gg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AgXyuUZVEh8qOFwSIxAmxw3Yd/K+PnQQ17j5z51mqrY10YMMSDhiuklwzo+o?=
 =?us-ascii?Q?XQUmPS8yLCd6NBYLC119EzNivQkBGb6JUPljivyst+GwVDtJWR9HDF1Z05FA?=
 =?us-ascii?Q?f2co+FkmZubQsVTQLJy8PJaKw48qSHY9DoDXeSM3VSKzdZhnOwpcfeb1odAq?=
 =?us-ascii?Q?bM7hnoXa271zRqo3Otqj6Fr1I5pIN8e8QaCafd1ETV2v6KJ+pdSh3n7+DsQ8?=
 =?us-ascii?Q?Hr5ZNsyTsNf39InjGJn0kbjaQWPA+m4v/4jdclfS0Mj03oyMxha+Hy94bslf?=
 =?us-ascii?Q?DTSIRRDff5VYSIQkL5EFfnIOMwN4OLz6Bm13LyNdH/ZKtPC/F83nxDMYqZEg?=
 =?us-ascii?Q?pyRVTs2LZozIYV+qvCEF2ihTMbneiZISBq7tz4ck5CXch5w9UR86Ilw3Hsmm?=
 =?us-ascii?Q?H+jUyEjxEuEaBIqcu/jZEi8pz9Tjae61ecAyP9ATXj826ZqgeXslrtbMyftC?=
 =?us-ascii?Q?mGA8gbTEB0EQo8WySgzRMV2MDWNbTokA2LVjP7tGvHBKihR+nY4j6ywtZXkR?=
 =?us-ascii?Q?Ne4Bl5zkXKA4s3NvzqbroAtYJBjcRH3BTX1f75qfd/odjqLig9HfL+jbv0QY?=
 =?us-ascii?Q?/gOlhOuJkpm7b67PUJoVK67ZGVmr/aZ6I0tfFfDPUsOzxk4MQCrKHNZpKgaP?=
 =?us-ascii?Q?jL/Xq3zodDsZvp5r0X2b6sLBUXArLEwV+B0smlNCqX5PXG/wJG5P4MoFoA7K?=
 =?us-ascii?Q?hjC6LIRrPv13WNpciPBU0dUxIPKTdlO4J7mEj4HxmGow5d8pXOF7oE2cbQTA?=
 =?us-ascii?Q?fxn0xH9l4Y3G+JCaiOMnRZ1ODbRMRiSiMXXDKXknzS9BD1V9Tfc7tiJjBpFY?=
 =?us-ascii?Q?NPBrjyFBLpKCepr/duGt0I9iNz7o08Vg27loNI5IcxuqfJkva88vM1z4mhiD?=
 =?us-ascii?Q?KezJ8BQQGYhPbE3boGHe/BQZ4ggmLhsoao7CoAtinKCv1lpIV4c1bkwcLTCJ?=
 =?us-ascii?Q?Mx5HrNPMBpTSPvlYmGlaOIhQvIIp73F3pK4RqzoRilDdwMC07H/oOFMpe/wk?=
 =?us-ascii?Q?K7UUVm4IL/OpjAbKjnO2ls2ICdsiDL9ZpJb/m5sSS0q0B3rNZDGL3SqWJOMm?=
 =?us-ascii?Q?lyZF1puje1ItJT0hCfC4IpdKMcNvfwyt8Ce25PiHwL/4LrcdSgy/+KzHMrOk?=
 =?us-ascii?Q?6TGCS7y20lBNv2+NKEMHNKd74Zj43tTjEBkyGPykFkWGc63Nd427CPGJyl+j?=
 =?us-ascii?Q?25TKPFrDi5vpdBNWQzQ+eQYnnmtinpw+CUxeX21X1bH7OHiJF+fSB8YnAzJn?=
 =?us-ascii?Q?n83gRwPcG5X9BNKWbatHxixcEt4pIl6b5MHNlGkFLBDHQmgBkkj7t99JHgbb?=
 =?us-ascii?Q?2wCpUrvKeHwtdMlwvPa3Fz7cwYdzF6JbSlRJ6SYQgZmlaSfg6CkCvY/fcO0a?=
 =?us-ascii?Q?wDX4SIGmst1ATeeDNhQyQHc1MsINGU4vX27IslP+qWYcBFHvB6dZ3YQAHmO4?=
 =?us-ascii?Q?GBJ7BWFMwW6CHdRiFUMtYhskNMlW1CP+U7uGHeSE8wkpdTo5b7wRR+x92qxT?=
 =?us-ascii?Q?xARzflDkt3QzFSXheR7Tu/B0rjdCDmBsZ01pkqNItJWY78nJaDbaRjewcP6u?=
 =?us-ascii?Q?s+euurDIBNb/VzdiP79rFPHN83ak6CfwinMMOYoOZsEFzD4VxXhBwQcCn3cD?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c123d961-7351-45e2-cca8-08dd160a3c1f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 15:25:37.5303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzrfXmH+tLLrGzRQJeRv6xSG4q08ywYFJdYYkCrYxqtu/Q+wiw5Lpc00gtDMAN2qTT56FpoOM0yKDluo+L+hhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7130
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

On Mon, Dec 02, 2024 at 07:46:31PM +0000, Jonathan Cavitt wrote:
> The xe_sync helper function check_ufence can occasionally report EBUSY
> if the ufence has not been signalled yet.  EBUSY is a non-fatal error
> value for the function, so it is not desireable to warn in cases where
> EBUSY is reported because it is up to the user to decide if EBUSY is a
> fatal error in their use cases.  However, we can and should report EBUSY
> to the debug logs for diagnostic purposes.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 610226c7c1ce..09ab7111e091 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2400,7 +2400,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> -		if (err)
> +		if (XE_IOCTL_DBG(vm->xe, err))

this macro is good for ioctl arguments check, not for errors dbg during ioctl
path...

If really needed and not in a very critical latency path then we should add the
dbg call directly I believe...

>  			break;
>  
>  		err = vma_lock_and_validate(exec,
> @@ -2413,7 +2413,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
> -		if (err)
> +		if (XE_IOCTL_DBG(vm->xe, err))
>  			break;
>  
>  		err = vma_lock_and_validate(exec,
> -- 
> 2.43.0
> 
