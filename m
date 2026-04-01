Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C94810F6FDB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E777A10E045;
	Wed,  1 Apr 2026 22:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9jsHqEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3666410E045
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775080880; x=1806616880;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kEFum/t8KopZQ8rROdHE8Gv72BXY6fmhqSsiD1KKw8g=;
 b=S9jsHqEY9sGyKUuuS4vUx8MQF978YoninmDUERC1PWI5tE3dEb+LpPfq
 7d4TMWpoWoxWIxAezfe5AzvcuyO4lCUlJlRJ/DiThw9prRmLf9O415Sa0
 E0C+2KeDg4o6tra0p1K3JVeLT//R7abdwm+bT9EYEtTT2G2EGMT0GMY/l
 /cWS023ZUIfkLCV2u0rV3otU9t+uudWpLhBHPi60xHKvN0FBeM1BDL+t2
 1kwonrtNlgWYgjhLpvhCfYrBKHugkWa2uV+ycwPECRzzxSDLJnIOpPWU3
 s/yp+7cJYGC8jOtxkfIlSrrtZqZUsxmJAHHVlbLoJIFxArJRl/Rpd1kY9 w==;
X-CSE-ConnectionGUID: X7mboY9DQl+zPClVscUCwQ==
X-CSE-MsgGUID: g3rVpvXeTKq/Xvmx2iUORA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93715363"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="93715363"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:01:19 -0700
X-CSE-ConnectionGUID: VpELaxe/S22b+QBNzu7r2g==
X-CSE-MsgGUID: 8ELBxWiaQmKhRWHpM3zmEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="227052230"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:01:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:01:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:01:17 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNsA33O4Vvsn6Lu1aUjzfkoDOwnu0IlRpVN19Mo7pIHJBS9D+CyiR/lO46hCdilqYNVI3Eu6GjvstASWRUlw6O+F6LkhqxUoUnX0sR4dIlr/sSi0vNNpeULrYz2FV2YXBdUmPCKqdGPiFzWQT7zZXeuvuWfCr1dTnElmkXp4AKUXwpQaNiU/4JLx7VsMidAW5DWl0rogD4CT6CUMbMqEbS9TXQSD+5vh7QMk6oLL/oNGvGa/UG3BsbHjz9P4D5oOtWj0Q8Sw6jmR28reQsoksg+ozqN2o6CGs1pCP4WuQ5jcUtKFJtQIvljae6oE0O517T0nhScfj4gQ8hYnsQpejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrjQotMfD+KzWuD5f2Yod0rJYsIRhnNPc8ymCaLcmyE=;
 b=M053QYHnoJBkQX5hX0qY/SGhkTUUjKXxxnCaBIrPMSx04yMov04kXXewD0bqOryvs4/0FRr3gb5gPKEPNOYK7wYIJYUwloopXdkZVvmI8sm6JirHgnJJ4rsaB2c255L3xGOHiL8MzrP40TIz8Y/yTREq3ZbiK9p/rTtwtmlDeMyvCvuUrCbHmhn0vNB/vba9n6yN3QbyV561BcAR7iKTv1XdLpVwNp5scGCL1/V1VT8ugnIY78G5Kg519ahpni4SQtrp5x6txmgMfLy2zwhfn/KKNrTHQw351GWcdcQ8Gt/FSQF38sYzhWviHD2+GM41Yy4dRABOEGNrL3EZG/t9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DSWPR11MB9738.namprd11.prod.outlook.com (2603:10b6:8:353::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 22:01:14 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:01:14 +0000
Date: Wed, 1 Apr 2026 15:01:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 08/15] drm/xe: Implement xe_access_counter_queue_work
Message-ID: <ac2VoA9KC8vB/C5A@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-9-himal.prasad.ghimiray@intel.com>
 <ac2Jy0G6+Q9bnMmo@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac2Jy0G6+Q9bnMmo@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:303:b7::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DSWPR11MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d25353-18f4-4e64-52c4-08de903a316e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 6eRnG4GiIoGuUsbf1n2ScHNyYW2lLVP6tZThqUrLmlOTFHwOoLlpZClQJ12hUDYB8A7JlH7SjPr2alFGvCn8OwrNI00dWNJy1q0GmdqXz4YuExyoXOXbw2WYe3rm9OVdbdRynuYJ1LzuvXF2G/aOvJ9bdErhiOZ2UBFOhoKPNggSdzwh1rhMWTEV+FizX/Wy/Tsy3WPBjax0LilWYL86N/ATNKUuMp0dKF0rTo01cYuuhsvgUlAzb664EoxrHodjXsQLx33iQt4TpEwUrZ3MKnI6lSd4KJWgtn9wfhSCQS0lpd/zPQwoFlf0R32gP4FTPmwRVFVJflrkAEo/ZGAE2VExRB/Z54DE7dFqMcIYMcF2jaeKDU4VvUDI7JqhrnHV6QKTLTtuaoN3A/0+zr92nMH+M8yPlmwIoVLnB0no5v8HI6cuW7YqZt5cudjDz/uZ63Wv66dchInASPJDN+KJXoVGolbv1xhgfDzBK3LutGaQYfradHPsFLRaVmlyrhhr+xYTB0WBWk3j+b+vSAJoikl8kxbIpFzCVaqPmIkotLde3BCrs30pgzPN2I2VwTMpwB6Pyu73x+WYS6H/kcLFo2yM9MBjS+BpPZ1VroDC/QIMV77K1fVae2GVtHuSKqGRG4Cv8RVyV6G2Z7lVqKj5CFeLyD6hYIUrLHEAs0Afl+/Xx+Z5+whlwvWomHF9dZO5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25pMUViZnR6c2x0WjNXWkVzbmJXU01LaTJjVkZQeDVzYWhJMXpNUTM0YVh3?=
 =?utf-8?B?MktJVXMzTlY2NHBCS08vMGFWbmhLY2tjT3FjdnhEMFRZNmt0S3BtT1FHaGhh?=
 =?utf-8?B?Z2NYNUFhVmp2S2gxQmRJUFppWUhFOS96c01SSnltV2V0WlhFY1hFSlY5Mll6?=
 =?utf-8?B?SHlGbUthVzRHTmlxNnl4Ym9tYVVZa0NPYk9sOTNCeFBrd3psNzZUdHF0dDZi?=
 =?utf-8?B?TzRRWXUvQ3c5NkE4LzNWbXNwcVpKTXFJaWs3WSsvS2lTa2ozY0lZMzUyZTZj?=
 =?utf-8?B?WUxTOTNQcFBONVhhWTN1cUptdXM5ZFlENUZsMCtYOTk1SWY0VW9JRmNQU251?=
 =?utf-8?B?clZWSUs0Z3hRcHUyUnN6eG1hYlc3Ym5jcTgzQ1IwQnVsNnVURmFtTmVxa2hl?=
 =?utf-8?B?aWdBUng5YkFzbVdOd1ptRHBaSm96RWI5SXlnRFhMcUFobjR6ZHpPa3pSb1g3?=
 =?utf-8?B?dEtFR1dQbTljb3dxa2RVSTdraXZkbGNCZDJwdTVSL0twRUJmSnJIOWhCMXIv?=
 =?utf-8?B?SlJUb3ZkZ1hSQ2FzOEc0T2xTMXhvSFpzSGxXL0Q4MVNMbVp2MlQ3Zit3S1hw?=
 =?utf-8?B?dG1xWkRiN3pFU0tMQ0loWDhqZVQ4RE9LTHExRDViOVZ5RmZCT2hPbGxkRzk1?=
 =?utf-8?B?TU9pV2o3RnBid0JLTW5oejMxNTVaNnpDa09TcEFaQWJDVXBMOW9FMG9nd1BI?=
 =?utf-8?B?Vjg2TVV2M1drY2lqTDZRdmcwd0JSSVJ5VC81YUEyMk1IbEdaN3JkV0U5aFRB?=
 =?utf-8?B?YlVmOUczakpaR211K2UrKy9Zb1dmMDBoanZGVGVuV2YrcmlqKzlIK3VxQllQ?=
 =?utf-8?B?Q2tJSGVycmpsRnNoVmJYbjhKcDNKRFRTZWhOLzNHVDBVbm5zV0N0aDJUUW9s?=
 =?utf-8?B?bWVQcjZmdzhpUlA1VkV0cjVxVXJkbktYeHJjM2lhWFNuY1IwTWNab0NvbVhV?=
 =?utf-8?B?VE5oUEdUYTl5L1htSmFTcWdzdURMU0grOTRMcWpLcHViSDg0QXhWOEQxc2RQ?=
 =?utf-8?B?Zk8wS1VyREl6TGJjMGZ4MmF4eHhlU3JWZ01WeHh1NjhIU2w2VXBUeW14SzlM?=
 =?utf-8?B?amQvZHBFMkJpelVONjdUdGtjbUVoZDhOUjVScnl5M3h3aDM3djEzRlVPL2lN?=
 =?utf-8?B?NnJDejEzTFpjeTRRMmpsV2xhbDB4QkNRU0FZbU1pWkI0S2hjaG8vVXlwOTVQ?=
 =?utf-8?B?SEpXQlVFUEdYOVRFc1A3SDRRZE15aERDcG5XdktMNXorU2NyRkNtOE9DSWx5?=
 =?utf-8?B?VUlzSDRSaUhtUVhqTXhTL290U21sS1ZPMjhhUXpzdGhJUDdpbDVvRUtRTXdP?=
 =?utf-8?B?aEMvQ3JYVHdHZVRKSTNpVFAvWFJFM3FYRmhmUzVaQ1ZmV2FPdTVjL1lBQmtO?=
 =?utf-8?B?OXU0bWgzL21TYUNjU0dyS2dibHgxSnd0L1lIRHVqS1NJT2E3RFRiSHM4anpp?=
 =?utf-8?B?UnBWa1JvY0NOTzUzd3ltdURSY0pMM2J2N0pleDlyTEQ1enZhUGVCZ2lCOUVX?=
 =?utf-8?B?WTVQNWsyMkx2d1VUL3RRYTErK0NwdWEzeDJmTlBjdWhGS3RMVTJXL25wcnM1?=
 =?utf-8?B?M3NRbUNNalBtN3BMYzRxMldWYVNkZFlxbzdpdzI2M3VicGloTXhyQUEraEF4?=
 =?utf-8?B?bE5tNVNNOEhWTmlCOFdwZWtPWUgxVWpjMHc5dnhuaFlRaENSSTdoVThFQThL?=
 =?utf-8?B?N2pMY1QvNWduUmcrdXNVRDdMUGxBcDlnQXRGUW9qaVV1VlMrN0N3dmZ3T0Yw?=
 =?utf-8?B?N1hCa1hJSU1idmIvWnVTc24zTTQ1bmJoRUVOVEJqWm5hRUFJdk82Z1lIbk52?=
 =?utf-8?B?WWxJL2VMNTQ3U2FidFJaR0xUSmo2NGJGYXVyZGFBTm9OVFBjczUyb2tqUEQr?=
 =?utf-8?B?cXg3Nlp6WTVtd2RBcXdkU1lCY2hXSDZZU1QzM3RXNldzSE1HcW0wbjR3dlNj?=
 =?utf-8?B?bkpRMGJhb05LME52SnRCRzBFUHhjcDlyVnQ0TGs1a0lkUTNieENLTXIzWWVG?=
 =?utf-8?B?Z0VXalZNM092czF0cmdxSFplNTM1NkJmTU1BWmpDK0d3RDhidTZzMTVjL2c5?=
 =?utf-8?B?clBEdlJoUCtrU1NXaXFkeDE5YjFqcDFEQ1UrdDYzR2NGS1lWNm1vSW1WbDZm?=
 =?utf-8?B?MTRXVGdodmRhSjM3NFo3NFlTU2F1K0ZmNTFoK2N0VVgwNUtkaGgvTSt2MjdY?=
 =?utf-8?B?Vlh1cE1yMGxjTmZ0NFFqUVFIWFUvQ3FHakR2REliNHA2N0tPbUF4UmpuRHl1?=
 =?utf-8?B?aTBCa240dXFoVm92WHNRSWxRam1RZUF5VjlrVWRHRGJnQnlvQVBwZDMvSVdO?=
 =?utf-8?B?MjNRaU9LSmNSZzNZck1RbG1FTXZlcnNFRktCdjFtWDBRRnBUdm4zSXQvaTlt?=
 =?utf-8?Q?3YSJlmJQTbjoqXLY=3D?=
X-Exchange-RoutingPolicyChecked: JFTrKYd2rt4jbrc/bABC9XXJL1a6VNX1t5tH9Fd+oPiGg/+M/VMK9OWyRCVfpXeO81q7VwWDkLqMzuvwzEXPnMXfYg+Z0DKnzmRpeG+aRpz3bl4Pk5Bw8eAqqcCNfv0VpQ7TlUACCf1PN7/4SMqVG1hompXHAcnRR1lull+ieLQV8AII1Zxxd7X3N2qsE7j4c+FYchUVtsNqqGLVfgtc82ga8+cXnQRxesx1wSeiBS2zTgyXil90XiDqZ+ef37u+CwmIIA5QKv3NZErx40wlyiuob/xZ/1iE0rJv1nglqTwikqItCztJGaNFOcCwux/wLMgussXZdR1X7Cw+cC/BtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d25353-18f4-4e64-52c4-08de903a316e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:01:14.6856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZ4FJpdiBLRS/3iFjjdxYSzHEZV1H4TESKu3qV9I3aeYBVYWZZYCkO6+i4FX3yK2f4z730DjHFHC2UeIcfjqCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9738
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

On Wed, Apr 01, 2026 at 02:10:35PM -0700, Matthew Brost wrote:
> On Wed, Mar 18, 2026 at 01:14:49PM +0530, Himal Prasad Ghimiray wrote:
> > Implement worker function to dequeue and process access counter
> > notifications and migrate bo based vma to vram and rebind it.
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Not a complete review - that will take a bit more time but one quick
> comment below.
> 

Sorry more thoughts in a stream.

> > ---
> >  drivers/gpu/drm/xe/xe_access_counter.c | 139 ++++++++++++++++++++++++-
> >  1 file changed, 138 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_access_counter.c b/drivers/gpu/drm/xe/xe_access_counter.c
> > index a2ce9dc45d05..9eb9917d8da7 100644
> > --- a/drivers/gpu/drm/xe/xe_access_counter.c
> > +++ b/drivers/gpu/drm/xe/xe_access_counter.c
> > @@ -11,7 +11,10 @@
> >  #include "xe_access_counter.h"
> >  #include "xe_access_counter_types.h"
> >  #include "xe_device.h"
> > +#include "xe_gt_printk.h"
> > +#include "xe_hw_engine.h"
> >  #include "xe_usm_queue.h"
> > +#include "xe_vm.h"
> >  
> >  /**
> >   * DOC: Xe access counters
> > @@ -33,9 +36,143 @@ static int xe_access_counter_entry_size(void)
> >  	return roundup_pow_of_two(sizeof(struct xe_access_counter));
> >  }
> >  
> > +static int xe_access_counter_sub_granularity_in_byte(int val)
> > +{
> > +	return xe_access_counter_granularity_in_byte(val) / 32;
> > +}
> > +
> > +static struct xe_vma *xe_access_counter_get_vma(struct xe_vm *vm,
> > +						struct xe_access_counter *ac)
> > +{
> > +	u64 page_va;
> > +
> > +	if (ac->consumer.granularity != XE_ACCESS_COUNTER_GRANULARITY_128K) {
> > +		page_va = ac->consumer.va_range_base;
> > +	} else {
> > +		page_va = ac->consumer.va_range_base +
> > +			  (ffs(ac->consumer.sub_granularity) - 1) *
> > +			  xe_access_counter_sub_granularity_in_byte(ac->consumer.granularity);
> > +	}
> > +
> > +	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);
> > +}
> > +
> > +static void xe_access_counter_print(struct xe_access_counter *ac)
> > +{
> > +	xe_gt_dbg(ac->gt, "\n\tASID: %d\n"
> > +		  "\tVA Range Base: 0x%08x%08x\n"
> > +		  "\tCounter Type: %d\n"
> > +		  "\tGranularity: %d\n"
> > +		  "\tSub-Granularity: 0x%08x\n"
> > +		  "\tEngineClass: %d %s\n"
> > +		  "\tEngineInstance: %d\n",
> > +		  ac->consumer.xe3.asid,
> > +		  upper_32_bits(ac->consumer.va_range_base),
> > +		  lower_32_bits(ac->consumer.va_range_base),
> > +		  ac->consumer.counter_type,
> > +		  ac->consumer.granularity,
> > +		  ac->consumer.sub_granularity,
> > +		  ac->consumer.xe3.engine_class,
> > +		  xe_hw_engine_class_to_str(ac->consumer.xe3.engine_class),
> > +		  ac->consumer.xe3.engine_instance);
> > +}
> > +
> > +static int xe_access_counter_service(struct xe_access_counter *ac)
> > +{
> > +	struct xe_gt *gt = ac->gt;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct xe_validation_ctx ctx;
> > +	struct drm_exec exec;
> > +	struct dma_fence *fence;
> > +	struct xe_vm *vm;
> > +	struct xe_vma *vma;
> > +	int err = 0;
> > +
> > +	if (ac->consumer.counter_type > XE_ACCESS_COUNTER_TYPE_NOTIFY)
> > +		return -EINVAL;
> > +
> > +	vm = xe_device_asid_to_fault_vm(xe, ac->consumer.xe3.asid);
> > +	if (IS_ERR(vm))
> > +		return PTR_ERR(vm);
> > +
> > +	down_write(&vm->lock);
> > +
> > +	if (xe_vm_is_closed(vm)) {
> > +		err = -ENOENT;
> > +		goto unlock_vm;
> > +	}
> > +	/* Lookup VMA */
> > +	vma = xe_access_counter_get_vma(vm, ac);
> > +	if (!vma) {
> > +		err = -EINVAL;
> > +		goto unlock_vm;
> > +	}
> > +
> > +	/* TODO: Handle svm vma's  */
> > +	if (xe_vma_has_no_bo(vma))
> > +		goto unlock_vm;
> > +
> > +	/* Lock VM and BOs dma-resv */
> > +	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
> > +	drm_exec_until_all_locked(&exec) {
> > +		err = xe_vma_lock_and_validate(&exec, vma, tile->mem.vram, true);
> > +		drm_exec_retry_on_contention(&exec);
> > +		xe_validation_retry_on_oom(&ctx, &err);
> > +		if (err)
> > +			break;
> > +
> > +		xe_vm_set_validation_exec(vm, &exec);
> > +		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> > +		xe_vm_set_validation_exec(vm, NULL);
> > +		if (IS_ERR(fence))
> > +			err = PTR_ERR(fence);
> > +	}
> > +
> > +	if (!err && !IS_ERR(fence)) {
> > +		dma_fence_wait(fence, false);
> > +		dma_fence_put(fence);
> > +	}
> 
> You can move the dma_fence_wait()/put outside all of the locks taken here.
> xe_pagefault_handle_vma() also unnecessarily waits under locks, but that
> will be refactored a bit in [1]. Even there, I should probably move the
> dma_fence_wait() completely outside vm->lock, which is held in read mode
> after [1].
> 
> Best to get the semantics of this new layer right upfront.
> 

Actually, now that I think about it, you never need to wait here, given
that migrations and binds are fully pipelined operations and we don’t
ack an access-counter event with an H2G.

What will race is a possible page fault while we’re moving the VMA’s
memory. So I think we should just attach a fence to the VMA (under
vm->lock in write mode for now), which the page-fault handler can wait
on before the xe_vm_has_valid_gpu_mapping check in
xe_pagefault_handle_vma(). You can drop the fence there, or if a VMA
still has a fence when it is destroyed, drop the reference at that
point. This should be a relatively small amount of memory (for the
fence), so if we don’t free it for a while, I don’t think it’s a big
deal..

Another hazard is when multiple access-counter events map to the same
VMA, so if an unsignaled ‘access-counter move’ fence is found, we should
simply drop the access-counter event.

> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/707294/?series=162167&rev=4
> 
> > +
> > +	xe_validation_ctx_fini(&ctx);
> > +
> > +unlock_vm:
> > +	up_write(&vm->lock);
> > +	xe_vm_put(vm);
> > +
> > +	return err;
> > +}
> > +
> >  static void xe_access_counter_queue_work_func(struct work_struct *w)
> >  {
> > -	/* TODO: Implement */
> > +	struct xe_usm_queue *ac_queue =
> > +		container_of(w, typeof(*ac_queue), worker);
> > +	struct xe_access_counter ac = {};
> > +	unsigned long threshold;
> > +
> > +#define USM_QUEUE_MAX_RUNTIME_MS	20
> > +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> > +
> > +	while (xe_usm_queue_pop(ac_queue, &ac, xe_access_counter_entry_size())) {
> > +		int err;
> > +

So here - as discussed [1], let's have a single queue /w multiple workers
pulling access counters events.

[1] https://patchwork.freedesktop.org/patch/712591/?series=163429&rev=1

> > +		if (!ac.gt)	/* Access counter squashed during reset */
> > +			continue;
> > +
> > +		err = xe_access_counter_service(&ac);
> > +		if (err) {
> > +			xe_access_counter_print(&ac);
> > +			xe_gt_dbg(ac.gt, "Access counter handling: Unsuccessful %pe\n",
> > +				  ERR_PTR(err));
> > +		}
> > +
> > +		if (time_after(jiffies, threshold) &&
> > +		    ac_queue->tail != ac_queue->head) {
> > +			queue_work(gt_to_xe(ac.gt)->usm.pf_wq, w);

I think scheduling access-counter events on gt_to_xe(ac.gt)->usm.pf_wq
is correct, but since this is shared with page faults—and those are
always higher priority—we should service at most one access-counter
event here to give page-fault work items a chance to jump the line.

So maybe something like this instead of a while loop:

if (xe_usm_queue_peak())
	queue_work();

Matt

> > +			break;
> > +		}
> > +	}
> > +#undef USM_QUEUE_MAX_RUNTIME_MS
> >  }
> >  
> >  static int xe_access_counter_queue_init(struct xe_device *xe,
> > -- 
> > 2.34.1
> > 
