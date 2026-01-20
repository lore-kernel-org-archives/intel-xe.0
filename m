Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B42BD262A4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 21:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAF710E109;
	Tue, 20 Jan 2026 21:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edjTgmEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815A910E109
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 21:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768944375; x=1800480375;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=evE9VmalQfFZ1g+wHSnxFI/kZ/OirzqFzhy8b+urOfw=;
 b=edjTgmEa+SdH7+arrKkja+FXmgeCnNbiOMUujGbunSrollq2/L9AMV8p
 03wDQx8jmZJnHtzWCCvT5NvXZoz0qESn1Na6OuzRSqBLJXnDPxC1W0Mi6
 8UhuDAcBnCfMTFZcyFwmxeSAuBKxw8r+KK0Hc255pKQpEkwSFASJ09KIP
 Fr+E0UGKaczsw87OKvooylGy0U4IkXab7piZaaoS3ohNVuTJKtnCR9nb+
 2fk5HXEcc5KR8R+yJ/3/0x1Q8qFcSYz6+c2lSCNbw1wKptG+WHI7ij3eC
 eAiuotJHuKQ4pBk2oJIH0jt46RsYrPowYib73AARHlTht6EqM47L52QpH w==;
X-CSE-ConnectionGUID: 9XZU0UNEQluj4R0b02Js1Q==
X-CSE-MsgGUID: RBBfzh7PQwu7Mi0UPtOD6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80792715"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="80792715"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:26:14 -0800
X-CSE-ConnectionGUID: Q5/LDuxvSYeGy2Yfy7OqQQ==
X-CSE-MsgGUID: g9UmUo5bSNSNKgV4mqaSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="205870484"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:26:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:26:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 13:26:13 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:26:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y59XDHQqfY66z7GfTiIMs+qdfpIO33gTkCSrYbpop6PA2+axkPrszxoftaAaXvVn+u380Y1MLB5zzWF94jXvePrV0Rw+lzFm19nL0QgeiiFaet2ejCa/XeTu4KTzVm8GU6yiODSY8JXOLns3HnxCtip8TmumUh/0qO7mlu5btyYtLsuJj3X/mIeMd3sfXnAJc/c5cUbf4WVrUsMKFGNN9GsmlwO+WKzd0JSlOBB1idTAMWbm464UFnNeK0y84+0wT6jKaPWxVtr0J+EbMgRoiftQKQ76/ymNnSfqV2TirqBtXdxaczxsIMxNKvlGFACAaASGDi+vWHR/zg06V10GCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlO03q67TZ+EsqoIoO8PLTvH7h3diPqoMRdiccNbipM=;
 b=TZcqUf3dSiP6F94SFSZksYuvpz/qGGJPloS/7W8s/aRLrmGwUo9KXoH/ZNgTgCMfEpCnqae1pvH9Gwd4LGqaqYQMuf/sXRao9gpav4X2vMcPNJ0sMyx5fgavoi3p/G80jwvIdCrYMrtdODbD+ZA+Iuyyw0Mbhb9pON1nT4oF4nb0moLZ2+nrmwy3je/FoUeOkQ5TkaiGKpy1tAn0SCY8If7stm/ObRCRdc1UA652g1yTz9dTGgFckyNzbPAwXaR8ORNp4mefl1g5lzUkiYAU/LP3CeX2SH/NdWZRPjsdNjux543Muf3TstKNG0uiZXQ2lbv45cz47Nc9A3rcNzM9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6456.namprd11.prod.outlook.com (2603:10b6:8:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 21:26:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 21:26:04 +0000
Date: Tue, 20 Jan 2026 13:26:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <intel-xe@lists.freedesktop.org>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aW/y6TuuD07vtmgO@lstrano-desk.jf.intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
 <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
 <5nddlxy5z2naxxoz7jnyhpwpv3pofv57fuhflcjjwhxell5ozg@xmrhis4b7hhf>
 <e8cf019c-409b-4e17-ae80-8b95e51e366a@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8cf019c-409b-4e17-ae80-8b95e51e366a@intel.com>
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: 14def558-81ad-4321-3603-08de586a8422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWt3SElpbEYrcjRVbzdLRHQybDREUUJ6dFlzcWdMZ01JMm1yTjRuNTlXeEl0?=
 =?utf-8?B?dGR4VmY4QUlqMWt1cDF4QWkxbU5FeVhyMHl4dWpJK0RYeHpwUjJvcWFQY0ho?=
 =?utf-8?B?cUhWcWk0MXd4blBObWg3WWd6SUd1dWZGVTVKOGxjZTgxRGVISzh1djQzZDNI?=
 =?utf-8?B?dXNWYTN3bHVJOWpaQkhKWmpPV0NHYjV3ajBqR3Q0VDlSZ0J4dGt0NXNYNHJK?=
 =?utf-8?B?T2NiSFM4aW92WXMrV0xQRTluN3FkdVhXYTloSUdMZzVXRlAxY0VUM2dFellW?=
 =?utf-8?B?KzJyNmZUVWpLemJJSXNYK29GemVjb3d2UTdFMDA1WktpSCtxUFlmck5wcXBr?=
 =?utf-8?B?VzhFTldWbnNqYU9XNkFJM3RHKzJDdnN2NDAzUlRaOVJDUU5hbzBLNjIwY2I3?=
 =?utf-8?B?R2xFN29vU0tueDRYTUZxalRBc1JGOFBFbWdtNm1vMVE1MWhlOWY3azNvbnlZ?=
 =?utf-8?B?OXR3L0ZYbC94QXJZNXpGaE9xQ3ZlWVhRZTlQa3MrcG8xelU1U2tNeUM5RVlQ?=
 =?utf-8?B?TGkzMGI5cHQvZisyRTBuNmNBTC9wRm9FbnY4a3J3eDFmWjN6czNMMGllQ2s0?=
 =?utf-8?B?L3h0b2FxQWNVeHA5SEJiL3dyNnhCdGlnSGpONXNoNUU2cUhiNlJQUjNiMFVT?=
 =?utf-8?B?K1dBd1MrbURmejJQSnV6b2l5Q200bEpnVldzWCtTYlc2dkFuWldRcU82NTV4?=
 =?utf-8?B?em1uTi8xK2xCSE1PUGJ0OXo3RkFRRWxaV0xGMTJ2aGQ4QTFId3A0RldML2hI?=
 =?utf-8?B?bHpkTnc4Rkt0UUU5VndwanJkeURhdlpadUFaMDFjZ2cxSURjcVJlUjNuQWpF?=
 =?utf-8?B?RDNyT3o4VFh6NXlCcGpJNTlkSUc3NWtVVFdta1NrajhicFNMTUh2OURqaG5M?=
 =?utf-8?B?bnlrNXVRLzdMM1N6c1VzNWxXVStHQ1RLclhuL05sbzVKK2s5cWxGSngvYzVW?=
 =?utf-8?B?djVjSlY1WDU4YjdWaGppTmN3QzZxU2JGeWRldStPTXFTR0dJbWVKNGRhSFF2?=
 =?utf-8?B?djBiR1cxV2FNK2F5cEF4RFMzVU16bEtZZGUycGtCdkQ1T2RFVm5MemFObVcz?=
 =?utf-8?B?aEE5NFQzclVSTXlvRjNhbG1kME9RWlZ0RVhmWG9pY2VlN3U2T24rM3o1NFBG?=
 =?utf-8?B?NmMxdVBINVhNYytsSkI1dDJEaUlQTFhCa0VpRHlCMWRrTnMwZUxhMVRoTzhy?=
 =?utf-8?B?eHVHb2RWaEZPRTJtY2s3UHVFU2FLdmQ4bEpiM0hDMnJHZUNYOU9lL1JnaVdT?=
 =?utf-8?B?R1d1cjJoNEt4cFhiVDFTbGltT3NLZ1pLSnZpTTRCWDZ3MnBKZGZNaC9Pc0NR?=
 =?utf-8?B?cXkyTWY4bUJYYXBuVm5ENnV6a3VaTk8rUHRpWmNDUW43ZkNhYXh5aXpSQk0r?=
 =?utf-8?B?aUVpYkljUzgzektEYUZybVpCTVUwY1cxaGo2MWZHR3VBUGtUelFUTTdtMm9l?=
 =?utf-8?B?Y0NsdldXUE9UZlBpVnhPM0RuU3ArN0g0Wkx5Sm1aeGlGYk1vSm9uOVlDcEk3?=
 =?utf-8?B?SkcyTHhOY05nL3hiZ1hWWGJWK1lUSWdHdVhOQmx5dXB2TkdQTFFCUDVHeFpr?=
 =?utf-8?B?ZGk4ekd1cVRKSVBVSUdia3RqODNlWEJoVlp2SHRGais5bG80SUFsK0xJUEpR?=
 =?utf-8?B?RGhkKzYyMUJ0emtIUXBDYnBJcmVDRzY3ajhDaVFGNkF1UEllSVpTbldua0xJ?=
 =?utf-8?B?S3N2SmxmNzA4RktMZVZUQzBPWWFzKzVpVmw3Y3JRam83RzhMQ1FwRGZScURL?=
 =?utf-8?B?cmVEanJOSDB6NlFmTks2czM1aS9XYlZTV0hkVnJxTkhkL0llaHRsdjJFRVBz?=
 =?utf-8?B?YzUwcnNZTStsV0FNRUl6M1RwcFhreHlWeG4vbkVaMDgwYkJBZDVtejA1S2Ev?=
 =?utf-8?B?SSt5Zk1uSG9rbDF0Nm5kd1ZiWUhtbjhkSU9BZnVnNWtxZDZHSUhCaUlXdGQ3?=
 =?utf-8?B?RlZLSWlhaytTOXluZFNZN2ZRZCt1NUxyRW9uYmJ6WElsUjNmQkE0VVRrM1Bh?=
 =?utf-8?B?SnBlU1pyWWplZ3FiOUtReEp2blBPS1JqcTJabEc3SDM1VEVjOWZ0RGtVWnFa?=
 =?utf-8?B?VEtnaEx2WnArVVZuNTdWZU04WGNabFdVZnQ3MTBzUk9Gby9RRTF5WEtxNFhX?=
 =?utf-8?Q?QFt4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEVEL2Y0Nll5VWFPdXNzUW5nZW1aRGNHSk9UNklDTDVlcEhKcXdRbXV3TEoy?=
 =?utf-8?B?OEltZ29nODFJb3MxS3R4VDFlOFQzSjUxK29MbGl2MXNZd3hLUGFxQ3JkbzhJ?=
 =?utf-8?B?SGhxRnk1WDMwY3RrTGRwa1gyTFhrdEk5emhhR3N2aVM5YktMcmEzb1ZPVFc2?=
 =?utf-8?B?dU1hWHl2NVcwY0RnR2JZSDQ2dytZbnR1aTdOV0lzdGxjaVEyLytzMG5Pb0Jt?=
 =?utf-8?B?eURSa2Q2RG4zZ056VW5ITkkzOTlWU1RJOEhVcFk1UGVxNWhjaDBSM0pTZEk2?=
 =?utf-8?B?a2g5NnRobGFFamZpR25hWk5DZFNUamVPZWk1WjFBYis1Q3ZHOS9XWnZUVXNw?=
 =?utf-8?B?enlpWGptekNsSmFZQnAwUW1WSFVMeldwWnBIZXNHZ1ZlRnA0SURBbXE5ZzI1?=
 =?utf-8?B?dFI5SzNUczhWL0x0b3l4eUNHcENoQzlocHZwTHBFejR1M2hRWURHdkVaM3Qx?=
 =?utf-8?B?cjRzT3JkNVlveFZQTEQyS28zVjZnSXM3ZXcySGZ1c0hRRmhGV3Nua1FSTjNq?=
 =?utf-8?B?b2ZMSHIxYTVJTHBIaWtKcUgvM1pzY3NWVTJvKy9CVXllMWs3ek1aL3lqbkhq?=
 =?utf-8?B?L3dlbHpUREFidm1tS3lkaG5qdUVIbEZjZWo4N1VRbkxTYmRvYmtKamg2Ly9N?=
 =?utf-8?B?VFIzTFRnbDcrbUxVUld3QXNlRkc0c1paZUZlL2lueERlaE9lR2dZVERabE45?=
 =?utf-8?B?LzgxWkJIUjZSWEpQQ2Ftanl5Z256OTB4WGdXUXFCQXBwSVdSbnNNS3Z0bjAy?=
 =?utf-8?B?ME1ld0NYQUEzRVRxejRDY281Tk5UYk5wWU1BdEZRM2dmN0Jka2trVEN4NGZV?=
 =?utf-8?B?c2tPM0xpK3FWL05ycjdQT3haTkNZNVc3a0hxa3dIcHBDSCsrUDA5Nmt3NmNl?=
 =?utf-8?B?NDNORVhHR2dTUE1LWHNMczhNaDVCUEg0SG9VT3V3UTgyUEVySVFuRTFjeW85?=
 =?utf-8?B?ZHNTRmVHOGJQaWY5R1gxakp6eis5czBLUGkzdzR4cGhhbVFhVkYyTGhQWEFk?=
 =?utf-8?B?c2U1ZDFCR2xBVS84R1k3VW9IMFBWZUF6eGNrYXZlKzlwVENoTXduZGhHQlF4?=
 =?utf-8?B?SEowR3hLelVOaVR4U3BpckU2OWRZdzJYUk1WbDY4azQwcDgrZC8rYXhjZjVG?=
 =?utf-8?B?akZiazRJVC9iT09OT1g2cGNPZ1Zsdk9hZ3VnSnI1bTR6ZnhkaC9peEU0dTNT?=
 =?utf-8?B?eXpPY011Tm1YdTA4UVVUMi8wa01lam1GSENMVTRheDdpVmg1R0ZzNFJndnN0?=
 =?utf-8?B?NmNuV24zcWMxYkZ5YSt6dTVOSmxFam0rbVR5WVA5SFJrYnVSWHVUMUl3YjR6?=
 =?utf-8?B?TExDQU0yZkVlM09nME9RWTJBQW1iUUFBVHE2L0U4VmJYZkdaWFdDY3JCSlUy?=
 =?utf-8?B?Vkt1ZTU4ZElCR041dTEyVXJudVREQUVBaFFaYk9BR1pnRC9vYTFUQzhoYnUx?=
 =?utf-8?B?YXBIMXlJWFdySGRzWlhlK256OEdTOVpZV3Q3OWtTelRjQ3NqeTFkTGhhbjl4?=
 =?utf-8?B?K2oyWkN1cG9pYmNZUmxBa2VHNk1TTWlOdkI4dTRyRndjN3g2WlRNcWNvejVj?=
 =?utf-8?B?by9rQjJQVlc3UmNTWURBc1NkbDVTOWtHYnAzeFdGMW9yYmdEdWp5eE9jb25Z?=
 =?utf-8?B?aFdGclh1RTBxQXhyanJ1cjBJVlBOb0pEd0ZML0lxU0YrYlRuVTUrN0ovRm8y?=
 =?utf-8?B?MzJUOGdkRjFvWTZZOGdVVWZKZGlLUkRTMThtUVhNL1QvVDJGdk82bzlQOXNV?=
 =?utf-8?B?V3hJQzVvaXp1ZGtFQTFiSFJVTlRENzEwcUgxc2NacU1aejFBVzc1ZVd1MG1X?=
 =?utf-8?B?WktncEpuVTZ3cDhLemZ1TWMrY2hoN3Z2WXZObUFpaDB3WnpHall6MEVLZWJl?=
 =?utf-8?B?L0RUbFRCcFYrMmdTWFpBTTYwZE5tVXRxVzZpNUd0cEVWdWpyY2hYQ0dMVlg3?=
 =?utf-8?B?R1lnMjFmRWp4cXdhUWNhMER6bjlaQm43YURweGpHQStTTTgzM0UwMHVSNHhK?=
 =?utf-8?B?eDJXWFFzMkxnZ2tWdkNGajR4QWVEeDNoS3duV0dvN0tyd3hYRFpBSTcraE95?=
 =?utf-8?B?UGtKZ1I2WVRTMExob3ZWbms1b2hGTlVSWC9xNTJSb3RmM3NTa1IvVU04dU5K?=
 =?utf-8?B?OHAzMTljeHhLMnR1b0x3QnFHZ2haZHRLSlhHWXExSGFUWlJweXIrK1dOTlhE?=
 =?utf-8?B?cTBHYkxCN0JkaWcwUHJ1ZzVyK2lhc3UrOEIvbHBlWDNRR0crendtKzc5K2Zl?=
 =?utf-8?B?VCsxcGFXNTN1Nmk0Yk5Fb1BpUFUwakhyalphVW1OVFVCYmpmZGpRVEZzSSs4?=
 =?utf-8?B?aVZKN1dUUVQwV1ZGRDBDQ1B2K1E4dUpTVjRIZXpYdFZkMkxaNU4ySEJaSExp?=
 =?utf-8?Q?QZZXIzQoZvGtstLQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14def558-81ad-4321-3603-08de586a8422
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 21:26:04.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IESLR3SUUsLeIcl9s/XMcCoYM/YLjEF40nbTXw0KFEN4CZZN1Nrl/qtmkDrBtzV7Vq84Yatv9Z/9Or6m0ebzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6456
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

On Tue, Jan 20, 2026 at 01:10:20PM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/19/2026 4:01 AM, Zbigniew Kempczyński wrote:
> > On Fri, Jan 16, 2026 at 01:05:01PM -0800, Matthew Brost wrote:
> > > On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> > > > On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > > > > If a batch buffer is complete, it makes little sense to preempt the
> > > > > fence signaling instructions in the ring, as the largest portion of the
> > > > > work (the batch buffer) is already done and fence signaling consists of
> > > > > only a few instructions. If these instructions are preempted, the GuC
> > > > > would need to perform a context switch just to signal the fence, which
> > > > > is costly and delays fence signaling. Avoid this scenario by disabling
> > > > > preemption immediately after the BB start instruction and re-enabling it
> > > > > after executing the fence signaling instructions.
> > > > > 
> > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > Cc: Carlos Santa <carlos.santa@intel.com>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> > > > >   1 file changed, 9 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > index a1fd99f2d539..cd645ee400b9 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > +	/* Don't preempt fence signaling */
> > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > +
> > > > >   	if (job->user_fence.used) {
> > > > >   		i = emit_flush_dw(dw, i);
> > > > >   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > +	/* Don't preempt fence signaling */
> > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > +
> > > > >   	if (job->user_fence.used) {
> > > > >   		i = emit_flush_dw(dw, i);
> > > > >   		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > > > > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > +	/* Don't preempt fence signaling */
> > > > > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > > > > +
> > > > IGT tests which calls compute-walker, then bbe are asynchronous (don't
> > > > wait for completion, pipe-control is necessary to wait on
> > > > compute-walker).
> > > > 
> > > This asynchronous behavior may explain things. Is this a common use
> > > case?
> > Compute runtime if I'm not wrong uses pipe-control explicitely. IGT are
> > not doing this relying on kmd.
> > 
> > > Also do you know if render engines have similar asynchronous behaviors
> > > or is this specific to compute engines?
> > I don't know, I think Mesa folks may know the answer.
> > 
> > > Lastly, the i915 disables preemption on both render / compute engines
> > > immediately after the BB before emitting the pipe control. Is this async
> > > behavior a new few feature in Xe2 parts which only the Xe driver
> > > supports? This might explain why the i915 works and Xe does not.
> > Test exercises WMTP and this is supported starting at Xe2+. Probably
> > what test is doing has a meaning in this case. First compute-walker
> > submits kernel which loops until it will observe some memory write.
> > Second job executes compute-walker with kernel which does some quick job.
> > But first occupies all EU's so second job can be preempted only when
> > preemption occurs and SIP will be executed. So if we disable preemption
> > immediately we submit compute-walker I think we have no change to enter
> > SIP and switch. Even if I add pipe-control to batch level according
> > to Daniele comment job it is still preemptable and we move pipe-control
> > location from kmd -> batch level..
> 
> So basically the test requires a preemption but does not put any preemption
> points within the batch? I'd argue that the fact that the test works at all
> is by chance, because the kernel just happens to add a preemption point
> after the BB and the batch doesn't wait for the results before completing.
> IMO it should be ok to go ahead with this patch and rework the test, but we
> probably need an ack from a maintainer because something that worked before

So my reply to Zbigniew. I'd like to know if this test works with pipe
controls in the batch.

Then I believe we need to confirm:

 - Compute runtime inserts pipe controls in the batch
 - Get extensive CI runs of compute runtime, Mesa, and application 

As long as we haven't regressed anything, we should be good to merge
this behavior change.

If not, then we stuck with the existing behavior but perhaps could add
an opt-in exec queue flag to create the behavior.

Matt

> (even if just by chance) is not going to work anymore.
> 
> Daniele
> 
> > 
> > --
> > Zbigniew
> > 
> > > Matt
> > > 
> > > > May you try to put arb disable after emit_render_cache_flush?
> > > > 
> > > > --
> > > > Zbigniew
> > > > 
> > > > >   	i = emit_render_cache_flush(job, dw, i);
> > > > >   	if (job->user_fence.used)
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> 
