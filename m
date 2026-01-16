Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C69C98302
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:30:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193B110E0F4;
	Fri, 16 Jan 2026 22:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+HEcNUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35C510E0F4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768602624; x=1800138624;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=WfFghM+cDOwDLtrwFVDX0xm9/WI8wg33QzvpA++7a6Y=;
 b=V+HEcNUXO6zCMwc5qknFr4QRa5HDMot+XsdSqJES6eCYwQ60mmp2hceJ
 oSv2LTcf6Fqfro8kqY8J7AJWJB/JMypqfXhzWD5jZwoRbhJJ8p6+faxM4
 r9y8yd/A9yC6Ybc+NPJFxE/mHjXdxoiDoED8IopD+gh3bhMaeHLyCnLeH
 MAfW0pJq797OXJaaWODrk+Qtc1DXjW10kdNliJc+SNKxtDi9hyoFrn89l
 3jTjuDrBxF8FaK+N92PJNJJTNkhtRbjxMez94IBlcETIiPDippBaPgsZL
 pL3tsvt4ceNrynbQo4mWuAakfb8jmQnEP2NHe0kwdytczEl6UmqXaxUw7 Q==;
X-CSE-ConnectionGUID: VmoxWg52TuyDtQDGhymGSg==
X-CSE-MsgGUID: KLHmyRV0Qh+3SDTe7xHIWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69817449"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69817449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:30:24 -0800
X-CSE-ConnectionGUID: qiWuHaa8So6FoQtiOE9k2Q==
X-CSE-MsgGUID: xkze8mh0SviSye8x//PvRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="205411123"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:30:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:30:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 14:30:23 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:30:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8XRUFndcUEVasKaW0yXFtCXQ3lfDfMXg7lAQaZLddnryM+wzpv8Zf/3ISBvbCr8+/mr1wMtj4KFDrGFvmRbh4BS9Rw3kEnbpzlJF4eNL/lS6PD5dlL8atC2/z43A6GotixIdX4tKZz5oDQKTUfPWgbZoI0uCvR35568KdHcvRODEUdlX5Mull4yGQj76kdUe77VHRD9kd3rXS8hrIKneg+XV92KEmKAwQ/lKZTrxZnHBtgyg7ekK5V2y0vvJouKwU4Y9vWrJ423902NWtiL56so+SDlHzumMfMSmLLwcuF5z48YxGnZm6dqmXks5kEGhlUAxDiELhtGu5yjGg9fEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfFghM+cDOwDLtrwFVDX0xm9/WI8wg33QzvpA++7a6Y=;
 b=ZMLLIiFI0VyIUI+OM2DtCZEWNNUBYbgnUrNPhXzgD41WDtJD4uqCjl2Vmf14R71qnZ5r/KBFu8Rm2FlcrtB6fZEmoCuREynU4/RYaVrcwa6wDDJXLDxu3TVUOGQECZ4lRxPGEOwpHZFmkOsgBWoJQe7s6eUGT4NSNVEHw0o2NVsvoZ7DApioEA4Nw6o6pz2It/hBZtUaBhu8n0d9fxf7Zv941T7sxeQ0ffig15gDlMAi5OFxMv6hr2S4PpvSgNXvPqzNonUQYarej8SBd6pPcvlR96ctM3TW/WwWsapMf9oJ4jYJpbjgbBhy2z/WKktbw3AzXruf3pGJuy+ksKxsmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB7398.namprd11.prod.outlook.com (2603:10b6:8:102::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Fri, 16 Jan 2026 22:30:15 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 22:30:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v5 10/11] drm/xe: Add exec queue active vfunc
Thread-Topic: [PATCH v5 10/11] drm/xe: Add exec queue active vfunc
Thread-Index: AQHchzX7QF7Wu3aF70uWkSw8y4sbtLVVYO8A
Date: Fri, 16 Jan 2026 22:30:14 +0000
Message-ID: <632b7eb9e844ace66638e4bd85bb618e3ba58ce1.camel@intel.com>
References: <20260116221731.868657-1-matthew.brost@intel.com>
 <20260116221731.868657-11-matthew.brost@intel.com>
In-Reply-To: <20260116221731.868657-11-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB7398:EE_
x-ms-office365-filtering-correlation-id: 7d5e597b-03ea-4665-5418-08de554ed18b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QjZ1Y0VUYllyWGtxRlVDMDMrY1hnYW5tZUpZWTliY1kxSWtUOGk0MHRPb1BS?=
 =?utf-8?B?UTQ2M2EzQjRoV05XbzM3STFHcGszNTRLYVRhNjhYVlVOSThOUnlyK1VvRWll?=
 =?utf-8?B?aFpWRCtNNFNrSjBwQVVOc05Ba3RuNmRXbmtyNUVxRzJUYldvUEhXMlZpZDFW?=
 =?utf-8?B?RXhoZVAyOTh6TlZKcllFTS9sZWN1NzYyU2hLczdRMVdFaGdTSjgvWURGTUV4?=
 =?utf-8?B?REh3dWpoWVlLUURNQ3pvZWNpU2tSWHlZSEFXMG84ZlEvTEtVWmsxL0pocytS?=
 =?utf-8?B?WlZtQVFsNEtOVjhMcTREY1JIc05XdHZQRW9jWTE3OXdxM2ZVdHh3amRzbCtT?=
 =?utf-8?B?MTBZbGhyR3N4SWZUTmxHUlFEekk2ZEd4ejJLeHlUbTkyVjR0M2VkSFB1bXgr?=
 =?utf-8?B?V1RyckxKd3BnczZmWUVwZHBjYkcwblMvcEwrZXp1SVkxQWVLcWhvbUdyVWs5?=
 =?utf-8?B?T3Q5MXFYbXdBUXFZVSs2bW5qdmMrRXJkdXpCeStlQkZXWVI0MjhGWHpGUkQ3?=
 =?utf-8?B?L0M5eExlVERTbmhTSVVDSUd0RWRNQ0svazBGZHlieDUrNi92SFJEMjFiMGM4?=
 =?utf-8?B?c29VZnY0YnNudjE1TFNIYTZIL0lGZEYzaTI5Rnhyd3E3bklORkJMZ3Z4Q2h5?=
 =?utf-8?B?aWllVXN0YWdTRy9ORTdxTVo0TnR0cDB6Z2NITTdMYmVXNWtNVUhrSG5XTk9P?=
 =?utf-8?B?SE01YnFRWEhsVldNUWJUcWMvZXVKenJMempHelRRL2V5ckVYYkY4TWdKOE9s?=
 =?utf-8?B?Ym5rVU1nT0Z6NVZZbVlGeEdlS1FveFBXa1grcUozV2xvRFdFMExuTlBuS0JV?=
 =?utf-8?B?N3ZCZ2hwYmhHSHVzWUZvZFJxSFVqVTFFcmhYSS9VWDN6M09za0FaRy9ub3dX?=
 =?utf-8?B?ckxsc2lrRlhkUmUwRWVFbFRHWGRIQTlzZkw5MTBEaTVJR1FHUGVHWlM1Z05T?=
 =?utf-8?B?OGo5VWM0YmlRenBLalVsQXYyc3UyNHJ1QnJEdXpDWmgydFUybHVWdzZ0Tklo?=
 =?utf-8?B?aE9iaFVmbGZpaTNLaFlVdkpyV3NlOEI3WGV4RUNtREFBWkRUMEhvbnl3NUx0?=
 =?utf-8?B?SE92YVdMSnRWNE43OGY2V2lhRHQ1VlVFaFNvM2NINmNuUG1McjFGTU8xaVpK?=
 =?utf-8?B?cHJMZjFUSDJ5aWJYUVhLVmRpdXRlVU1HWktiQXhTZm1JSHNNWGM5V05TUHpv?=
 =?utf-8?B?bTNrVlRIVnB5Rmg2TWFsNkNzWFJFYjNJMVVlYW5jbVpNMmc1L2UySjJPd2tX?=
 =?utf-8?B?cEV6WlhSSzlrK21GOTdlbm5YVmc2NS9tbUJNMmFyRXpiQVdWMXhsSlpoWkdD?=
 =?utf-8?B?Wm9td1dOY2duK21mMThESGNMMVY2b3F4Zk4yNVR4aUtwLzZuaEE1V3FON2Uw?=
 =?utf-8?B?Q0l0REpoV2xDcXpxalc5cWEwcXNUV2VDMkxyT1NxN290QXVPQ1pBckY0cEhQ?=
 =?utf-8?B?RHNMcG5FUVhnRUpGck5ndWdqOHl0aWVCNFBEUE9Oa1Q3ZFhuYkluQzY0K29I?=
 =?utf-8?B?b0pLWnAyOXROZUM1dnJZSFhVZ2ljZlVWNFJNdmJBZjVBMGhhaUtjRHdpcEYy?=
 =?utf-8?B?dG1PVkYyWmV6WG1DUmI0M0lqNDFwRllpTms0NDhxU0VsczNFTDFObWpsWWN4?=
 =?utf-8?B?TkhLRVhIQ2xFQ1NGOS9RU1BkZjRSQXJrWmgvTC8rY3hTRGFObjFxMnRraUxY?=
 =?utf-8?B?S2hHTkNFQWVPV3NJaWk2OW1KUTFRT09URHFQYWpnb2szdmtaQ1RjN0J4MGVh?=
 =?utf-8?B?N05iQmJqSi9HVXNuM1dUWEE3SktYd1gwZ0RTVWpxREdZcFg3a1o2SWFQejhq?=
 =?utf-8?B?UjA2Rmo5bjZoRS9BcDRKRXJ3SG5FUENabWJYMW0ydGV3VWdzQmF6dVZWSFVq?=
 =?utf-8?B?bVlxcjErNVhiYTE0eHgrQy80bmw3b3lTMmE1SlNjbFM0azdRU3pzanE2QnNV?=
 =?utf-8?B?Tmdud25BVEhRalRScnRpODQvOTR2VXNLcFpneUFyZDlxQ21zanhnV0lKbk4r?=
 =?utf-8?B?dDdwQzl1S3NtV2RFczRWTGRCbWRvME02eURkVXc5MVE4enh3WGNXdnYrNzJz?=
 =?utf-8?B?ZXpCend5NkRFb01vNm13RGNUcDFVV09xN3JpemhDLzl2eXZEL1VMQkpBZDht?=
 =?utf-8?B?cXlWUXFzTnZ0QkJnNitnWWtXVUYvVWxrVXduQ0JzQmMydTIweitud2g0bURN?=
 =?utf-8?Q?PPFN9VjOk4ac1qAQ9v6NQK8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UC9EdzhUcWlYRElZL2o2MCtnaHhsRVdaK29YOUJON1FuWkMvZTdhTndtTlJL?=
 =?utf-8?B?cmtMb0ZzU3RiQmhFUXcvQzVRaXFxMk5iNEJPUDVaTnE5MVBRM21kNDhBS0lz?=
 =?utf-8?B?YWQ5TGdLK3BDNGJrUURqTE1GdW9TOWJPNFhkVWVTQWRlS0orQ25qdEpqczZ1?=
 =?utf-8?B?OHVrZ0RnNUhXOFJ1YjdpNDR4L2dFV2pRK3d1aGlKZ1FTNFhRMUptbEsybW5B?=
 =?utf-8?B?NG14U0JjbWNiTzg5KzJyaWRxREJVYjRFR25nMWovaEM4bGFvQTRINkthZFF2?=
 =?utf-8?B?TlV6UkFEVk9UbTYrUU1SbEUwVy9RNjF2TmtIRkpRdEsrcDdjQkloWnF6OE5r?=
 =?utf-8?B?MFBqMUM3b3kzOFQ5VVJIa2RmVHdrSDhGWm1BTW1JWFgzNU9OcnFFTmhnVUtB?=
 =?utf-8?B?MW9UMUlaem5HaWJUL0RhTXlIak5XVnFYdGtDN0w1ZUp6TTRxVUx3OXlBZDIz?=
 =?utf-8?B?QnVuTHFQNExJdEtYcnl3Sk5YS3k3YWl0SWRXRVFsckltU1IrZzJPM0IwRnds?=
 =?utf-8?B?dUY5eEZjTTAvcEtjRTNwc2RkeUdCcm1CYm1sdW12SG44N2ZCZitBTVJGU2RF?=
 =?utf-8?B?TWlWMHdyLzZRM04rb1JvdEUwK0JvMHFYQzZZSkFJbVVjaWZJWW83NHZxenFj?=
 =?utf-8?B?dXZaMk9lcVg4eDdsOG1OeUZoQzhYTGMzMTlRS0Y3bjZ4TTJmam93OHU1SXNY?=
 =?utf-8?B?bWlkV0ltbFBtSXRtUXV0RTFBdlRJVk1SSnBpTm1PZXZtZUJUUmZZQzhuN1dH?=
 =?utf-8?B?NmVpcjVxVEwrakdoQ29WdUJXakdzK1p4dWVSL3ZIcGVXdUJjM21QemVPZ1ZV?=
 =?utf-8?B?bVYyU3hyU0hYN1c3OVkzaGEvWWR3Z2VLNWQ4RXNvcWpoTklDYWxJZ0xhU0Jt?=
 =?utf-8?B?VlhYZmNqU2JlbEZCV1BhNGo2MER4MW93RmZ5cG5CUS8zTTc3Z3FteFJNNHNQ?=
 =?utf-8?B?ejJjWnE3ZURxV0dLbW1heTdGQVoxaFZ4allOQW9SNDJDS3JVZ0cyR2s5T3pJ?=
 =?utf-8?B?T1MyaSs0NEIwaml4VGdkMWJFMGRMeEtocFk5V2dkeWNKVElKRFJGUlkxSFl6?=
 =?utf-8?B?N2doNmRjck0xODhieGE2NVFOTUJxVU1PMjY5RHNYdEFubGFpWUJPTzFkVXg1?=
 =?utf-8?B?eDhTL0ZEN3FQUXBTeDNtdjY5azVUTHY1TFNNUTUwNVlwWHFwcHVFTDRLcTM4?=
 =?utf-8?B?cEg2TmUvOHMwenAvcDgxcWdTSXcrNm82WFFLcndTemRraUFaT2RtR2E5ekxF?=
 =?utf-8?B?b3FGd01qbkZhVnZEdGw2L3gzTkdKdW9FZWtPL3VwMzg5MjhHUmlNZkxJaWhr?=
 =?utf-8?B?ZzcrVC90YlF4M0pPVVhSMjRzZGNBZFdJbU0xcXppRm11b2h0RXNMMWQvR1l2?=
 =?utf-8?B?SlA4bE1QbTd5S3F5aUY2ank1b3VJVVBXU2JFVTBtajBhT0d0R3dkb21ZWjdT?=
 =?utf-8?B?dStMVWJoTTlHTGRrSmxzN1I4ZmE3aWxDa0hOSi9XN1dTVUtNL0EwbVRWMUY4?=
 =?utf-8?B?QVNuQWQwN1FEN250bkh2RjJLalFQeFBXNWI1Y0ZweHU1SHZaZGx4U3ZrRmpC?=
 =?utf-8?B?Vk1VSWM1ZWNCUm9wdEx0OGxZK3c3b1IrRm0yLzF5SlNSRlJ5aTdWZlpCUDZB?=
 =?utf-8?B?SHgzUmFFVG83M292NkdieTNZczRGb0FBSmZJbFNlSE5URndFQVRncy8yMVZF?=
 =?utf-8?B?SGNBZmlGNXpVWVI5V0VNcCt1Q09EQ2VwcXlURVhqQUM4cUIzazlUOGY0SllF?=
 =?utf-8?B?WjY0N1cyNnRaUlJ6RnBjQXJoSFJjTGVvZ3gwak52WFdsK05GRzhyL0lzRDBy?=
 =?utf-8?B?WFBvUVRkTWx5NzA5WGxUMXVPTlZyR1NTZDQ3Vkl6QUNvZXFCcDRuY1pKMnd0?=
 =?utf-8?B?eDd6eWlwSnZoMXFhNFdQeU93c0p0RVdOQ2xudWhIUDZuOEgrQmJoNzR5UEh1?=
 =?utf-8?B?U240YXZDMHpPaVVUNTRKNDNpN3pkOTJWOTdVVlQvaDZ4ZXBENnZESlR5clYr?=
 =?utf-8?B?dnpLQVBOK1hIQ0RVVXZ2S2JLL1BiTXA1RElJZUs4QkNxRXV5OXlQZkhZcHJu?=
 =?utf-8?B?NVYrcUE3YW9PWGNkaStvZWxSSjcyL0hxaEdqVU1wSHdwdW9mc2lwM2RFdWps?=
 =?utf-8?B?UTV6TFdENS9teG0wWHdXWVpaS3ptcHl1eXI3eis2REZnQXMxNmdQS0xuREVu?=
 =?utf-8?B?MDlBMS9sRk1KRGNaVHh4NmJWaUFMSmg4ME9OajFWMmFoNUJoeHN6Q3RyUmoz?=
 =?utf-8?B?Y2NFODcvdlJSYkVGTlE2R2NjcXl3K3ZLSXQybmU4SWdkc3dkYkJPeHE1WVFh?=
 =?utf-8?B?RnNidjFCZG1ZNXUrWVJubTFnNEJmT1g2ODNEK1phajZTdm5KbkljTllMUjkv?=
 =?utf-8?Q?vFIKKrsO5cDoEI6Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7D534AFA47D124BBA35EA1FFBE038C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5e597b-03ea-4665-5418-08de554ed18b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 22:30:14.4144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDxFG1XrjeIkm9Z3NKo56TDGFJqpYtX13AOXF1kyH1+fxNen3lVc6gtg7STENiHlbWPm+V4/AfExKDzs+SUSfWUyHQowgFNfQCWg0HzMMX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7398
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

T24gRnJpLCAyMDI2LTAxLTE2IGF0IDE0OjE3IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBJZiBhbiBleGVjIHF1ZXVlIGlzIGluYWN0aXZlIChlLmcuLCBub3QgcmVnaXN0ZXJlZCBvciBz
Y2hlZHVsaW5nIGlzDQo+IGRpc2FibGVkKSwgVExCIGludmFsaWRhdGlvbnMgYXJlIG5vdCBpc3N1
ZWQgZm9yIHRoYXQgcXVldWUuIEFkZCBhDQo+IHZpcnR1YWwgZnVuY3Rpb24gdG8gZGV0ZXJtaW5l
IHRoZSBhY3RpdmUgc3RhdGUsIHdoaWNoIFRMQg0KPiBpbnZhbGlkYXRpb24NCj4gbG9naWMgY2Fu
IGhvb2sgaW50by4NCj4gDQo+IHY1Og0KPiDCoC0gT3BlcmF0ZSBvbiBwcmltYXJ5IGluIGFjdGl2
ZSBmdW5jdGlvbg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1
bW1lcnNAaW50ZWwuY29tPg0KDQo+IFRlc3RlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5z
dW1tZXJzQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNf
cXVldWVfdHlwZXMuaCB8IDIgKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3Qu
Y8KgwqDCoMKgwqDCoMKgwqAgfCA3ICsrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX3N1Ym1pdC5jwqDCoMKgwqDCoMKgIHwgOSArKysrKysrKysNCj4gwqAzIGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZXhlY19xdWV1ZV90eXBlcy5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNf
cXVldWVfdHlwZXMuaA0KPiBpbmRleCBkM2UyNzg5Y2Y1YmMuLjljY2E1NThjNTgwOSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5oDQo+IEBAIC0yOTgsNiAr
Mjk4LDggQEAgc3RydWN0IHhlX2V4ZWNfcXVldWVfb3BzIHsNCj4gwqDCoMKgwqDCoMKgwqDCoHZv
aWQgKCpyZXN1bWUpKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKTsNCj4gwqDCoMKgwqDCoMKgwqDC
oC8qKiBAcmVzZXRfc3RhdHVzOiBjaGVjayBleGVjIHF1ZXVlIHJlc2V0IHN0YXR1cyAqLw0KPiDC
oMKgwqDCoMKgwqDCoMKgYm9vbCAoKnJlc2V0X3N0YXR1cykoc3RydWN0IHhlX2V4ZWNfcXVldWUg
KnEpOw0KPiArwqDCoMKgwqDCoMKgwqAvKiogQGFjdGl2ZTogY2hlY2sgZXhlYyBxdWV1ZSBpcyBh
Y3RpdmUgKi8NCj4gK8KgwqDCoMKgwqDCoMKgYm9vbCAoKmFjdGl2ZSkoc3RydWN0IHhlX2V4ZWNf
cXVldWUgKnEpOw0KPiDCoH07DQo+IMKgDQo+IMKgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3QuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9l
eGVjbGlzdC5jDQo+IGluZGV4IDhiZjMzMGFlYWVjMC4uMDA1YTViMmMzNmZlIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY2xpc3QuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZXhlY2xpc3QuYw0KPiBAQCAtNDY4LDYgKzQ2OCwxMiBAQCBzdGF0aWMgYm9v
bA0KPiBleGVjbGlzdF9leGVjX3F1ZXVlX3Jlc2V0X3N0YXR1cyhzdHJ1Y3QgeGVfZXhlY19xdWV1
ZSAqcSkNCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsNCj4gwqB9DQo+IMKgDQo+ICtz
dGF0aWMgYm9vbCBleGVjbGlzdF9leGVjX3F1ZXVlX2FjdGl2ZShzdHJ1Y3QgeGVfZXhlY19xdWV1
ZSAqcSkNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgLyogTklZICovDQo+ICvCoMKgwqDCoMKgwqDC
oHJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZXhl
Y19xdWV1ZV9vcHMgZXhlY2xpc3RfZXhlY19xdWV1ZV9vcHMgPSB7DQo+IMKgwqDCoMKgwqDCoMKg
wqAuaW5pdCA9IGV4ZWNsaXN0X2V4ZWNfcXVldWVfaW5pdCwNCj4gwqDCoMKgwqDCoMKgwqDCoC5r
aWxsID0gZXhlY2xpc3RfZXhlY19xdWV1ZV9raWxsLA0KPiBAQCAtNDgwLDYgKzQ4Niw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZV9vcHMNCj4gZXhlY2xpc3RfZXhlY19xdWV1
ZV9vcHMgPSB7DQo+IMKgwqDCoMKgwqDCoMKgwqAuc3VzcGVuZF93YWl0ID0gZXhlY2xpc3RfZXhl
Y19xdWV1ZV9zdXNwZW5kX3dhaXQsDQo+IMKgwqDCoMKgwqDCoMKgwqAucmVzdW1lID0gZXhlY2xp
c3RfZXhlY19xdWV1ZV9yZXN1bWUsDQo+IMKgwqDCoMKgwqDCoMKgwqAucmVzZXRfc3RhdHVzID0g
ZXhlY2xpc3RfZXhlY19xdWV1ZV9yZXNldF9zdGF0dXMsDQo+ICvCoMKgwqDCoMKgwqDCoC5hY3Rp
dmUgPSBleGVjbGlzdF9leGVjX3F1ZXVlX2FjdGl2ZSwNCj4gwqB9Ow0KPiDCoA0KPiDCoGludCB4
ZV9leGVjbGlzdF9pbml0KHN0cnVjdCB4ZV9ndCAqZ3QpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19zdWJtaXQuYw0KPiBpbmRleCAxYjJmNjZmNDQyNWIuLmU5ZjlmODQ0ZDUwZSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IEBAIC0yMjA2LDYgKzIyMDYsMTQgQEAgc3Rh
dGljIGJvb2wgZ3VjX2V4ZWNfcXVldWVfcmVzZXRfc3RhdHVzKHN0cnVjdA0KPiB4ZV9leGVjX3F1
ZXVlICpxKQ0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGV4ZWNfcXVldWVfcmVzZXQocSkgfHwN
Cj4gZXhlY19xdWV1ZV9raWxsZWRfb3JfYmFubmVkX29yX3dlZGdlZChxKTsNCj4gwqB9DQo+IMKg
DQo+ICtzdGF0aWMgYm9vbCBndWNfZXhlY19xdWV1ZV9hY3RpdmUoc3RydWN0IHhlX2V4ZWNfcXVl
dWUgKnEpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpwcmlt
YXJ5ID0NCj4geGVfZXhlY19xdWV1ZV9tdWx0aV9xdWV1ZV9wcmltYXJ5KHEpOw0KPiArDQo+ICvC
oMKgwqDCoMKgwqDCoHJldHVybiBleGVjX3F1ZXVlX2VuYWJsZWQocHJpbWFyeSkgJiYNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCFleGVjX3F1ZXVlX3BlbmRpbmdfZGlzYWJsZShw
cmltYXJ5KTsNCj4gK30NCj4gKw0KPiDCoC8qDQo+IMKgICogQWxsIG9mIHRoZXNlIGZ1bmN0aW9u
cyBhcmUgYW4gYWJzdHJhY3Rpb24gbGF5ZXIgd2hpY2ggb3RoZXIgcGFydHMNCj4gb2YgWGUgY2Fu
DQo+IMKgICogdXNlIHRvIHRyYXAgaW50byB0aGUgR3VDIGJhY2tlbmQuIEFsbCBvZiB0aGVzZSBm
dW5jdGlvbnMsIGFzaWRlDQo+IGZyb20gaW5pdCwNCj4gQEAgLTIyMjUsNiArMjIzMyw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZV9vcHMNCj4gZ3VjX2V4ZWNfcXVldWVfb3Bz
ID0gew0KPiDCoMKgwqDCoMKgwqDCoMKgLnN1c3BlbmRfd2FpdCA9IGd1Y19leGVjX3F1ZXVlX3N1
c3BlbmRfd2FpdCwNCj4gwqDCoMKgwqDCoMKgwqDCoC5yZXN1bWUgPSBndWNfZXhlY19xdWV1ZV9y
ZXN1bWUsDQo+IMKgwqDCoMKgwqDCoMKgwqAucmVzZXRfc3RhdHVzID0gZ3VjX2V4ZWNfcXVldWVf
cmVzZXRfc3RhdHVzLA0KPiArwqDCoMKgwqDCoMKgwqAuYWN0aXZlID0gZ3VjX2V4ZWNfcXVldWVf
YWN0aXZlLA0KPiDCoH07DQo+IMKgDQo+IMKgc3RhdGljIHZvaWQgZ3VjX2V4ZWNfcXVldWVfc3Rv
cChzdHJ1Y3QgeGVfZ3VjICpndWMsIHN0cnVjdA0KPiB4ZV9leGVjX3F1ZXVlICpxKQ0KDQo=
