Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C13CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 16:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA1110EAD4;
	Fri, 24 Oct 2025 16:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8INS3W1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E300C10EAD4
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761322425; x=1792858425;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hBtbzs6O4g6fySmYwMp/Gma4c86DWHnzjr2OJ0ckoCQ=;
 b=X8INS3W1fP1mTTZTu6t3EzopYx/R25roEldtoa9Y+1Zq14Z2S2ewA0g5
 s8K3lTglKIzXdUz+4utKFNQtziXfHDI2lS1OPViVG3A7wh6zrstu8vRVz
 fcOOkWiYuXHx7PXTD6A8Ntp6pKcfz13VthXQED6qU2CedXobWQqLQvOSv
 tTn8sllXmbarkKTC98x/+nzXcQDbZeTxsg9XA2UWD2jWUmvHTuGHI6roZ
 FLbgyzL8eZHc96YFTk2tyE2jFyVD/NkfF15W6F3yIveLsNtbemvUdss6H
 K0zbnU1x0w7Vw0rk/v/Brrlig+3jkPu16DimQfInsD4bwWYfdLk3ot6wt w==;
X-CSE-ConnectionGUID: drax+qJhS/qCek1tLetH8A==
X-CSE-MsgGUID: xRWx89vFTUK/ivXJZlQ3Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51082856"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="51082856"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 09:13:44 -0700
X-CSE-ConnectionGUID: S0nnGsC9Tp2uouiw6s70oQ==
X-CSE-MsgGUID: bUELscBTREyAQqtIK2QGhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="189706118"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 09:13:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 09:13:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 09:13:43 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 09:13:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mW2Yk16olIoqULi10T4DNSU3pbZWM2bohzf2lfnd4oUbimp0zenZ1npD+StUR4tGA+DrTrW8B65D58CezPzHP54NmFwa907kBZQsn9Rlav4smU8kZRC0hUrwbDajfJ0fAjICIkVXKMQ5Svn1URTNrAqTpJ0TPC5xMv0r9R0s2MDc7e6uAB2LrI1GctFZ3CQw+bH9MntkOR5Uwz3kS7sj0DUVY7RwRxNkDWHcFf7tGQsjVVD7rP9fxjdNqbRjJ3O5GJ+rhFfKqmg2B0olzOh8ktl7eaM2wRM+WdOWqcJAcs4cwY/UtpWH6oPNDnLFB046OE4xtmLfFIMva0qWf0FE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBtbzs6O4g6fySmYwMp/Gma4c86DWHnzjr2OJ0ckoCQ=;
 b=ESTkQ97Z/fQcspw0oxqcs7LvRvM5ZLQseJLX4W+ibGFMrKUbeMsr9K4ehG/VcjYbGCEYrPay45rCatCL2fv+CABObhAaSa4uQ0mdTB+csXlCMvhxShKwCEB63cHCnC4bfwlVXXTqHdzjC4ln42gPxUFzkl7ifDPnR5DLvP5v+Ru6pSru/KLTo92k1NhacJG1eFP+xYdt/9xB7viSCSK0HmMe/sK8mLGR3zCUdXQVqGLe4IRJHqUhiEibceE/36B+++LjSDjjRW3MlGG76u3SjvqpQwNxCjg8f+TEbMa7FKMVEQFCVznTQcbobNKe8mlW1BnlOrletFlgeWOOKRZYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:13:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:13:40 +0000
Date: Fri, 24 Oct 2025 11:13:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe/gt_throttle: Always read and mask
Message-ID: <v2hpmt7nvj3bgkqhqbdp34hcdxum5rzcvwzvqmoj4p23a5jshg@7lpgbshqsyxi>
References: <20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com>
 <20251023-gt-throttle-cri-v1-3-9f36f3c8861c@intel.com>
 <aPsY9-0Uak8-g5Nk@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aPsY9-0Uak8-g5Nk@black.igk.intel.com>
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c891976-08f6-4e37-13fe-08de13184be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nSDGvf4VX4/qQ/x3paXZRIbqG7uxhvSFBKGIXuOIPxIFPOQEwGi+phlIdKz5?=
 =?us-ascii?Q?tHgWp5Y7kmL9IXhDKplh8DZUPCfbGMvfHgmNMNBzjgL0QZy722GARrhiIkj3?=
 =?us-ascii?Q?NEIXadjgwzf3/yeTG1azt4pyPBcxlPL+pnaaoNCoJJpJc9JWsGa6QsJO66hX?=
 =?us-ascii?Q?ndkOZ0SX2hWUTT6Q4bMb6qRSaNWRnIqlC48NYFrAZnUvg0c05eK+2RxHzwZI?=
 =?us-ascii?Q?JqYG6RE1gTsJ4uEvU7BBC7m+0P7FSW/+njWvc4wF/lM4ui9/PwB+9wxXkR0V?=
 =?us-ascii?Q?XkoTNImaTVjXfczAyREmSOmf9OS7SfoIrbaAEt2CBdV/deI3E4zbd6b5alw3?=
 =?us-ascii?Q?i/WFQGFKUbZRUgQW50Vy0cshDWUtMSlMf7RwqUysmtfoUaLIoog+L/WRMcjC?=
 =?us-ascii?Q?z2tMOiZ0iBMFu4yA57syoqUymDymj6EWG/lUjjwJAB/LB0Ul2OjfGF86N+7p?=
 =?us-ascii?Q?dwEr4S6b5cAGbZJblqvYUKdvwflerWIRZN+Zu6RrhxIqOdNR9JwkbvDjpwIg?=
 =?us-ascii?Q?mWjLnKu5mA8n1TcefzcEMMeGvGTzUE73ogSlhkSFEk6AFNa9XguJV6wJ6Tf3?=
 =?us-ascii?Q?XP7dehXUqcNDIAaCOw1fr+Jrx3eyEFUaUAKn4yGpkXkWN1vXKrmeSwB24b2H?=
 =?us-ascii?Q?q+Xk947QgP/DOfI/bYOe4PyKyeMrUGdyJpt1ifV/IsVNxjJnWyW5U1LLETjk?=
 =?us-ascii?Q?Z4Lg9G3vNHnA+s+vmRlXKUaD00+UQvCmtKnaO1QEUqC8lyhDvGhzzj4g3M6s?=
 =?us-ascii?Q?NUa57lH2LKU9Mlq9LawTxmr8NWiN7G7+Be2zk7jH6S1UF5oB7n+tbC3nQrMS?=
 =?us-ascii?Q?1C2X39u90NO48kCWtUWs3jRPcLefAm65bUQ0AOJjndB29xQB+a5GZCQsqRKL?=
 =?us-ascii?Q?X+F8NEJB39+LRvHoYE/myreBTrtkTpNNEgLDBLekMKvhxsAkrqBouBEG4mQQ?=
 =?us-ascii?Q?pBHWUV9jhxf461Zwkf8NGR2xL6QhOPHYIKbVu/IPk4tnodhpkvCWNefeFteg?=
 =?us-ascii?Q?/w1z4zB1K7R3TrTcuNVQqL+7f8twx3/5bGM/86th7p6+Fg5Md4n60drRXp5T?=
 =?us-ascii?Q?ZKXPjSsw1hN2a75OQiUemKY6boTAfV1pKKvK1jP4nwK9Ck+4Nc1IIHoWueMQ?=
 =?us-ascii?Q?LJZ2m27s2CdubxK/vsE+j6iYDSS15JspOEuMXHFTlt+2oUW2yMBxWlQX/yXr?=
 =?us-ascii?Q?bXpaJ2hyHfW+3NmV2wCTp1C5qzNZr7oRr1k3kT1sF+31Ls28vfTAHcg+F0Zs?=
 =?us-ascii?Q?LUK2/7xwtGcw+N8M7dWLvD3HvJNNXpBwSYzODKtGyfYLlWjlbXvl5PadyNtW?=
 =?us-ascii?Q?pUI9NQKm6bI7YQIpFd8yd0IqVgnrnuLkm8ogN3DqtRVLEKPhTfgjUQkJT8wp?=
 =?us-ascii?Q?6jv3a4+O0HJgeFI/e1guocW96RBmlQ/VlfH01UO+1B3+QY/fuqApDC6MHXhy?=
 =?us-ascii?Q?07uufES6V1K94Hh9v1LyZOUTt5Gk2Oa9OR+9VOkX8rU7bzYYfHdZbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?enCMNwxV7MG7ss+gQQDp6D2B+QDBr1K3JJYyw8W0eH/s6UYjPQLFLD20F0t9?=
 =?us-ascii?Q?xJO1DAwYGXKjXkqOse8nKXb9DMyAydGrsXhN6ZSn/ooGGE0T81plMSSlkcOl?=
 =?us-ascii?Q?wZ0BhettxfxpJ5cOC1idVL7zTBxIKFkSNcoKv/iSZdOqeKmVHTg5Uf6glPMl?=
 =?us-ascii?Q?2AtI0OEafQsAL13eZETaW0xB5lsxaf8ZxDh6miD1uuQC383MYKoaaby1zogB?=
 =?us-ascii?Q?AsEfw2eNU+7mLGIcW4WxjlOv35umRF4CW59m12/nZ66AmI1EOSN9Q6WSTSan?=
 =?us-ascii?Q?68nsZoUDetL7RUXzn4krXRHPGEn/qT+On4AWnrjuR+24c+RJsQuEhY4YYytW?=
 =?us-ascii?Q?I5N9gTa/6G1xXZUyPzugFgVETSq4ffCcOR4ARjOKFYkLbc2OSwOGnNTz1lFD?=
 =?us-ascii?Q?JqFvz+MTNpOkH2Mp6oIuBTqY6ZPmTwK5vpEbyFIznT4MSxugM5A3I48nm/Qs?=
 =?us-ascii?Q?Goq7CSEnGMkb9iC+DRfMd2ZrT3EoIj3nYoxu8f9PC1HADGZRqQY4t6LzunXC?=
 =?us-ascii?Q?wnSeiFxRtmsl8Pthd8u0YlSdaL25juwmwu7aARhYHvWm+mwt+rc4CSVOhh57?=
 =?us-ascii?Q?WPU0Re6LXzebFDPsYT7dDH+XWQQCluO416Q7xT07R3MT/6hiFzPYx7SWzR4s?=
 =?us-ascii?Q?U00yOG3Df5eOeYYf7+0h9icw/M3X5RfqvGsBfVFqmLHFddHHuzQObJwiboE0?=
 =?us-ascii?Q?AxTufem+iFU5/P1ZP3DQN1l9OVW9qmGYiVPRb1tVUqTFisSNtBbWTTJB6mhn?=
 =?us-ascii?Q?D2KcJFgJlJAEsJUBEFwBZWYvVGX1X3VidsC4cHxL7u7dtkzkGfr3LFkHAJHN?=
 =?us-ascii?Q?cgw04Ua5J4kbV7k7sAf6my2ZU60PgCM3lrM++jR/f9n3p0zrgecfa55NiJwh?=
 =?us-ascii?Q?9PVFe3OSwR1YDczCPSijPoglmqlFjPe3dKyXh5ubyoJjAPkWWCPH38IMNpk0?=
 =?us-ascii?Q?oN15LA4wCuonZ0XfVQ/nLRiusseKZIIX4Wunbku9dc7Ls6zbX+jC8wvlXzbU?=
 =?us-ascii?Q?xnTyjWJgsenxdtRTHbxbRFMaj7+w7QCgyCeE+dmTNkfxe+PDqnpzAoKy+IgM?=
 =?us-ascii?Q?TF4zI5lijsgqo2+hc/Z6BFTsmJuThDQ0cPepYvH+z+/H7ulKMCfyRdlFLGad?=
 =?us-ascii?Q?3bNHJh+LkERecj7Kl5t/FqdgXr0l7mo5YL9aTE0+ufn0wwvrRysgGVd1ZV32?=
 =?us-ascii?Q?bED2V41SMsr5bRJ6LDmG1ceCbMNNP/yuGH9YSqu0edL4ZOkj3nLFgVGupXpp?=
 =?us-ascii?Q?uwJNl/L6jHHpwBRgJ/I+ctGrBSmP8+/47V55k1ZVqvr0K30He9bPzYlnIx2/?=
 =?us-ascii?Q?8I7FQ6PZBKPfmWbYFoZYkidlUY2c7qPN0nS3TKCeMi2u5ZTCMs9D9de5GQOn?=
 =?us-ascii?Q?DhQxR2jR39ytm8KiPtwVq3YI52WxdPyLCURGQugAE9PEfmmApR6b4E8yYedd?=
 =?us-ascii?Q?F2rik1Hy0niOTzsAPKJwkHI6Du9MHyO8aEHCzVSiBXP5sz7dDQdLwqJzYGtW?=
 =?us-ascii?Q?DfEwV0/YNxoIhpDW9SkJyrtjVuV63hbeJxl0d/1WeJ6gK8U63Kvh44PqKz9O?=
 =?us-ascii?Q?3XbdCdAgJGy8Wcw7BeLnT0vL+OUlACRKhpmsiiJUM1IA80lfvnDMgHNf/Z6M?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c891976-08f6-4e37-13fe-08de13184be3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:13:40.8268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SxPdsq4nrABS1sle/zRk4HRYhE8PH7IfIzkoE4Th47izEoLbHXexBO8alajizSEddT2m78HsUDFU/rmhegxMJW9eAAXGK3gfl5nbuRzu2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
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

On Fri, Oct 24, 2025 at 08:13:11AM +0200, Raag Jadav wrote:
>On Thu, Oct 23, 2025 at 09:56:56AM -0700, Lucas De Marchi wrote:
>> Use a single function to read and mask the value the callers will be
>> interested in. This reduces the risk of a caller using a plain call to
>> xe_gt_throttle_get_limit_reasons() without applying any mask, which can
>> return unexpected bits for future platforms.
>>
>> Select which reg and mask it's going to be used according to the
>> platform and gt type and always use that one function.
>>
>> There was an odd xe_gt_dbg() when reading the status, which is not done
>> for any other throttle/* sysfs file, so just make the status be as
>> special as everybody else.
>
>This was to debug the rather controvercial design choice[1], but discussion
>seems have died down and this is no longer needed.
>
>[1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/

I read the thread again and will think about it.


>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Raag Jadav <raag.jadav@intel.com>

thanks
Lucas De Marchi
