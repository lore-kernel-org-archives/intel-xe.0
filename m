Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC998606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 19:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n/wwZrFZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A487C10E055;
	Tue, 27 Oct 2026 19:34:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5539F10F7C6
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 19:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793129639; x=1824665639;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r6dj3RBIPkmGweqtCGtwv2PsSAyqJI7GXO1/UXai6PM=;
 b=n/wwZrFZRSD/YkO/u6vkxz2o05tPeuSIodQUWilJU4CDZFAhMZ02/ez1
 +FX4onf4qpUbu7TVPWfNGXYNLi7NuSe3XpH0bdo2U5jQQZdxD60T4eysJ
 Iwz/sKRyq4OCfWfl+kSaFC1VRdDCVKaDyjzb3gQQAwGg8OZ4pm0eHLlhf
 etMAiXtQRdaWHDSg6cDSCMoQIjMp78WNZ+0y8yDW0F1pgNuTorLvuJ6PF
 6xP120UhXgoZPAz/NECwm8ABLWyLxqjbUbe0ckmJvBOLOeDQUMVP11cwA
 M79a9H26PaHDZDotmAoEW4g40ANS1IYTNVpQPRNPkpFmBpnqeAW61+1fp g==;
X-CSE-ConnectionGUID: JKiELoafRtywXnNDAdqWdQ==
X-CSE-MsgGUID: 6JQEtyDbT9WXVc4N01SQ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1749240"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1749240"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:33:59 -0700
X-CSE-ConnectionGUID: M46+oTh2Tiqzg/xm68Pymw==
X-CSE-MsgGUID: j8ndo9H7RE+ochkE14jd+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5155589"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 12:33:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:33:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 12:33:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 12:33:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+s3lTUx7o2M5WZh3pOzqkAjquOQAFUmgll+3jlA+xtvTm2TXQ95gkDEfmAwvAAbBI2ovvnnqWi17exYGMy89FOlTffHAqN0hJj2pOJ0eojlO0XULf8qoyxoNCSyhjBW3PC+XCsT+KNCPTinxl2Hd3hAk9OcK09zeDq3Mr4N+5i7P2K561jNV5Wlb8Z1qCCXgh0p8uBoS3k1yV7ecA/ehTP3gdVKrilx5xH+KAkcrfB6LazaRD+wox8eSt1yBoN1qeBLt2lOF6vHwTicIzB0BNIa3uXPdifMGiEbA5zuwnFbnhUnNWphqLzN2aVUtv1jfEGosZ9hyBCRbRDAC/ErNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUdv7QepnmkjIa1KsGdvjZlkKiLP742DX0e3QQrOJ9s=;
 b=f/PGXW+Qiz4DgWZd2rLyAtBXCGUMlNpjPNY4MWhkMHBn0sJodp6cAdLE9BdWXoME0eht+l8uLsZ1Es35/ExrHiGcj0PllgiSpTt3T5qfLu8JTRN8I1HcMKtS0w5eEIXgL4b15KtRUXIEbMuoS2l6CxmO8/0VWrSsZCvR5k+0MHpObhmXMqGFWhqFQKCiJYdBMH3kXHSwd7s1nKE5skXsUQo1pNqep/Rcg33LxnBOOlU0+6gtsxE6O15dGB2au0Jg5sCXLHNz/8xfLtL8gu1WknBXvr9y6wM8lHZCG3r9uB08HuOtYvseI+NrW2ghwjnZ+2xlncXupfhYOvQqQUncTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by DS7PR11MB6296.namprd11.prod.outlook.com
 (2603:10b6:8:94::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:33:53 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 19:33:53 +0000
Date: Tue, 27 Oct 2026 12:33:51 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/10] drm/xe: Drop comment about MAXCNT when calling
 adjust_idledly()
Message-ID: <20261027193351.GF203565@msatwood-mobl>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
 <20261023-wa_16031259911-v1-7-b0453f79c4e1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261023-wa_16031259911-v1-7-b0453f79c4e1@intel.com>
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|DS7PR11MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: fd13be5e-3ef5-4a14-93cd-08df34613c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|10070799003|1800799024|376014|22082099003|18002099003|261026121527099003|56012099006|261021123027099003|11063799006|4143699003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: KPIJUuzSAvvZHADNsA2ZENc7JQJV2ooy5R5Mn/8n6On4phZqySxQVfyByTZ3CY6wIlJXbJH2qT+AMCDmV6+uopBorA6UVGNr3jwl8x1n2vBZdFvc1zPvlSveC7rFXfe26rPF/Qangh9e6xG5Tssbw/7f+7TUykjWKoUKa0uSDUksZ3NaIczH3COQ2jLTT5nL/09IjlgA7O66T7L7mADEgbdK1iCOQyRCNd5WJ8uS5ats+31q9xciHdtvDAi71SeaqrT6697Lj5/zz3T+IfSvULSXszNHbVvaFQn3ciHCNZp7lIl/79U7h2v8vS0UuyWzfkkb1ykJXqxWoo8Q8la1e8RaNSiu7z+sDET0dhJE73TTCfkWzEc1jx123cF/uUal1LFNt5OX5NDeTmacTLnKyq9pz+LEukX2Z20OYDOBr3rvTeWkJonDsPeDr9Wx0HawGkUDOjfWIcxgPYI4iS2grMFyfUP1bTrAskWjwNi1ddOMVboAER6Rtt1im63abKssLeLVYGpzUppT4PtrXPTZQGwUo9/SwqUL5pifpFcK476st6Ccmey45d9vwcCD4ChAHrQkCbx9heRHm28GRaY27mTDWhv1jNFQ9px2suBx6wNU2sJ+g11nSF6yJ+G76jPWW0MZf44NxEKfBiQttB6adZiE+C77yybQv646BN1JW1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(22082099003)(18002099003)(261026121527099003)(56012099006)(261021123027099003)(11063799006)(4143699003)(10067099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pYdHVLTtoiMFnBwas3fnce6+fvJ6VhYqldYNcPlPyb2ixDOH3mysw1PDeSVQ?=
 =?us-ascii?Q?EIz1EAKDOq5nQQ6adW8Qv/q/HHgVNknmJon8/DZOCMu2SghrFLwHcfWnwGrK?=
 =?us-ascii?Q?/Ng45UAStEuLR45uqF+Uf/Op1gECwothVqP0ET2xYf45IUe8ZXkIn5ExoMl2?=
 =?us-ascii?Q?a1ZFcfJk/F2jD6rr2OUhbG1i8Q4xE1K3pLcQzaHD5PuirCdmn8zf/hzmha8Q?=
 =?us-ascii?Q?KYmG1FKc/3GLfnHQFEERPYjpQRqBqvbRtyhrbuVJ6+NbCh/kdrRs7kZmOwru?=
 =?us-ascii?Q?MzyU+HAm7TpaAyUT4wwKNTLx1HDaF/ml/0Ez/x/MT2v9M5e813ahBHPKwr/9?=
 =?us-ascii?Q?HA94QQZ6HPP/RmGh3dikosUA0MVzapLWCvWRMSXIX1wZBELk3RV6QjMoYdpD?=
 =?us-ascii?Q?dcQJAFewHJUnuEDG1S7IDcpcSkrQ0mwr9IiApwFKGfal0IJYGLFoV3TRBH/T?=
 =?us-ascii?Q?F5JkzY0E1mTKoxBF9hWvqkJ++gMV13G4L1fPOnIUb0GBQ2Vcbjn2XeD2hgTJ?=
 =?us-ascii?Q?WwERifpFBYf8e1JiwpSHcG6hJngR2bia1K5QkeDk2uW9Oro4SNA+GnnNj4pn?=
 =?us-ascii?Q?+9qivJOs7J5S+vsXiGbxq1CHxy/j3YVlsxDEFaE/vw1PHVT40jVKOJC8ud0+?=
 =?us-ascii?Q?5zLlabOTNcQcimskJKRc1hMfy+S5pnr36YjpgFEKLFxfsMkI3erEOR3jyQZP?=
 =?us-ascii?Q?3FwH8v2BNsAqHwfEOtdvHh6kJyydmqUermpgDlx8oxHO4VUqkRdSL9zesxXk?=
 =?us-ascii?Q?7WHyRNsxl0oHDATDM73qFfVAOyoxNpTEQZDtOXpkEW5CG5GSd1CsozBiiupq?=
 =?us-ascii?Q?PQNOWvm4tmREQf/mAQ6GKn6TXANc8R0myrY0y/6lr5EN3yZUpsPQ25cTlyDh?=
 =?us-ascii?Q?1/Ij//MCU0Q+ev+A7S+RdKbtsdcibk3ELIl4Asb9nZ41iv6vRsHPChVOAjR/?=
 =?us-ascii?Q?rsLb0lvTI3jjSXaNbjSDxhI0CWAXdkfNqPyNcL6I8io+z7lGETJgysNnjqIM?=
 =?us-ascii?Q?C66vbFFuqUhLEJlpguZoGWejZ2Mb7riCN62x39TO38YJNJP3C+XxuBADWn2y?=
 =?us-ascii?Q?pXipl9Z5B23LJ28t3eDseTU1FNS05hSADJZwEzgjZu+NVVqpSNk8g2+ghqEf?=
 =?us-ascii?Q?9zmr0f2LDbwopEzK6wcpnMxpv1Lx65I8nCKNsUn7MOesNMM0/x/LCVeYiVaL?=
 =?us-ascii?Q?4n84lHqClG2+BwCBmJyD/MfyVsWgPZ8iWv4gQyy2Bx8Tf+lz+HzqaTfVxiKz?=
 =?us-ascii?Q?JpFzby4srtt6IVzQS/HEfqhIo6zs0lHeqlXjkX/pb/VokJ0KL5PAd05IHB1N?=
 =?us-ascii?Q?TBYeiiaGSeNu/yK4ZuHd2TSiq1m7YTF44FP/njy1AjXSNNRAxFn3UpQ26HR3?=
 =?us-ascii?Q?64rEs7RUoMZbftDWxlrAqouJcvLIFvx0I7M/+z5HCi6eJTWLZJwAILWy9cDY?=
 =?us-ascii?Q?6BESUmbSDNHjs5iGT/dYLKWfII4reYscaIkpUKB0vLUuEHXwiO8yVhNptLDa?=
 =?us-ascii?Q?19CLkbeocquj3N0OfrhGB84SKkBjLV34DdxkgWZQRxcwpZr1yWAi3e2DEq2u?=
 =?us-ascii?Q?To8TG+rEgxgsS+A2gK9TBx0ZLS7mCElrseKeg/6gnqe5Ly3Xgq9XDGUBHKNv?=
 =?us-ascii?Q?r51r63kSbDY472eTjNS/3EuMvQUyf6yqbwiJqRNUx5jnu+Fdwhhe5YajeCgR?=
 =?us-ascii?Q?IVxk5LdggPfd0S6Cj/ZnzT0kfnF5bseGnqr80XCuji/7cWr7cTnrqgQyIJ+k?=
 =?us-ascii?Q?MT5eHOPwsm6gRBNDo9NIzLv8xzjKZz8pYDuqpVqXN+X7j5v+XV91tuKQPH64?=
X-MS-Exchange-AntiSpam-MessageData-1: ppG6hJ+3H8/feOGLn2ZHGDlxFS99CWQbh+A=
X-Exchange-RoutingPolicyChecked: dXucoUtojwi+Pk5Iyeurl22dr9aJnU76FUJpG/296a/bjdM8kcHfGdIQRGjsdo7YJPq1DleSr7Nl1GpN6LWexkRFuuB5DUfaDQxMM8W5qZBmHEWg6EQdZL+tDMcWFV5SK1j9eFVdmbAe6ORZSUgVkLyhk2mPBoCARdTvTkgDN2orao3Og4DpYfJRF1crl8zvao6NfPMIGTfF6VaBJUJFz8MzcvSQWjjDvXFJPNsNtIRp0mlzZPK5m3RCXq91BBuE4ImOTAbIfEa69mazbvJhgDri1A7r8Y69xYtmZm0Y2x0qiN5nSrnJRiStOC0H7UkbDXY95TZYDFu6G3/8BbkdiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd13be5e-3ef5-4a14-93cd-08df34613c2c
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:33:53.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOGoLzvX5L09MfoQ6+Z2GBE/cCmj/EcApEM3MIqWmduC6488wmMx1EgFI0Pi9vDT/8QRwLHgdCN2bezixpauB5gRd3SQSC9bXviutLWduUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 06:09:35PM -0300, Gustavo Sousa wrote:
> The adjust_idledly() function does more than what the comment on the
> call site says.  Furthermore, that comment seems unnecessary; if
> anything, some documentation at the function definition would be
> better, but even that doesn't seem terribly necessary.  Let's just
> drop the comment.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index ffd6ef9f96f4..18c8f88739d5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -719,7 +719,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  			xe_hw_engine_enable_ring(hwe);
>  	}
>  
> -	/* Ensure IDLEDLY is lower than MAXCNT */
I don't care for just the deletion here, either add a function doc for adjust
idledly, or expand the comment to something like "entry point for workarounds
and functionaly to adjust idledly".

MattA
>  	adjust_idledly(hwe);
>  
>  	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
> 
> -- 
> 2.56.0
> 
