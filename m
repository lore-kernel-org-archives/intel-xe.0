Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C5DCAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 16:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC8E10E819;
	Thu,  2 Oct 2025 16:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="il7bD4QK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CCA10E819
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759423509; x=1790959509;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3xvUuzfJL2IsAip/LBeRaze+xFehaxAbTzI7o5IjC3A=;
 b=il7bD4QKFxxHa+q++hTIpZ/bKSL7wp9z8o2BLLWEuP01lMNkipGcQ9Zp
 ol5exXP5qOWhFinAcRNFCexGGfTGggWKret2WHCpywoS8X4S221Ty/I4E
 DcFGzVBa6lcABwTxs0h3+zoPOa5Y/tUAu4bULAGi3Dsj+MykT86TKhQaS
 xrY0n5i07IQhQoj5PiNqkFzVsy7G70fyiusNI3wlS2i2QBj5RyjFZ9VyJ
 wREvq3RTpM5/Nhl+qWrpuHZE3wXoS7uOkWaK8XZUFuOU8XYtiBgaSdCnw
 L0NKgoELeUnBqFpSM5GplMVu+IhnVN05rpyvewjqXQvXykFn2l5eKJPe7 w==;
X-CSE-ConnectionGUID: 3cRRZdotS++blVRRRPZRwA==
X-CSE-MsgGUID: 2O4Gd3+LQeSmVnW0zI4Vcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="87165003"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="87165003"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:45:07 -0700
X-CSE-ConnectionGUID: 9RxOml7oRBCHEZI5LeyfkA==
X-CSE-MsgGUID: R3i0tK5mTdag95ZmSHqGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="178192458"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:45:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:45:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 09:45:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecv1jjX0MZqp4c/weMacBy9Q/Hl/MCi6cdeJu71+O+DF14MfiO2w72HslNuVFrLNo8sbvberyJ/081YlkpHLPz4PYpgYqBY212Sp9M/L9cQndb0RoB8DNEjhN0A+2AWGfMrNnmfa6MKN5F3N/oPmvGCX8HTn0ZYreO5zHQCTDnjxLBJXaU085wJShVGiS+jrfaoTSJNwAQUKEYuVp7xDGFgPImsUn6Om8oYUpAmzXauo9V4uuW+0oZ9Vc7m9V72bswEFHVkP/JPM+wYQyEBT1Wwazbn7A+fWkpwv2EXZGh14sYPSlr1TFSZ62Omo/9Ej9fX5Trm9ywKExpqmWDUgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJtJmuXlgHunDOmCB+z4G0X7+mYYCvuKi0h+p9oZags=;
 b=kSbWQRVb88SOnpASfBOeg4loVBtL2v7rVJZikMPXSEP0WmGYu/DWW0oZnqYacdfb1U7w17mVGBktANReqXSFwLk5M792FjyPaz5pGQ4+DwZBtIC5SjWc2AlyMSByituzW6NaR1Kw5XuU8X7QJVvS00/brk2zN8RfAj8BWpDsgA+5NIVKRZFEihEHH5wwqQRCTxfILTrPbX4Ox3+k6W9AuQa6sTQ57XjH91Xcn+TMiNgPRM3xbz5YyoKO9USyST0xNwiLmm4JKFd45qwETkPXpyPbMv3Uf7Kn5i3NN6PCA18Vij4L91um8eItfsUIxLwioZQbVlphPEw48OSeeYtM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB7502.namprd11.prod.outlook.com (2603:10b6:a03:4d3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 16:44:55 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 16:44:55 +0000
Message-ID: <d006de90-5172-4ea1-b37b-e4f65eed3c15@intel.com>
Date: Thu, 2 Oct 2025 18:44:52 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IERl?=
 =?UTF-8?Q?tect_GT_workqueue_allocation_failure?=
To: <intel-xe@lists.freedesktop.org>
References: <20251001144051.202040-1-michal.wajdeczko@intel.com>
 <175934249178.384040.11607214904303851894@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175934249178.384040.11607214904303851894@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: d879a5cd-da0c-45cd-7fa2-08de01d30439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjlWOTd5NmpsRE1vWklQdmRaT2lGODd1Zko3bkNxenZkQndhZDIzMUFjOE5W?=
 =?utf-8?B?dDVUOWtHS2VZSmhRbXBGVlJYWFA1Y2dKTUc2NmxZSnFmcXQ4TzQ2ajNOV09v?=
 =?utf-8?B?RnFlTm8xMzl0aXZQL3REamoyNGlwMDZnUjRkQkNsNFdBd25PZnVXczJhdzlt?=
 =?utf-8?B?clNVSk96eW1EVlVVVjNhdXJqbzZrekluR0ZlZm9ueFFBWE1tVkZsRTVlcGY3?=
 =?utf-8?B?cEp5aEp6THVDVXBRcFdweVc3MTk4bGNCdGo0c1UzZmNlc0phUGdFUTFwQldO?=
 =?utf-8?B?VjlMZ0dLOWJMcGswdDJzSTA5bm4xK3M3bGs2NGhMZ1NTeXVuY2FFSzJEaHVp?=
 =?utf-8?B?M1hXWDNyZnp0bEliUFEwUjhvWlptbHhIVFFjK1VvdDBkRGdrYlhad0hDaVo4?=
 =?utf-8?B?eEZpZ1lNKys0UmQwV25NY2wyaEZiUEIyRWJYV3c1cjY5RE0vYU96bEpyK2RZ?=
 =?utf-8?B?QWNCaXdXbUhCL1d3bHJqQnJZN3FtdTJOaitpVzkzaG1Dd2VvbmZxb0ZheWFa?=
 =?utf-8?B?MXZBbElIUjN5eXNLRDRLTG1TV0xUMkFpWU9Wem5TVTN3SFhEQWs0Vlh1SGpy?=
 =?utf-8?B?TmkyRHIzNmZhalJWYisvM081UFpBaDZmN0M4M25QOGoxOTFpL1ROeURjUWp2?=
 =?utf-8?B?M3BiUjZJYnRzeVM1Y0pwQ1N2eVJoTE1qcDhTQ2lhc0k4TlNhckgxbkluT3Ax?=
 =?utf-8?B?YzVzWWU0OHdrMS9ZZGJXa2FHWDhsZXJtVU1GNHRrMjR0TlpGMHF6TEhQaFdm?=
 =?utf-8?B?MDlhUW9yQngxMUJtWk5IRnV0cDlJcDlEN3FvVU1kdDZ6L3VSb3RvVGorSTBX?=
 =?utf-8?B?R2NML3ZWQjRJMWo0QUNYN283YmdFVTRVZk1BLy94MkZydzRDaGtOc081TlZR?=
 =?utf-8?B?WHlpNUt4eURpdi9MUTRLTWFUeUw3VlluQ1hCWVdYdE15cHAxc2lXdm5rRmxV?=
 =?utf-8?B?V3pJWS9Zd2lvNEdxZU5wbTR6SldqQmZFb01IclpqSjF6MVI4YjZwRDRSQUVM?=
 =?utf-8?B?Sko3MFNmTFdZVjh2S1k4UGtOaXZjL29CcFppaFI3M0dRcGxwQTVOV3FEVmE2?=
 =?utf-8?B?bnVPUFc4Wnl3QjRCZExQY05QeW1iV2MwT1VsWmFsK0NMWThDdDExcldESG5o?=
 =?utf-8?B?N0ZUNHlkblg2S2E0RjBDS253UDE3cXFhb0hVZUEwRmx1Q2dJdklHR0dTYWs5?=
 =?utf-8?B?RkFheHdrU0EvWXdLbWd6TVBnOFBaVGtRSjlPWEtpU1ZON1Vqc3IxMFREM2ND?=
 =?utf-8?B?UUFNNkRJcXc3Z2lFTUE4cXVMZlIyblBENm9BNDJBOUx6dTNjTEN0d0s1VFJo?=
 =?utf-8?B?Qkk4SkJoVjdwdEdSQ0Y2ZlpGNU1SZFY5ZkVndlZNSW95UVJaR1pQSXBjbERz?=
 =?utf-8?B?cnhHdXZpVGFNMDhNdnYzZVgyOXRCUHpQcVgraXFJRFZxNGN4aFIxMXpnYmZT?=
 =?utf-8?B?a2ZreW9lWjFhS2ZXTlZONGVRZ1NiZ2NhOExqSFRwczB6cDNJMlpFK0Y2VVhU?=
 =?utf-8?B?WmNZUmNwMWJuY08vd3JCVnk2K29XNnJTY1dkazN4THBmWEtvSG96UDhaTGc2?=
 =?utf-8?B?aWF0UDM0TVFadVdCOUpWT0w4OFg3aGN3UXg2RXpXajNoSzNRVHlWOHZtNm11?=
 =?utf-8?B?NGZJY1plL0xPeHFRb0hVYXdUSWVnU1V2SVhvcW9EcmwyK0MxZ3NHcGdnVERa?=
 =?utf-8?B?RUVFMkJrQUdJOTlqWWV4TzAwbWYyRXJWVDgrZS85UE9RMjFTU1ZPa3BQQVU2?=
 =?utf-8?B?Z1kyQW0rVXZIdDZUYkxpTnI2aVRIa0I4a0JKaUVkQWdYRVNDcm15OWNqbDZw?=
 =?utf-8?B?cjlURzROVjJVazRXbEs4bzRkUUJVc29CZGhsdE1qSTF4MU45YS9iNjBBMy83?=
 =?utf-8?B?K0k0VXF5VVdQREpsWTEwdW9qZ2dmTHhtdmluTW9uQjFVSFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1J4OGlURHV4WGlPdkg0c1MwKzhTSjV1UzVuTnREZ01aeDgvOVFYdFVFTG1Y?=
 =?utf-8?B?VkJrVjVFQ2FkTllqdkx4T2UzdFlQUVhGU1ZZRmxId1l3UXRnNzFTVS9ZR3RQ?=
 =?utf-8?B?KzNFRzlWT3VzU0FQSklDcVFxbXVvWXI3KzQxeDMzTUpwUWQ3MkxWazZLTWVk?=
 =?utf-8?B?clVMM1ZPRDZjbnlMNHJHTGZ5L1lrT2EybUhUMC90MGp5YmVocUEvR29hOXB0?=
 =?utf-8?B?VC8wajRwOGNUM2hUcGw5Z1liWEpUTU9DY1BwY21TUUV4Yi9tTE9wcUFjejNx?=
 =?utf-8?B?VWQ2ZTg4MWtNTFpnRmZ5ZTBPQkEvV2tpYVpnTWlvdXdrVDZuei9hSFNWV0hH?=
 =?utf-8?B?VGUvMEszZXFQclhEeE1DY1BJYng5UkhhdmpkSUF6SGlOTHgxQlJPdUszMS94?=
 =?utf-8?B?djRaU2p5S2ZEUENjZ3VsWnhDbDdmV3ptL3hWMnpyUFk4UUJTMWJYQUlsSW1F?=
 =?utf-8?B?T3VSQTFERlBBcWtCekdTaXdnQnB3RnhQVXVqSUZUb0EzNytILzZuZjA2Y2JL?=
 =?utf-8?B?UVlBckxsSVlUOE9IQ0V1SmZ0L0dqcklJUFl2YzlLZjNJei9CemNueXBwZkM3?=
 =?utf-8?B?bVUzdy9ZOTNIanFJVUU3N1BrTC9nODVDMDZ6YjBYcDRTLzVob25NN1RVS0NP?=
 =?utf-8?B?QUZ0MjJPRW9pVlhpSTJ1RElFQUVSRWJQWDN1NGg5cGYwcFVKQnRkMmkxNEtt?=
 =?utf-8?B?cE9TOTJsR2hYMEZCZmtQNWRIYzI3UG5YMG81ZU1MT0ZQc2JYUzhMTE5wNEZW?=
 =?utf-8?B?bkRWOFJ0Qnh3MlBDRWRNcHJ2N1RYS09EMXFESjFlb3FUeFpxTk5kMXMreCtF?=
 =?utf-8?B?UzdjZkhTV3JjdDlseUMrdkVITzA5ay9YcUJSaHhpeEJTRWlkTXJ1SVdsaVBG?=
 =?utf-8?B?S1F2d1QyZHdOaXFSMHU2ekVxc3BkNENFN2J6MkRFVnJJQko5SDlla1lLb3hs?=
 =?utf-8?B?TGNzYTF5Y0NIdDNQUHdacnNrc0RKcU1tb2tiN0NhdmJQaThqWUhPUnR4YXJO?=
 =?utf-8?B?NHlQWStOemJtUkRScEV5R1g2eXhpdVRPZDdPTVphSkphckt2aDZ0STJCV3NZ?=
 =?utf-8?B?NlVqbjk0NDVZaEppOFJMQytlWFo4dEVLbStjOTlJRThrd3M3cUxlWXg5OVpr?=
 =?utf-8?B?TDU2dFhKMVJaTEo4VkVwRi8weW5sTXhNbjhRc08vSGVXT0tOTkNwMjh2cU5J?=
 =?utf-8?B?YnNYVmZuckZKRWFlZkdHUnhDS2xUNnlOTlprVzJhTURjVDFGMXJrdmtlSHht?=
 =?utf-8?B?cnJjaVJNSFFaejZ0QnV4bHl3dmVPd2hwbGhlb0RlWndaY0tOT3RkNzdjbVNJ?=
 =?utf-8?B?cE11T3VjMXdmd3ArZUhCMGtuWkZ3eDJNdlk0ZDYxRllMVS9GdFA1cFlIbEdF?=
 =?utf-8?B?K3dPNWljU0txdHF5WXpGR252aTlBa1BsUy9XbkEwZFloSnJGWjNSVUZRQ3lI?=
 =?utf-8?B?enhPM201SmFDanIyenRaeG9JU3hLbFh0TGc0SmFPR2RsNlZycWgxU1RBV2Yx?=
 =?utf-8?B?K2szYlIvbnUxZTFwdlBLL2ExaUIwNmJDZ2lVQ1lCb0RoVFcrcGJHOHEvZ0d0?=
 =?utf-8?B?aXhuQ3hkV1FXbXFxdTQxdzcrWEVmMkVLNmFjMFcxNGRvcUF4M0liZ2FaeFFk?=
 =?utf-8?B?Q3BBM3JSbEhMalNqN1dZeEVFSFVXaE1SdXkrVkpkOEVqeWZOQzdaeGZDMGpq?=
 =?utf-8?B?NnE5TEpmSGFhYU1QWWZtWmtJdVFaMjRyWDlXclkyY2JiT1F6bDNROW1wNGt0?=
 =?utf-8?B?OEZuaXNyRDZPbjlmNzlzZk1ncTREOUpLTlBYdTlyMXZxK092R3MydXo0OWtQ?=
 =?utf-8?B?bUdJOFoyR3RYam9XNWo2Z2lXS3dmT2RDdTY1Umh6SWpTTCtxWjhrbmdLWDBy?=
 =?utf-8?B?L1BLc2VGOWZkZCtZN2ticTQycEo3MWp5UmIyZmFzQ0haZ2NqUUxGL0NMR0U2?=
 =?utf-8?B?WGRYWGg1VWhMb1hmaXh3ZzBWT3lWMFVJN005bnJiQlN6VURSeDYyYkRCWmRy?=
 =?utf-8?B?K1lpSGRGMU03U0JFK1I3akJJOVhSazlOU2cyWS9TaExPNkE0N1p1eG9qYlVU?=
 =?utf-8?B?SFl1bFgra2VzYVJ4aWNKNTYwYitabGVJdjc5ci9TbG5mRXBwQy9Ha0I0Rjcr?=
 =?utf-8?B?alp5VmxOWU9uMFp0TG82dyttSnpqV01YeWNzRGt3N1VTTzB5SmpWdHRQSjk1?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d879a5cd-da0c-45cd-7fa2-08de01d30439
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 16:44:55.7026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1QGuHmoXEDjV6UywoL2+6s+T9tk+JfKpKjnHLSuvhgLfYz7D0TWqJs8AWmUCqnqTWE7kz2933WUPI4UfzZ+PBftcio/G/XIxp9MZIajVBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7502
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



On 10/1/2025 8:14 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Detect GT workqueue allocation failure
> *URL:*	https://patchwork.freedesktop.org/series/155297/ <https://patchwork.freedesktop.org/series/155297/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155297v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155297v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-3853-5f87abb254011980c8332008cfff72d2cfab4952_FULL -> xe-pw-155297v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-155297v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-155297v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-155297v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_create@create-contexts:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3853-5f87abb254011980c8332008cfff72d2cfab4952/shard-adlp-3/igt@xe_create@create-contexts.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155297v1/shard-adlp-2/igt@xe_create@create-contexts.html> +1 other test fail

unrelated

	
Starting subtest: create-contexts
(xe_create:4189) CRITICAL: Test assertion failure function create_contexts, file ../tests/intel/xe_create.c:488:
(xe_create:4189) CRITICAL: Failed assertion: !err
(xe_create:4189) CRITICAL: Failed to create exec queue (-28), iteration: 256
Subtest create-contexts failed.

>   *
> 
>     igt@xe_wedged@wedged-at-any-timeout:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3853-5f87abb254011980c8332008cfff72d2cfab4952/shard-adlp-3/igt@xe_wedged@wedged-at-any-timeout.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155297v1/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html>

good catch, but unrelated

<6> [381.540387] xe 0000:00:02.0: [drm] Tile0: GT0: PF: Failed to disable engine activity function stats (-ECANCELED)
<6> [381.542337] xe 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=none,decodes=none:owns=io+mem
<3> [382.593352] xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: PF: VF1 control command FLR_START failed (-ECANCELED)


<4> [397.730665] Memory manager not clean during takedown.
<4> [397.730680] WARNING: CPU: 5 PID: 5336 at drivers/gpu/drm/drm_mm.c:964 drm_mm_takedown+0x3f/0x100

<3> [397.733005] [drm:drm_mm_takedown] *ERROR* node [0156c000 + 00001000]: inserted at
 drm_mm_insert_node_in_range+0x2b4/0x520
 __xe_ggtt_insert_bo_at+0x167/0x530 [xe]
 xe_ggtt_insert_bo+0x1a/0x30 [xe]
 __xe_bo_create_locked+0x2c3/0x660 [xe]
 xe_bo_create_pin_map_at_aligned+0x51/0x1f0 [xe]
 xe_bo_create_pin_map_at_novm+0xa5/0x130 [xe]
 xe_bo_create_pin_map_novm+0x23/0x40 [xe]
 allocate_engine_activity_buffers+0x53/0x120 [xe]
 xe_guc_engine_activity_function_stats+0xf7/0x1b0 [xe]
 pf_engine_activity_stats+0x78/0x130 [xe]
 xe_pci_sriov_configure+0x701/0x1220 [xe]
 sriov_numvfs_store+0xb6/0x1d0
...
<3> [397.733412] [drm:drm_mm_takedown] *ERROR* node [0156d000 + 00004000]: inserted at
 drm_mm_insert_node_in_range+0x2b4/0x520
 __xe_ggtt_insert_bo_at+0x167/0x530 [xe]
 xe_ggtt_insert_bo+0x1a/0x30 [xe]
 __xe_bo_create_locked+0x2c3/0x660 [xe]
 xe_bo_create_pin_map_at_aligned+0x51/0x1f0 [xe]
 xe_bo_create_pin_map_at_novm+0xa5/0x130 [xe]
 xe_bo_create_pin_map_novm+0x23/0x40 [xe]
 allocate_engine_activity_buffers+0x8e/0x120 [xe]
 xe_guc_engine_activity_function_stats+0xf7/0x1b0 [xe]
 pf_engine_activity_stats+0x78/0x130 [xe]
 xe_pci_sriov_configure+0x701/0x1220 [xe]
 sriov_numvfs_store+0xb6/0x1d0


