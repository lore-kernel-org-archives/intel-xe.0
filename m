Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8712C48BC4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 22:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F8C10E3C1;
	Tue, 20 Feb 2024 22:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RotEI8EX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C2D10E3C1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708469678; x=1740005678;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IaogElaZclwm8zW84KCjMgifr1r/myRucywLJatIeIE=;
 b=RotEI8EXuajb5KYXILPKfR6LrzMtS6QaJH23POBTu3F/rLMik2AYMayH
 tO7Y0s3JVN6Gd4dWDU/SZVNHpI3NtInu5HZwYNO5OD2BQ5jg+2Q0wMmfF
 PjHL8LH5SuUUUURiODTdFhdNRT1sY5EAq3E5Wp/xnSLTvz2C5wgLkPjSy
 vqcaTuCYMEaJuC57FAukNU0SpJprPKR2yI5hRWMD3mJa70xxk43iEDvse
 8ZD3fhihWmolKkE5/FdnjtMgvytyOI3CKN6C54ZUU4UNZuX5J9CV9R+rg
 GxTsFvSutz2ku7DqUAZdGqthGeaW4ONtAhNw40qraVDJTrO4/+jTKXmkp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2470085"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2470085"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 14:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9630686"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 14:54:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 14:54:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 14:54:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 14:54:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EM22xW6TvBnYHZTDq0rvyQa4IgVd/uO1c1/2Vz/VEATehWt2LCCy/qL6S0MVk6mR0YakGy4k2bSaTf1RwGCeOe2BzgOS9Rsk1bdSMjv1Ve1JvJKuqERkNGMVMR40BpvperBNwH8msfvwv9qxPN5f0swKXwyaRou9Q3EYog1UjE7PkVPn1ZGXjy+g0ltveOer+LF9dWX+sbd6vqPNd1JHiV7pqQE2aMNNkW95Q6az0SRw36rwuLLwBfE/chq9qZoyYGUT0zBnG3qMDsnm4cmyrpAzMmOYEY9/kXIRqvDhjfi2fecuhU+3q5URoBn0X+26DisMjkkairiteuGRPxq29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUIJltRLqCyB6wypj3N4AQ1mwDGucJL0y8ciNr8a3L4=;
 b=GF/gjW6xgTf6yT3pobRpi4L3QZdKcdrrGYnT2W9aK/lvDfmXr86Jm/Ll8SUlnJO/FI2affkzCd7+Y1IrEf5kbrsI9YOkOoMWn8TqGUGuYGOo2C2d+AOczFcjFXleSG6hS5BfdY7UPVUGZLg+rEr9HW47Et/K5BtmlcQ8speaQRpBA7L+Wju1ZwcF0xJSRK+95iK0JNYe1SI94a3MdW9vDHs3K4bpXuWPam56jmGvga3YpS4lLamSr2aJq0hEKxiXiHgF7ZfzeiKfc7sTiSd8ZLyy5AyV37SoNGhJxz/pa+46Tg/4eAOxQiQtlVRuYvvx28/bRp/XILkv4ECrn5p7kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB7118.namprd11.prod.outlook.com (2603:10b6:510:216::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 22:54:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 22:54:32 +0000
Date: Tue, 20 Feb 2024 14:54:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Oak Zeng <oak.zeng@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix cast on trace variable again
Message-ID: <20240220225430.GE5347@mdroper-desk1.amr.corp.intel.com>
References: <20240220205607.1873084-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220205607.1873084-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:a03:338::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df42193-6e2b-4adb-58e0-08dc3266e741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sWdIl2eV+zf6dsp2qunJX1FKqdx8PsoR6qXGpPhMLxwSskHOOccQeKSvGRQItyt+O1RfHtMXuE+md8f7JxN0N3RE2Kxn/fFXVjHmbmttFoTGrEa/gxivWGssVw+dkr8OkpGHoW5DYnO7HjSouxKwzH5hNTF8q2zmNFWkLvUtAKD49rlUvunZxg5G1JwyzUfvb2hSDhZmrQlja0l9aEmmbh+eIySfj0IaCM97/TiG2A4aGCMwvG/BOtq0jJQY6PJ7JHcwyRO+OixaQo4Eoiyz48KYMjDw54JuIr5MmZGhbebyV6fGoDMx8CwFxPAcltrdoQ3itpsYd8kDUCmDQFOyj5NMxABpy1Ugr1sw4ALIwVq7hprYmxa72mtTOVnzaPzYOXB0PM3Ika7l4V2qMmFnBlOda65t/3lc7r9SoPvKjUx33GVqssKS3v+wi58NJUVPr/MYuhkskBIKq4qejRfa9rZT+OOyV1ybBWCA7eh66JNDxTIrgA+q3URk50yMIr+OjsJB0X4XEi2SfRS5Qi7gSNM2t5I82P7fHp9rIlNrDOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tnz6h86r0QIxlp0PA4m5e8guZ/lC38lzD0vvYoRvp6z0jWVy7F5kIhQtch?=
 =?iso-8859-1?Q?NfJqibbq+fYFvlDNfe93Q86s+7U9HTliSoC7FKbP3IBX2DUoP6T6S4k1iZ?=
 =?iso-8859-1?Q?8dnCGibdB7QOJJnD00XNNz/lsnPoSBKthpPGKHHIGbV7KCz6PqSxA6w9le?=
 =?iso-8859-1?Q?V634DDo4H+YdhXskNImEGCioU1f9V1Zps5Nd3ZqFG1cAIHcLYJ+a3c8d11?=
 =?iso-8859-1?Q?fHG9b8oGPLz510OZkWyXaVakAGE1ik5cvzNSON+kdqfltJKCFfnWWaIkBu?=
 =?iso-8859-1?Q?YMVFPGt3inrDPhScDmSPttUmEipK6WSvwOL2PMolJPNtiVgVGoCi/EVKm6?=
 =?iso-8859-1?Q?s1QlZthBGMLL3uenyx/ePgbdJq/pbDBZR+7vBompZpZ9g02NKd/ud4slQh?=
 =?iso-8859-1?Q?311k9I7py/65Kn6A2HxH097NWv8akJwxY4YSuIDPSWJSgUDkdGxrFAfmRL?=
 =?iso-8859-1?Q?jdWv1Z9Crb6BWJ2fyZZienBKLk1dDT8QAAKwdGIk1eO8UKEKbpkwSUBXbx?=
 =?iso-8859-1?Q?A0V/6QI3U1/mbTCUM8D6W6vUEf83M18Ck0ecVC4VZ4K1I4amW6OMhWp9G+?=
 =?iso-8859-1?Q?ipIJrlK+zuNFbaLG7Z2cxgq88DZAEsGTaEV2odH4yhmCPX5H8vUcDG4opd?=
 =?iso-8859-1?Q?NrGSK6ZuBqf0MUKFyzH3nrsfzbeUM14+WMN5wiMgtDmLdj6tPGMrqe52CF?=
 =?iso-8859-1?Q?rXR4DmwnkrHWuvEHzg+4U+tURgbOLTJ7plm3+8g7azzmi3oEpzZ5prXCD2?=
 =?iso-8859-1?Q?Xd6W7pkUYKm4jCXzVouK865PFUvFJWAor15IEzMzKNjScFK47XSItOpNP5?=
 =?iso-8859-1?Q?2GyqALZHXfd9MmzZJ9PUyb+ENVrHvgyaUKppOafuDFS7HygGF3Vi79i9ue?=
 =?iso-8859-1?Q?4wGLRG+/Xm7ToM58/o9SudjYBXzBXpF62x/OEjzkIfvBw7x98xGOQ4tNVB?=
 =?iso-8859-1?Q?YkjNgRSSMQAoRiyO5cK0w//IPjITNhodxo0I3mGlUZbuP9gFHqg3QWax+J?=
 =?iso-8859-1?Q?dQ4DSxLcQo4ki77sE5erZQTdyIEmz/0NdERnvPm4ZIw3kjBaYWLfb96xDD?=
 =?iso-8859-1?Q?ry5y7BocEDpRy2DKzUYOxlO9/Wm9zfnYrm7iygIHwTDlonbK5GYEHHxwjZ?=
 =?iso-8859-1?Q?jff6mheJP2AxhYKi+iyjbmQp2IVytCxISkyzA/Tzb6Hfo6ik+jgURZhZEj?=
 =?iso-8859-1?Q?Akhfziy2/jc4J9CqryzZQAUMweV89zmCBiZVRZp3WNmkEs6RQqNINI+yfl?=
 =?iso-8859-1?Q?gc0yp9rFU2Ov3TYViYfI3lyA8KYbUAmzHhXH+0AL63rtfOwuDIVC4oUljt?=
 =?iso-8859-1?Q?39bnAYCQXiY7J32y0AJPje62sqh56efv8lfKhapHfmEoQjO6XsmXQ5kXKE?=
 =?iso-8859-1?Q?SP0Z4rMIVNhNBiRbJvbn//4tPThq3sDD81UWjqpQFzcVCEQxZgEsEMhRXG?=
 =?iso-8859-1?Q?Nmrlp+rBIStVGUPKxByLGST+y+96sId1bFgNKVnZrYV1DTtxYpPSNRlA19?=
 =?iso-8859-1?Q?3CjTozJgfbSHXZ8eLgRJtwZiNUhnr9rqxisdsUV1Tgzv13TZfxbxHzE7cH?=
 =?iso-8859-1?Q?HtnW/M7LY1bNHksVh4mYzYu7xGQ845ysfk2sm5EI/gGRSCan2uu0thAtNf?=
 =?iso-8859-1?Q?4ZpG1ifI1WRQEt2XGbHc6CSdnoWQsbaoz+R5s8h6P4bnXyeE6lGyj2Eg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df42193-6e2b-4adb-58e0-08dc3266e741
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 22:54:32.8741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKzdRvRc1gvK5t+su7MuiW/acqiSzDHNfQ3FcNdJSDH4oVaM8AqudSoxLl1K+6v4WFGEPbYAn7z8Ck2qeOP+NQ/OweVFcTXo5rYl5hckP/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7118
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

On Tue, Feb 20, 2024 at 12:56:07PM -0800, Lucas De Marchi wrote:
> Same fix as commit 8d038f49c1f3 ("drm/xe: Fix cast on trace variable")
> that has been inadvertently reverted by a later commit.
> 
> Fixes: a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 0cce98a6b14b..e43c3bde3202 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -32,7 +32,7 @@ DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>  			     ),
>  
>  		    TP_fast_assign(
> -			   __entry->fence = (u64)fence;
> +			   __entry->fence = (unsigned long)fence;
>  			   __entry->seqno = fence->seqno;
>  			   ),
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
