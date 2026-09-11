Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81592C88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 13:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E4310E3A1;
	Fri, 11 Sep 2026 13:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlSNYNJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE71B10E3A1
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789132260; x=1820668260;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=liYpyN91EkmQgMWF4ZiXemu5MLCcqfvNpfCPH7oA0dE=;
 b=YlSNYNJbOH0PtuhXo+GMEmEatWnGsZiUejk9Lur9xoCiF9YT5FEWFSVi
 gqhXkutG8aKgWtKcTecHvBXr+4ejn0xIC/FNdAp9JpiXVJ4GLo8on3FgG
 1G79bMtVaO3HXYKITYvyci4Np4b3vz+wYPqtmVOgNkD8no3LmGG6RIAy2
 53JvEh2cmLJQp9WH1kZeXxurmCVwr0mbtN9vWn5116CTvIa6X2FxRMmXr
 t8qHa0cObX/+YwPBrPLlVxppPFn02eAVad2cHEUqOoxWvChn7ALwLspAC
 MRq+WnDbXQajLj85NZHbc0fUu8EisWmBaPSdnd/zGAJVY0cI/rfZwpsLr g==;
X-CSE-ConnectionGUID: aceYdoyBRLqOTo9moJ6L7A==
X-CSE-MsgGUID: RlG//b71RgKBdFwA+EQP8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89633201"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="89633201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 06:11:00 -0700
X-CSE-ConnectionGUID: qzxBED95RXORKsNMeMKQLQ==
X-CSE-MsgGUID: 496XYxibRqWM8dIYl4wTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="273846485"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 06:10:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 06:10:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 06:10:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.19)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 06:10:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3lh1rciWRCIpsBNse6gCX+WPXtjRJeyspF1Appu/oTNS80sPcSWBx1yB2PiltjU9m4b/wkCLlojtndNidhhLL7l604f5UQ6M+RrUopWw59axR7oY9LWRW0OY1RGD4JP4RB6VDPCHi6daHSOiM3skxc9ZU2t9gIeNe2myNGKi+C8eZS+YW7mG+ucFG98n+I4ap21UDie69rFbRCa7Vk6P+LTYfacxYlJs7gTirhyqc2F/fjziFS2knnYBp/hyoIDxaPbE6A1+tHMmvN9r0fcNWROGkmCskz+QQHr5WDAxY6myGwZHsTj5dDsWSTGlUTaXx6kQL+yoeBEOWVq4jVKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pJfo7N4mnGckvJAxTYHedkA2eHhDjD+phRjYXGxazA=;
 b=lX0RiZL9yTSBL0n1m01P9aM9dJO2HRkURNE4YHECJIwhQbr6eyTkT+PG3l0mkKqovJ0ijYRV9KfEeCyxXCK2/o1clLQTPsn4/qdGuw86s55x39ukfMirLGeLtyT4SLfbBRdG7r/lCIV6sv9Rto2SuGbskLsy0TgnTT0DbfAcT5bS1hpHGwGHSkoW8Oz8+RpC609q13IObBEpayUMtQ8Ky2vA13s/RabDD2h37bkN7EzQ2bLQjxj3LS7G669LsbCC4PASkGJjnsya0F6+JMqJVL7hVSjjQHapm6D2Pnp84SFnNUE6e9lY+zhkqsLoI7VGLWrpP2h1zujohiMS6dXmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 13:10:55 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:10:55 +0000
Date: Fri, 11 Sep 2026 15:10:48 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 06/24] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Message-ID: <aqP9wLOjODgyAjkl@fdugast-desk>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904211613.3934307-7-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::16) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 8682e4ac-a25e-474f-6299-08df10061cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|6133799003|18002099003|4143699003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7vSNwtSYCCYsFGxmwLArxA05GKSdQTmnESMFMJCbLY2S8T0QzcYZLq+NZ3Tx48prcb2mfzX9tBZvSMgy/d0MJmzeZzMGJWK8QC0rVhzr/P7xAAmXx1KfMdczVPmT+3NfxKJOkhzWC+qfW3AOziz0WyKdvCuSDhCagPAPdi5nQ/2gS0f0cNow5+vLxDiQbwR6kydX4OHuqiPAxrVY/78ObOMYq3yC1N1R70Z5pbJPIE0qnbf69AM9n2dIl0C3jREp2w7VMiryk7SStKgTf6PaTK+fjAOuw8pQsgEtE1zLcD5kgypvReGkwLRK2B8B4U0e8R/oK+LEi/Gf9DyRr2dOPsgIXDiXYVtuJMLk5U5zT1BZ+DtYOs1nqkXcxBw+Hu9WDS+b+J9iUVSuglhH7fHZQMSi4tzJLYmcAiLLwfDgd7zy4+LTBsaovVDwb73W+YFb4i83Z455ffUpQovygJ3xkqETJmAxJGyrygpqBU6yM1528sL1TdJqNv4t1v1WZzCDiFm0z3iuceED/iwcZN/+yecr6KYSgC4eZkA4hVBDMVEv18vjBcLTWj8mroTmCR1eviNNXx+kdOnIOCYAFuJ3fl544E4L+mFt5a9ZxhO45YY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(6133799003)(18002099003)(4143699003)(10067099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTJYMUFORFp4WmZUUWNCTnJrb1FhUzZPdHdvL0dGYVg1S0Z2Q1czU24vY25t?=
 =?utf-8?B?RVRtVWc1TGxxQ0IwR0pPY25LQ25Zekk0TFg2WnhFOEE1RGVPT1hkQmR2WElq?=
 =?utf-8?B?K1E2L0VIeTdVRWxiVHVNc2NkcGo3TmtSUm1qTnFlN2ZJcGxxRFBNdEplZTN4?=
 =?utf-8?B?cVNlNGZqdWxpS01LOHFKcW95cVFGRlZ1M2d3RWg1Y2k3SWwwMXhqcnNkckNl?=
 =?utf-8?B?RS9zVEUwSExXZWl0cEcrMWdxMnNxL3BZTFU2R1QvM0xLUXRmNFphNzZGNTZl?=
 =?utf-8?B?N0lCQlJpM09XMTc3amVTZFdsekphdmV0ejVmTUhMc05waDRRV2w1ZVFHU1I3?=
 =?utf-8?B?QWw3QkpNRGVOM2F2aVRCY1RXZk9QODNpakxWVXhCUnBqTkpEeUNUVjhORnpw?=
 =?utf-8?B?dUF0ZngwTGEzeVhFc2JIZGp5VVNqLzdramtNekRTdlVJR3E1MVJNUTlua3Y2?=
 =?utf-8?B?RklvM3liNTBXQzM0MXh3TmVqcGU1ZUtMdjBmWDRnZGM0TkYrVWhGTzJaM1Nj?=
 =?utf-8?B?Nk9UVlpuSWE1b3VGSDJoMllScnRnRURSQW5LT2FsUUREeUlKZHRBUWpTbzJL?=
 =?utf-8?B?UzRDdXFoMlVERUtUQXJoeUFlOFpqeFpycTBEVWxCaHdncVR3Nk1yWjlOT3hV?=
 =?utf-8?B?RDZwQVZiK2ZocXdmZjlycGkxUDBLSGQ2aVVpY1JBbWhRVmk3aE9ucHhPdm1Z?=
 =?utf-8?B?RlVveUErMSs0NVY4OUY5amFJemJyZkJXVFRvRWIyZUlwRDI1MHRSanhZZEI5?=
 =?utf-8?B?ZWJ5N0VGU1hOaFh6S1JoTTRnTkNIUlYzR2RFOVczejJ4ZUVjTHNyRVJqSXBu?=
 =?utf-8?B?QjNTUm82aHBVZVZnblMxOHlqZWozMWhrWER2OXQ4bUIzVzg5TE1XVFRPenFn?=
 =?utf-8?B?ak11NHhuYVE1dldadUxPWE5CTXdWQWV4Umk3WEpoelJ3QXhhZjZ5UjhEcDAv?=
 =?utf-8?B?MWwrYTI2RldDRHp0R0FvYUFMMzhoWkIxNlF0M20wTE5hTDZsY2NIRWxtbFp6?=
 =?utf-8?B?d21scmFuUzZWd0lCRThscGNtMS9vN200MGxKVXVhSnd3R21iWVZaTFl6UmF3?=
 =?utf-8?B?cjhmRVVlN3dhc25EYmlialp1ZXlrWkludloyV2hJME9NNmp3WUlJd2xYQ3E3?=
 =?utf-8?B?SHZzZ0thUCtYcmpXUEgvV3NXS0N2dXFJYmcrampTN0VNc1U3R1ZlZU5CRHZu?=
 =?utf-8?B?bHNlWitzdDRLd2cyWHZCZ0c4cC9MYUdxOE8vYXZ3YWlpMjRJT250YW5jREN2?=
 =?utf-8?B?Ykw2bHZmc3pydlNzSXBUS3hnb3pRalRTdGhmRmVjQjk1UUlrNVBUNGZIYWQv?=
 =?utf-8?B?QUNWTU9SZkQ2S3d2NU80OEVsQ1JKeThnL0xkb0lQNVpMcTJQQXNqamJUM1RQ?=
 =?utf-8?B?Zy8weWdNb2Rob2xrbHFDdm5XeDRvMzB2eUFFTDBoYzJZUHFUZmtqaTVCNXRn?=
 =?utf-8?B?ZDR3LzkzWGZWQ3YxWXBLa1U1dUE1V1R2TWxtdFE1eFBhR21uaWtZa1lrck15?=
 =?utf-8?B?cGFhOFBtVDJ1S0JLRlZGaXkyOHNUcVM1L2hEL1R0U1RiMHRCdnovOU9jNVI0?=
 =?utf-8?B?d0NVaHJpZlcrNGFuR0tSbHM0bHhxampkLy9WeHJpQ0ZmK3pGa1dDS0g0WU9U?=
 =?utf-8?B?QWs1aVBMejJ0VG9TZi9JalJRUldDbytHSXY3YnhoUXNOVjdFZ2ROU2tFb05o?=
 =?utf-8?B?cTRTcmtVY1lEWGlrR25Gd1ZYbUtWeXlxTDREU2xFL1c5UVZXUVJTelI2Vm5L?=
 =?utf-8?B?NXEvSWNJZ1RpcllMemMyS0s4NWdHa1hTT2trZ3oyd0IrNUxaWXJYNUN2aGEz?=
 =?utf-8?B?V0xvTzVzQXM1L1ZBNmg2dStDUE1mVU81Qnd5VDRSc2JxVW9Gam5NVlZsdHV3?=
 =?utf-8?B?Njc4aGVmNUJsSHM5YW1kNWg2aXF5dXBqNkdaQk0vb0JFdjJRQjBhNjFjRXcr?=
 =?utf-8?B?bDRqSzFaSlA4Q1c3V1pydkIwbEZ2SXgxZmtZU0JUa2dDZnUxSkRRemZkd1JT?=
 =?utf-8?B?N3djQStHaEVCc2F0RGNubzVlbWR4OWQyVEdocml5TXRsTTNTMHFzV3RzRzBw?=
 =?utf-8?B?RS90d01nNi9zZmlHMFZUcDdpMi9jV0p1ZzYrRXpiN0Y5L1g3YlRmZTdaUzlI?=
 =?utf-8?B?L25OZ05QTzVtYUJRNnBkVk5ROURnWk1SZThVNjVwRlBKc1plUHJjRmFoeFRm?=
 =?utf-8?B?RExvT0RpNUloVDNJbGdzWGlvbHNJVi9yYkc3eU9hdUV5T3g2UnhTSVVDcUNE?=
 =?utf-8?B?M0xNUDY2QkI0YStUR2NsVVRmbk0yQXUzS2F2UmNTQzNTczZXNUVFVVlyRVVF?=
 =?utf-8?B?ZUlLUUREYjVhRzBiVTJGMUdIVXpPNUc3eXVoZnZVRHErd0NuajNXTUZqaWZX?=
 =?utf-8?Q?rw+ee3Q//jIpOVj0=3D?=
X-Exchange-RoutingPolicyChecked: W7gQYoxgh20zcH75XEiW3C/hpyvqGhtA14uFMwO0Ng4LDjBISASkze/znJRscI1Ry/Ba/bQIYPrTVRUrTLKY/+cKZ3BXKFeFj5guwAXkbT5KONkkUtJNAEzT7+EjeBmkZK3+qoPqoIFRZw8FfjS8pMwfqgj09cLkUGNPQKAdmqSfIjzQKvlDB4ISsduhiqZWscU+JsM7SO7egTTnl0RGPBM2CfZpHZBD3OtG0NeEy8Auxkedm+grOYMhTAe68axry2Nuhr822qopL/yy/b5aH3MKHTDBXo69LXHDofBgBJoe9an60itAEMO2ani/FZDHOoe1lVWIT40TY3LoyOX94A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8682e4ac-a25e-474f-6299-08df10061cfb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:10:55.2808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xutC+5Ij2lazLpt7WyDgZlarjYIfKxbju96MbUzYpkLExir1OlXodZGLYk8W4VV4dBnIeAXB/+sZJZvefhJGpLgXSHpNiJLQfgUFs0f76uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
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

On Fri, Sep 04, 2026 at 02:15:55PM -0700, Matthew Brost wrote:
> Add XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an async BO put must
> also drop an additional reference to the BO’s VM. This is useful when a
> kernel BO, one that does not normally hold a VM reference, needs to be
> put asynchronously, ensuring the shared dma-resv object does not
> disappear before the BO.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-7-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
>  drivers/gpu/drm/xe/xe_bo.h | 1 +
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b162753cebb7..aea4b0fee8e3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3998,8 +3998,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
>  	if (!freed)
>  		return;
>  
> -	llist_for_each_entry_safe(bo, next, freed, freed)
> +	llist_for_each_entry_safe(bo, next, freed, freed) {
> +		struct xe_vm *vm = bo->vm;
> +		bool async = bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
> +
>  		drm_gem_object_free(&bo->ttm.base.refcount);
> +		if (async)
> +			xe_vm_put(vm);

You had mentioned reworking this part:
https://patchwork.freedesktop.org/patch/750807/?series=149888&rev=6#comment_1383757

Sashiko seems consistent here.

Francois

> +	}
>  }
>  
>  static void xe_bo_dev_work_func(struct work_struct *work)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 01975586ee88..2168aac1ed1e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -54,6 +54,7 @@
>  #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
>  #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
>  #define XE_BO_FLAG_NEEDS_1G		BIT(27)
> +#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(28)
>  
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> -- 
> 2.34.1
> 
