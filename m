Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB90CCD1BE
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 21:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E7B10E84D;
	Wed, 22 Oct 2025 21:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEkZ+El0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B82410E84D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 21:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761167762; x=1792703762;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MRHwqFpOZFhsf1SVe1PZVXvHE4RvFDU5sdBJZCxZb/8=;
 b=lEkZ+El0v73HqOnBVJRqwcIueosSHMFo4QdE9EiEGO29HYOeuV5dWg0o
 7riKyGJlGt2JXXd99YHYjaPranOZ4Drq7wSJkqFMGX5FUF9SABt40SqKx
 h2wcGkeDuziRaeu+dkcRNPG5l+QYJ+0g7p8H/FtdGEVPQbFi1BewpTqN9
 eIfltBiamvx0uEsCURkzd9C/mt7J7aM2ymdVf820Tww+xBWuIsh1lxnnK
 9aWyaoO0rQX3GhxxDqdc1tbjDS7bYujXUZN77EuqL1HXmqj8N8GvSSnRX
 NrqXEpececKCqPsTTyY82uXDJO64tAzzyhcY9FuoJYr2FrCNbHSk4McUA w==;
X-CSE-ConnectionGUID: kxrePYwnTmSm2zWlMIyGBA==
X-CSE-MsgGUID: juvbTjhSQeOdp8nSKdo8tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73618520"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73618520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 14:16:02 -0700
X-CSE-ConnectionGUID: G4S+YVcGT1KPvghjDrgV7Q==
X-CSE-MsgGUID: prE05aARRaeskyJZ4bcWzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="188264620"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 14:16:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 14:15:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 14:15:59 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 14:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkY6TS2iI14AVakRMCblBsgQr12BmoGxlU3y8EZntbWBpYtxOUrEGAwdi2CRXwuEghcorLws00AAhtLKu31TGqulO6t3BcTMQetCjmence0+viH9PaLOXs1CjBTQ8VmYgqY1E//cAqOTy9MaDQmME/VyaRQVyLuasyqVMuSZ2SJjJY9upEsbhpEEwzzz/t1b5BXjwl82EkbEa3aIqc3ECzMaGzteuwGMji52hKl4SD5+BajVih0RERYD5L4Yg56j3oiovQtkj4Pzv6cL/JpCXysrEdAcc4l5jIQp+whlfEQdKgkmcVkWLt8oQjS4PCNrOxJ5zmgbMxhpIn/xOK5YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AxefDt2yRONQO4wEFGlq6JJGz6M1Wax9BgazCBeIvY=;
 b=yJtU1wOVzqt70tJx9yEIqAwZh9uDYy+NjmBtked1nRsg552kIdOvpzLocpILMZahmY+eOwVNlSbCkIrPbL9H3B6fKS0RRL/AC5RvM7PmKJGPuegLZHBw5G7GuLylZMzxkpUScu46RKsmuXoj1nFPGayMpiAYrPzOqsogb14J4CnsucZzXBO+I0/UjLWUxxLiuDHA7PViJqUtD3IaWN5u+lD6x6q6zoQLv0rewvaP8+ms3T5fmlBUGse9QvJeg9Hby840HtR8KL2Axt9Zu0mvMZkEojMoH0mBwXmfeLhumhBR/OvVVmjtcDbBuWMCls0s/2K+aEwa8uEF28L42WW3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 21:15:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 21:15:57 +0000
Date: Wed, 22 Oct 2025 14:15:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <zhanjun.dong@intel.com>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH 6/7] drm/xe: Clean up GuC software state after a wedge
Message-ID: <aPlJihKuwV3A4cLP@lstrano-desk.jf.intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
 <20251020214529.354365-7-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020214529.354365-7-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0107.namprd04.prod.outlook.com
 (2603:10b6:303:83::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5270:EE_
X-MS-Office365-Filtering-Correlation-Id: c51b3b3d-f001-4945-f2da-08de11b0314f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uys4cHJkb0FZWi9STmllbGIzaityRFd3UnA2WEkyRmpWS0RnWVZXT3lzZHY3?=
 =?utf-8?B?dWZlbHJuSW42bXRFVzhNZGIwN0NwVGNOT3lUKzY5a1I4YURGVXZvclNtQXl4?=
 =?utf-8?B?ZklZU2ZPdkoyVHZKR1IwSm82bXpteEpRK3ZTa2FrUkVCMmhTZXZQU2hSdzIv?=
 =?utf-8?B?QzM3eFJ5UDlObGphNTFUZ2ZITzFNNUVTdlloM0lvYldGLzhmdzhZOWY2SHdm?=
 =?utf-8?B?cXZ6Vm5xUm5jMS8wSWp6eXJtalZQYVFGaHZCbmVIZGFCOGw4Wk0zYk0yd0JG?=
 =?utf-8?B?dWVLYS9rNnlsNDJWNWZJQ0VWWlpvVWNOZG9pckVxUGMzZGF1WEdxNVU2SkEy?=
 =?utf-8?B?QUkyTmlVNWpENlRjVFBQZ081SkFLN2ZFVzk2eEMrQndYMmV1T1BqQThWRm1h?=
 =?utf-8?B?clU2dy91aCtKOXp0TDNmYkRNWjJJcnpQUElSbll2VlhRa1d6UVVrYnZ2dzIw?=
 =?utf-8?B?VEhuaTJ4R1Z3VUpENWR4bHdnNXNldUdocVkzaTlGOUt2d3ROUmRoYUNHNHRP?=
 =?utf-8?B?a0UyR1R4aFkxZEJLNGg1VkJ3VW04R0k3MlBuVGpMakFVTVlUbEZveThYdGFk?=
 =?utf-8?B?aXpHL0FHUzVjUGMzUEZINkh3RW1hT3hPb1F1dlBTd2NtTEVSRW9VZ0VaY2N3?=
 =?utf-8?B?cnhuQ0RYVHhmVmkzSklmV2lkTGIrWjhWTXBjYTMzSHpSUHdxbTg0Wm1vM2ow?=
 =?utf-8?B?ZDZ1R0lGM0ZCalR6akNBRnZReDNxSkNDcWxsZGl2RlVpYmRQbDRUM1IrK2RE?=
 =?utf-8?B?dkxZU3BpYlhsUkhVOEFjN0YrK0NvOVhEeUpNcG01S1ZJU1pueU1XWnJ1RDhY?=
 =?utf-8?B?UGtubjdiNER4M3VvbkhWTGdFYk9IT1FlakxkdTl4dnZaK3JtaDZ6dDZWS1J5?=
 =?utf-8?B?c2RGelFRSXNiaW1GNCtKNVpKTmt3UEY1blNzZUtxMkxjMVA4aEdVZjMxcnMy?=
 =?utf-8?B?c25sKzFaR0w0Zk15a1JrT2pBWExOUFRBMXFmNm5kbmdLL1RqVTZpVmk2ZWNH?=
 =?utf-8?B?SW9NbjlKYzBXaFlKWkxUMTMyRExmL3FkNzFLUXV2a1RtOVIzVDVQZUNHbnlm?=
 =?utf-8?B?cGtKaTFYMmtqQXY0VXZya0JyVEpJS21kTUNEOXdhWTNMWTRvaUdORUxVZUlG?=
 =?utf-8?B?MG5CczY3NHVYVzZHUDMvQWRSWnJ1UlBYTlUwbFNoa0ZNMWlEVVhrUFVHQ3dw?=
 =?utf-8?B?MUYweWg5RU5mTmlFMk5RWVh6aGZRdmY2MFpOVVF5L2ZqYUU2RVZFVW1NS1d2?=
 =?utf-8?B?VS9HUHQzWVdjY01OTFpRVG5OdjIxcTRteDJPZlNxc2FBQzN3RUhmWlErVHVn?=
 =?utf-8?B?YmpoOFIzTUQxemxPRXJYbEkrTi9kSHdHWURtaHVYMzM1Y1dWTnhrM3JzL0pz?=
 =?utf-8?B?OFptaXhTOGxjL05uMEJvTFU1NnhWOXVydGVBQ0VUdko3Z1ZrSDcwdVNVSTRr?=
 =?utf-8?B?TGlQYWhLK1dYdVArREI4dVpFN2NleGo2WUE4YkoyNllwY0pCWmlYTFhWcGt0?=
 =?utf-8?B?MXd0ZTBzWTROMGFMcVczU3F2M1cvc0RCbGVPelJTTVN1bVozY3NWazhQS28r?=
 =?utf-8?B?SHhaYThHcHdGcGk3bzBCdlFKOGRkMWNHUzdUQjh4VGZUVXM3MS9CQnE3akJY?=
 =?utf-8?B?VHdTTlBHL2tVbG92OG5ldHJ2c1cxWGZwN0NTdjd1eFhYc2t0b1pDZU9VZ0J1?=
 =?utf-8?B?K1RzbFd2blJ5MkcwdFdoc2VKTXd2NFR5bHJGSGtkMXVHWW5XZG1GWURIWEhz?=
 =?utf-8?B?T2R2ZlJGV0VDaTlWS1dFaDA2bjIrZVlCZmdMdTl0empZYXV4d2JpZVNacDFP?=
 =?utf-8?B?ZklpOU9mSjVBWC9yWmd4TS9wclpMOXB1Y3VLRzF1U2J5L2VXaHJkZk9pbng4?=
 =?utf-8?B?bXUrM1BBVWo4Nm4vSVJvOTdPS1JwejdLNDU0aU5RaTJjMnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXVSNFdGam1pM0ZlbnVoZXFQN3NTVThOMUk0c3BIWElodThXMWtoZCtMWGw3?=
 =?utf-8?B?ckdad0NKTnJsNlo4QkNaQW5weWQyZmM5emtzTE9vcC8reW41SGZyNExhT1lU?=
 =?utf-8?B?dG9sZndyT1FhUU8yZjNaZFBIeklXdmZNRDJjYzE3S3BKRUxNalNWVmFrYUcr?=
 =?utf-8?B?Q2Y4WlRLdlVDQlUvLzJlTU5SaTE4V3RWNkxSWlRxRFZRUEI1RC9wRDBjMGJk?=
 =?utf-8?B?M0ZSMGU5TjFzaS9sSGw0NWlYRzAvYi9WczRzanFmbEtQbDlCb2wvcXFXazBL?=
 =?utf-8?B?ZWRaSlBoOXNIWndRZjJMbk82UTZTRmpsTTgvTFR4aHRRTmF2QjcvR2xRWHR1?=
 =?utf-8?B?aWdYRlE4M2FDYW9JS2V5MCs1WTR3Nis2SlhWSzFETzI0UGdKN2RtNmFVckZn?=
 =?utf-8?B?Z1hlOEdtQ2lJbi9MWnE4YkZSYnY2RnFkMG1PZGFLeS82eXZXdk02U1gyZHZM?=
 =?utf-8?B?c1IzT3FmRUI5SjJDV252am5qWEwxbmxMRU1oajl3alhjU3hpNlc1TW1Nc05B?=
 =?utf-8?B?VjMybEVrTVV1Rmd4VGlmbFpNRFVRNS9iR1AyTDM0S1dISFJGZnFuakU3cWF5?=
 =?utf-8?B?K2tlWmtOMndqbE53WW9Xb2xPOFFvTzlGakFJdDl3RHNYVVVzcFZLRVFqRUg2?=
 =?utf-8?B?bEtxb1Bva0lyVmZGTTdqRkowYlpmdG1tdnNWNFlib3o3My9aVnc0NFBqSXdO?=
 =?utf-8?B?aEJDK2VnYitQSFJHaXA5SVBLajJoQkRaWTUxNGhNa0YrdTcvSjdGVkdITUdY?=
 =?utf-8?B?Zm5KVk0wblZWWTNrL2syRFgwVWFJd0V0VzVtMlUxZW02YVk4eUJ4QVd4Wng5?=
 =?utf-8?B?Lzg1VEZxbUtTMUV1K253RkRoQ21xZXUxMkUrZDJGQjU3SjMrcWtzK3J4dnJv?=
 =?utf-8?B?N25BaUF1WTV6RGFNdm90N3U1NThVZk9TYjk2ZjA0amQrUXgzYlN4MDVWTVZQ?=
 =?utf-8?B?aFhJZFk5ME9aWlI5bCtwNTZ2b1B2WG1mSjdaMmNWdUIwa1pTdW5nK0JtdTlD?=
 =?utf-8?B?cndQcE1VeVdmL2hqWExsdURUTHUrOFdrZE1ncTZnbXVkbFZ6NmtidkZKZXJJ?=
 =?utf-8?B?ZkMxWnVyQVFLN2NHUWJmQnJyNjAzU2JCb1A0YXJkYnV4SW0xNXFNNk8zWGpC?=
 =?utf-8?B?RkU5cFVhclQ4NUlHbnZoaVhWZndrQzhnY3FXZHFnRFMzc2RqMDE3UjQ3THNH?=
 =?utf-8?B?U1RzNEl1Qk94QmhaaU9hTGcxVThxVEQ4Z1Q1TDN1QmJmZ1JpNUR6enZpOHAx?=
 =?utf-8?B?L0dOdGtkY1RvSHhLU3JSR09vV1pjR0p0OGlJeUZtekR5Y3ZONmtGYTVlZ1BB?=
 =?utf-8?B?bExBa1pqN0d2ZTAxV2FORXRjNHd1OEhybS9FZzhsWG5Rd3hYOUZGOFMrQ3hj?=
 =?utf-8?B?SjVjU01ScDR6WGpPYmpBL0I2OHd2d2JuRDRJSnZ2a3JJMG9Sd2U4YVEwNzhT?=
 =?utf-8?B?S0tiT2pCemx5bzNMaWdabFdxbjREVndjTUFZbnBEQlVlL3cvb0RPY3I1MXBW?=
 =?utf-8?B?NFBsUUtMYURlRFk1Sm1PUGJoVExPTW9zM1orcjJNSVZYMWE3QzM0QzRGMnhF?=
 =?utf-8?B?OSthdTNWemoxYS9FWGZsbWZNS3FTclhRQnFGYUxBcEg0dHRodi9tRkZ1dDhC?=
 =?utf-8?B?N1JvNk10bk0vQlo1eXBVNmw0RjM0cWJiVTAyQjR4aGNkdUQyQ3BENTBxWXZp?=
 =?utf-8?B?MklhSXorakxiempaaHdHckJXWE1XQkVxb1pWQ3VnTnVPR29TdEV3cTEybkFB?=
 =?utf-8?B?eE9OTU5WbnovY0pKcUMrc3BWU2xDRVh3WXdQV2gvV3dhOW9vaFV2K0VIR0xm?=
 =?utf-8?B?MEZyd3lPR3VFdDJYK3RWVUhNd1hSQnFXSDFMZ2NBNjdYQ2VpOU5OSmFIUmRy?=
 =?utf-8?B?TTg0RE5nSGI2VHU0Tkh2eDZiVVBVMWhmUWt2ZUhmclFNdHQycnRJazA0d2x5?=
 =?utf-8?B?RXkyby9YUHZXKy9pcXlDTlI3TVNGWTEwNDRPMTkzKzVzYTMzQkw3bTQ3eVhG?=
 =?utf-8?B?SzVpTFA1bkl4ejVSU1kwSXNvK21OaG41bXM4dlQzNnlQNDhqV05reDNrOWVW?=
 =?utf-8?B?dC9mbVllcjNqWFRiWEVBbEg3Z0hldERGTGJDc2VKaUxOYWM4dnlpb0lob2FT?=
 =?utf-8?B?YXVwM1QvR3d0ZnBWYml0ZS9EYmlNaExsTU9XM1JLeEpJcENrSmdIVjRFdGhu?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c51b3b3d-f001-4945-f2da-08de11b0314f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 21:15:57.3915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcr88O/KeZ48UwmJCAQWNkIp/INqblWXnNcuwzY0Mj9A1ivzkvjII83Pb0vsqZux1tOy7EtPh8kAgdv31OM7kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
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

On Mon, Oct 20, 2025 at 09:45:28PM +0000, Stuart Summers wrote:
> When the driver is wedged during a hardware failure, there
> is a chance the queue kill coming from those events can
> race with either the scheduler teardown or the queue
> deregistration with GuC. Basically the following two
> scenarios can occur (from event trace):
> 
> Scheduler start missing:
>   xe_exec_queue_create

The queues should be initialized in a started state unless a GT reset or
VF migration is in progress. In both cases, upon successful completion,
all queues will be restarted.

I did spot a bug in GT resets — if those fail, we don’t properly restart
the queues. That should be fixed.

Also, I think xe_guc_declare_wedged is incorrect now that I’m looking at
it.

It probably should be:

void xe_guc_declare_wedged(struct xe_guc *guc)
{
        xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);

        xe_guc_ct_stop(&guc->ct);
        xe_guc_submit_wedge(guc);
	xe_guc_sanitize(guc);
}

>   xe_exec_queue_kill
>   xe_guc_exec_queue_kill
>   xe_exec_queue_destroy
> 
> GuC CT response missing:
>   xe_exec_queue_create
>   xe_exec_queue_register
>   xe_exec_queue_scheduling_enable
>   xe_exec_queue_scheduling_done
>   xe_exec_queue_kill
>   xe_guc_exec_queue_kill
>   xe_exec_queue_close
>   xe_exec_queue_destroy
>   xe_exec_queue_cleanup_entity
>   xe_exec_queue_scheduling_disable

The ref count should be zero here — xe_exec_queue_scheduling_disable is
called after this series [1]. I think we need to get this series in
before making changes to the GuC submission state machine. Technically,
all we need are the last three patches from that series, as they
simplify some things. I believe an upcoming Xe3 feature would also
benefit from getting these patches in too.

So that means in xe_guc_submit_wedge() the below if statement is going
to fail.

1006         mutex_lock(&guc->submission_state.lock);
1007         xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
1008                 if (xe_exec_queue_get_unless_zero(q))
1009                         set_exec_queue_wedged(q);
1010         mutex_unlock(&guc->submission_state.lock);

I think we need...

else if (exec_queue_register(q)) 
	__guc_exec_queue_destroy(guc, q);

We also need to cleanup suspend fences too as those could be lost under
the right race condition.

So prior to existing if statement, we also need:

if (q->guc->suspend_pending)
	suspend_fence_signal(q);

[1] https://patchwork.freedesktop.org/series/155315/

> 
> The above traces depend also on inclusion of [1].
> 
> In the first scenario, the queue is created, but killed
> prior to completing the message cleanup. In the second,
> we go through a full registration before killing. The
> CT communication happens in that last call to
> xe_exec_queue_scheduling_disable.
> 
> We expect to then get a call to xe_guc_exec_queue_destroy
> in both cases if the aforementioned scheduler/GuC CT communication
> had happened, which we are missing here, hence missing any
> LRC/BO cleanup in the exec queues in question.
> 
> Since this sequence seems specific to the wedge case
> as described above, add a targeted scheduler start
> and guc deregistration handler to the wedged_fini()
> routine.
> 
> Without this change, if we inject wedges in the above scenarios
> we can expect the following when the DRM memory tracking is
> enabled (see CONFIG_DRM_DEBUG_MM):
> [  129.600285] [drm:drm_mm_takedown] *ERROR* node [00647000 + 00008000]: inserted at
>                 drm_mm_insert_node_in_range+0x2ec/0x4b0
>                 __xe_ggtt_insert_bo_at+0x10f/0x360 [xe]
>                 __xe_bo_create_locked+0x184/0x520 [xe]
>                 xe_bo_create_pin_map_at_aligned+0x3b/0x180 [xe]
>                 xe_bo_create_pin_map+0x13/0x20 [xe]
>                 xe_lrc_create+0x139/0x18e0 [xe]
>                 xe_exec_queue_create+0x22f/0x3e0 [xe]
>                 xe_exec_queue_create_ioctl+0x4e9/0xbf0 [xe]
>                 drm_ioctl_kernel+0x9f/0xf0
>                 drm_ioctl+0x20f/0x440
>                 xe_drm_ioctl+0x121/0x150 [xe]
>                 __x64_sys_ioctl+0x8c/0xe0
>                 do_syscall_64+0x4c/0x1d0
>                 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  129.601966] [drm:drm_mm_takedown] *ERROR* node [0064f000 + 00008000]: inserted at
>                 drm_mm_insert_node_in_range+0x2ec/0x4b0
>                 __xe_ggtt_insert_bo_at+0x10f/0x360 [xe]
>                 __xe_bo_create_locked+0x184/0x520 [xe]
>                 xe_bo_create_pin_map_at_aligned+0x3b/0x180 [xe]
>                 xe_bo_create_pin_map+0x13/0x20 [xe]
>                 xe_lrc_create+0x139/0x18e0 [xe]
>                 xe_exec_queue_create+0x22f/0x3e0 [xe]
>                 xe_exec_queue_create_bind+0x7f/0xd0 [xe]
>                 xe_vm_create+0x4aa/0x8b0 [xe]
>                 xe_vm_create_ioctl+0x17b/0x420 [xe]
>                 drm_ioctl_kernel+0x9f/0xf0
>                 drm_ioctl+0x20f/0x440
>                 xe_drm_ioctl+0x121/0x150 [xe]
>                 __x64_sys_ioctl+0x8c/0xe0
>                 do_syscall_64+0x4c/0x1d0
>                 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> 
> [1] https://patchwork.freedesktop.org/patch/680852/?series=155352&rev=4
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 5ec1e4a83d68..a11ae4e70809 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -287,6 +287,8 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
>  }
>  
> +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q);
> +
>  static void guc_submit_wedged_fini(void *arg)
>  {
>  	struct xe_guc *guc = arg;
> @@ -299,6 +301,16 @@ static void guc_submit_wedged_fini(void *arg)
>  			mutex_unlock(&guc->submission_state.lock);
>  			xe_exec_queue_put(q);
>  			mutex_lock(&guc->submission_state.lock);

With everything above I don't think this new code below is needed.

But to make sure we know what we are doing, how about this from [2]
before the xe_exec_queue_put.

xe_gt_assert(..., !drm_sched_is_stopped(sched));

Wanna try out these suggestions? It is always possible I made a mistake
here.

Matt

[2] https://patchwork.freedesktop.org/patch/681606/?series=155315&rev=3

> +		} else {
> +			/*
> +			 * Make sure queues which were killed as part of a
> +			 * wedge are cleaned up properly. Clean up any
> +			 * dangling scheduler tasks and pending exec queue
> +			 * deregistration.
> +			 */
> +			xe_sched_submission_start(&q->guc->sched);
> +			if (exec_queue_pending_disable(q))
> +				__guc_exec_queue_destroy(guc, q);
>  		}
>  	}
>  	mutex_unlock(&guc->submission_state.lock);
> -- 
> 2.34.1
> 
