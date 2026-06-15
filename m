Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F714CD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 16:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A86710E566;
	Mon, 15 Jun 2026 16:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5Z17DE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92E210E4F4
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 16:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781542723; x=1813078723;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p4paMzuvKyzsESUIHLniQAAhn5zn5mge13y/Eiz66yA=;
 b=h5Z17DE0ZzzeXfk/w6sQUpo4x7ALMlj9rgk2ixC3vf2r/1GOHqYQVCk3
 Oq1Rg4JotOrOeqBoJA83anCyFQx5pltUYNYCpwNOcWRllmx00oe0OX21q
 Y1hIvzn/UiZFd4QRskI9bio0p/XJ+UigNgJg475RvLVFWquMvSpPpqhLf
 /V1sM0df5uIaGFwP1w3JHBycqUXsJ3cZACIpDJpIIn9yVjQGF8NfTJ6wm
 CsD8XJF4uOovd5PQynPO5FeiDrsS85uL9LU40c5OJJbrWi2EGHkxqM59T
 Se0H+D5dM6U3mf22Ky5ez3PvfW8XaP9Mfo7xTI8O2DmGWaIWfGc8IXrdL Q==;
X-CSE-ConnectionGUID: 6yyTSQYgSBumAMBedIK3aw==
X-CSE-MsgGUID: p4nHeZEGQx+KKrUU5dD+tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82354412"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82354412"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 09:58:43 -0700
X-CSE-ConnectionGUID: 3vttMstYTwOj7gGk258y0A==
X-CSE-MsgGUID: E6ktcmAmT7qSTFx6n0mpEA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 09:58:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 09:58:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 09:58:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 09:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tC2lPxIok8uyY3xu2+P72NpPz7lZW2hrpYPqVwg1fnpz5sWeetSkogVRuvXp2AttVVSao+YNIAUc3sc/ACrRLlZatjyeQ1/addW3iSt/13ZX3i6RVc+Fp7bP5c6rvMEDO2AmHFfcySZtpxlEBXQ7olyfEKmPhyso6ujnKwease4Cj0d3ZZnxl1P6O5mk5y9UCFcPKEwrrRihsS61jXTHwUePBRXVn332ll5zXQ9JhL+Bjrj0zNlczX77nEU+l8/Q+OradXLz0BtLOo3dx4Z/U5GK0TXwPcj2FWY18LP7KtmiJpj0xoyzvvjcP7BgUdAEly4HjUGEyL/vqBiHLnsAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dltm2F0L3KeFAhP7FVvSv4fDF63HFHBEQ4S06iGhA8=;
 b=QnaqAUEg4yxYYybgEEVgjKTNHsniSWHw68dcS/oRt5Q8b1o/9Rvpo7u8grc59yf13J3HQad5MrvjNMFB12nS8tt2VBZIK49RcIA3aC+tDdRjySeRVwUp1iWHzn378ev1UvTSQnP3muqiSI3vp9HKBlYdhGqRMsULPDTlDPklkQ6iD2bEluWk0ko6PO+tF+zJvbrnUziS8uDF+NTtZHgXJCUZ5ZE6b/NQ/wVPlHkPswVfr9OeTkMUGAQqOpkFmX+3NKCTsaov8WiVHErNN/Dg47GSbFXXNPoHUFShYCVlDvIdPUWLDWhYKYRIsvidhviZ45ko9cyBuDE9kO5+8A0V3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 16:58:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 16:58:38 +0000
Date: Mon, 15 Jun 2026 09:58:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Message-ID: <ajAvOyMi/j7cQcnj@gsse-cloud1.jf.intel.com>
References: <20260613013859.3886196-1-matthew.brost@intel.com>
 <SN6PR11MB2717BFED11DC3E42E4450A00E5E62@SN6PR11MB2717.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SN6PR11MB2717BFED11DC3E42E4450A00E5E62@SN6PR11MB2717.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0349.namprd04.prod.outlook.com
 (2603:10b6:303:8a::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: fd72a448-986a-4050-250d-08decaff584b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ef396cj95KtWxc2fJ7xJVnldRBxhMj8LW6xuL7LVqGbDGFkCd7TzZ8RV/RWAuzc4cWzDs+KmWqU+iMT3V0/8yat2jkaig0GPCZ8FC7pqcqYV5J4MB51KzQ7U0JbCM9b2WXCpd+0Vi+vHl1ylN8na9aqlBiSrb7T2MIlL7pm/YANSJy/8juPmu2mHrSvsQ1Xz/8T5bi7uXV7HGFVIO4Te8h8iRJpw4KfEZPYojfD91vO4YZTRZrp0gjCidylO60RjjGBdiy5mbxlpKW5uqFc9/RYWYp3nVl5XZXK/QsXKZLYLWs5VAoIDAtlVHHgoJ79oIwaPLvt6n/x0vRpMDpEJ12DxH+JFrkp+0ueI++8BdJjsrmX4Pw3s4Q9PFEkP3VrLL5yZdG7+2pyEOXDvIUl2T/vMizBvEOpryLAIO9rsWzWS57IJqQNRjF79IrWdxIQW5TsSfv2toHL44YKSRo352ejzeOsQuPV1cCZsBjuULYTnEvh9OczWWdrOa81pCCcP0+Ccg+USsaDegCxgFE/yf001ugnuWrgMy7hb2aQmQgOYWz3sx3fTr9vrZGEfl2fPt9VYWZF6MlXu4x3Vwx/WZApVGntHmTQee31x6+SpwATh1li7gNNacZHMDR+rvHO7D6NHMpwbTVNrIYyvjPQr6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTJEQWV2Snk1amg2bm9YTFdlR2RJVzRlQUh5Z3RLenN0aC9Kc3FaOS9sZVNt?=
 =?utf-8?B?NVJqS2RPS2VQT2d5WTZIM05ONW40a1h4c2ZvR2JmRHJRdDk5b2R6RTE1RjB0?=
 =?utf-8?B?YkdLeE5xS1dwUVhUMHZPdXBZRFJqbkV5c2tQWUhacUtyRTBJTVNmREE0c1Ar?=
 =?utf-8?B?amRkZmVSQ29qUW96ekV2NWxNdEttTkxXRUlKYXZ6MzY2WlE5OHFYY3VoWEx5?=
 =?utf-8?B?WGYvUWZPZk5CR2VzeS92RHZxSzBSa29maUhMZ2lyTlpSaDJJQVFNc2FvZTRx?=
 =?utf-8?B?dG5pSkxxNTZzRXU1OXlJbkdsVHc0Wmp1Vk8xaXV2MkZtZVdOTC9ybWNDRFZt?=
 =?utf-8?B?QUM4VDQwR1haY2Nwa1Vna1Y0aGF6a1lYbXNiU2hFYWhiR2RxZXc2RXVpelI3?=
 =?utf-8?B?MXNLNU82R1NzOGVDV3lZOG5zZGFwSm9GWERWU29QNnhvRjdYTTF2OGRyTWJR?=
 =?utf-8?B?dU9iTndtRzhsL1ZVWmhKUUMxeGttanVsclBhVk1ab01wM0tWeUZKcFR0VVNM?=
 =?utf-8?B?ZW9pbHV2TVhqOHRhZ1JWWk1JL3h5RUZCY0lmZXpuZnZ6Y1drRFFveFhGOUt5?=
 =?utf-8?B?b3FLZGVCMEE2L3Fvc0lPbDl6QUd1NXBlbmRGbjJNLzE2ZEhVelI5bmZacEVy?=
 =?utf-8?B?NUc1VTF5aThVZCs0dnZielJBd2d3dW1Oamx0QlNtYlNRcU05N0dFUXVyalNK?=
 =?utf-8?B?dTdlbFRDaGczem1RYU1mNWlNNEwySi9XMlFUSUJWdzBoRlIybytwZUljemlt?=
 =?utf-8?B?dTdWOHBnTmRGa29WVmhMZlNxL2UraWppYmpiWlQ1L1JkaThHelZsRHpKVWl0?=
 =?utf-8?B?ZUljRDFpblpRL3cwMCtYOXAzQXZIdVFMYTVhdkhsV21wbFdhRExOeTBiNDJt?=
 =?utf-8?B?RWlHNEdhUTVnZ0w5VTdZUGM0dmF4U1N5NW5kWTRPcEJIQnFzaGZTQkV0OVpr?=
 =?utf-8?B?Q3dqMTFCeW81TkhrNlhHSmFrSzJZY2pxbGFOMmxUWjdzYWxIRlNWVW5XTitk?=
 =?utf-8?B?UDhUNm14OXJ1QTRTTGdzMGNqLzcySytZVEtna2NjTXgvTnBSbjFxTHBzS2RC?=
 =?utf-8?B?ZEs4QVhTaVhBUjcxbmtEQ0k1Y3cwZmxVSEZtVi9CRXNZY1QraU9Ccytyd3R0?=
 =?utf-8?B?MVBQVVFpTUVhdTFWc2NjVFk2TlVuMWl3M1p0MzhVZjdNcnRSNEdISVd5dmpO?=
 =?utf-8?B?RlNHekxaMS82UU1zaVlMMzJZYXZydHVjUk9OMTNKZVQzT2t3RXozSUlsU012?=
 =?utf-8?B?bUZ6a0Y0N1ZNUE1KeHlkbzd6cDZXdWI0RjBpbHIwS3hlM1p3azRWaHJxRDFz?=
 =?utf-8?B?eG1ieUNjZVBqRXd0VTA2c0tSRFU1dWdqSnM3V0o0N0lXSmcxY0RXYjF1ZnFl?=
 =?utf-8?B?ODZtTXZhZlJaMGs4YkZVUXhRNEwvT3NPOHErU0xGVlFoTmJlSlowTEtVYm5W?=
 =?utf-8?B?ZE9SOWhUdHRIbkFRVWhLb2ttcDhtNmlMUytoTEFhZEN3Syt5UEcydkZsYU0x?=
 =?utf-8?B?RFNGYmVYNTNJOXk0c3lwcHREbFYwVUk1cC91K0trOUJGd0dFRGV0eXQ4WEZw?=
 =?utf-8?B?ajdKU25aTGVkeDVHY29rOS92TlI0cllrK3llTm9BNlRKMTlZaE5WVlJJaTN5?=
 =?utf-8?B?VTlWZFNnbEFFSjVQRzdTVUJ6NVdLMyt2YU95bTJ3NmxTVWJhY3g4ZXk1RGIr?=
 =?utf-8?B?cUx5MEZkYzhEd1dFK0RLTitaamM1Wk43MDZZMm1TZ0VnZXFTd3VscmZpTm5l?=
 =?utf-8?B?RjN1S0dqdVN2UE52TkZNMkFpby81cXV6bDk2SFdteUZNWVlrQ0g3QTBPTjQ2?=
 =?utf-8?B?cUdCSEJCam85azFDanZsaE90T0VtUDd6djRTOURPUEZvd1Q4Zk1aUTkyamZt?=
 =?utf-8?B?Tnk4Y3Uyd3hNV013MVVFSE1DQTNVaVNCM3I2T3FiaFpaWGRpdG91L0tZZ0J5?=
 =?utf-8?B?alJGQVZVSXFEc2pJeUI0YnRtdmFTNEpKUk5NMi9FVnVSdk5UV3JXYStQQkU5?=
 =?utf-8?B?K25sWURoWHUzTWI2K0xxWDJ6aVFmY0k1T1l0YUFraDZmVTJRTllMaEQ4UElP?=
 =?utf-8?B?V21MaitXL1Nqbi9oS3NobkV1bnJWL0gyUWtBaXJlS0UxdnIzakdCODgyYzdu?=
 =?utf-8?B?U012cU9VQUhDdERSSEhXQnRvL2diU3gyYlhqOWVOV3hFZVJEYTdQVlNVTkJr?=
 =?utf-8?B?SFA2N3g2VjIvTU1JS2R0UzVmNktCcktFQ01YaGZ4UHZiUHVZSUZCYXYrVzlG?=
 =?utf-8?B?cC9QaHZEOXBicUZ5VEpKaldhL1hpWHB5cmcxbU1TVzNaUnNjSHBDcXVwdUdn?=
 =?utf-8?B?TWhnaVhXZzB4NlQ0TWlYdkpGOXluSUIwa1RmRVY0VGVvcUNYT0xEUT09?=
X-Exchange-RoutingPolicyChecked: GDGDNB870xyH01Bhk/7Ljm7z0Ruf6UevhVFjXjl0lbBLxZXS7mfezJCRlSi2azE6VeI97pAmUVYL0RWm7ChDYJMRxBJJwVS+HbjhpuiTmUmPtU6NRzkfRtKZW7rKcHDUC16hCgni6Bt6J2tZ1RjJTi/eHteI5Ar8mknDCl34P+dYLe/+hu5isA7bMY77h39VjRk2UJdhWxHIvoJSFzZGg9fQwsM+NbnK1fWk+9zYId4XJmmMKyXPRsEfQ1GYPMXEhKHpq7NUEV4mI56djhgtGmhYagpEMb0bSNIOFHnINcv1Lu8IQCT0al7ZqOdLaM9BvfJxbQqZPBa097bEnpy/Ow==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd72a448-986a-4050-250d-08decaff584b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 16:58:38.1420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alZvq6dTuHswsMlzmlJcpTcpbXDGe++zvG59eIPXj/sUVFbNS5SpuqSzW/JNRC11xXXtP1Hhq1Ciaku7A4Tccg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
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

On Mon, Jun 15, 2026 at 10:17:54AM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Friday, June 12, 2026 6:39 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
> > 
> > When an FD is closed with many exec queues, teardown relies on the TDR
> > path to clean up scheduling. However, the TDR handling is serialized
> > (i.e., only one exec queue is processed at a time), which can make it
> > too slow compared to GuC scheduling activity.
> > 
> > In this window, GuC may continue to schedule contexts backed by
> > invalid page tables, leading to a cascade of CAT errors and repeated
> > engine resets. This significantly increases recovery time and can
> > degrade system stability.
> > 
> > To mitigate this, eagerly disable scheduling by sending a self-message
> > outside of the TDR path. This prevents further scheduling of invalid
> > contexts and avoids the CAT error/reset cascade.
> > 
> > This change improves robustness and reduces recovery latency in
> > multiple queue teardown scenarios.
> > 
> > Cc: Wang Xin <x.wang@intel.com>
> > Cc: Jia Yao <jia.yao@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Tested-by: Jia Yao <jia.yao@intel.com>
> > 
> > ---
> > v3:
> >  - Make kill message static tomake reclaim safe (CI)
> >  - Do not issue kill messages for queue which bypass cleanup messages
> >    (sashiko)
> > v4:
> >  - Add missing message lock
> > ---
> >  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c           | 44 ++++++++++++++++++--
> >  2 files changed, 42 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > index e5e53b421f29..247947fd357f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -31,7 +31,7 @@ struct xe_guc_exec_queue {
> >  	 * a message needs to sent through the GPU scheduler but memory
> >  	 * allocations are not allowed.
> >  	 */
> > -#define MAX_STATIC_MSG_TYPE	3
> > +#define MAX_STATIC_MSG_TYPE	4
> >  	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> >  	/** @destroy_async: do final destroy async from this worker */
> >  	struct work_struct destroy_async;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index afe5d99cdd8b..5ec1dca0324c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1875,11 +1875,21 @@ static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
> >  	kfree(msg);
> >  }
> >  
> > +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg *msg)
> > +{
> > +	struct xe_exec_queue *q = msg->private_data;
> > +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > +
> > +	if (exec_queue_enabled(primary))
> > +		disable_scheduling(primary, true);
> > +}
> > +
> >  #define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> >  #define SET_SCHED_PROPS			2
> >  #define SUSPEND				3
> >  #define RESUME				4
> >  #define SET_MULTI_QUEUE_PRIORITY	5
> > +#define KILL				6
> >  #define OPCODE_MASK	0xf
> >  #define MSG_LOCKED	BIT(8)
> >  #define MSG_HEAD	BIT(9)
> > @@ -1906,6 +1916,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> >  	case SET_MULTI_QUEUE_PRIORITY:
> >  		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> >  		break;
> > +	case KILL:
> > +		__guc_exec_queue_process_msg_kill(msg);
> > +		break;
> >  	default:
> >  		XE_WARN_ON("Unknown message type");
> >  	}
> > @@ -2018,11 +2031,39 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> >  	return err;
> >  }
> >  
> > +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> > +				       struct xe_sched_msg *msg,
> > +				       u32 opcode);
> > +
> > +#define STATIC_MSG_CLEANUP	0
> > +#define STATIC_MSG_SUSPEND	1
> > +#define STATIC_MSG_RESUME	2
> > +#define STATIC_MSG_KILL		3
> >  static void guc_exec_queue_kill(struct xe_exec_queue *q)
> >  {
> > +	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
> > +
> >  	trace_xe_exec_queue_kill(q);
> >  	set_exec_queue_killed(q);
> >  	__suspend_fence_signal(q);
> > +
> > +	/*
> > +	 * We eagerly send a message to ourselves to disable scheduling, as the
> > +	 * TDR is serialized (i.e., only one exec queue is processed at a time).
> > +	 * If an FD is closed with many exec queues, the TDR can be slower than
> > +	 * the GuC scheduling contexts with invalid page tables, creating a
> > +	 * cascade of CAT errors and engine resets, which is quite slow. Avoid
> > +	 * this by immediately disabling scheduling outside of the TDR.
> > +	 */
> > +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
> > +	    kref_read(&q->refcount) && !exec_queue_wedged(q)) {
> > +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +
> > +		xe_sched_msg_lock(sched);
> > +		guc_exec_queue_try_add_msg(q, msg, KILL);
> > +		xe_sched_msg_unlock(sched);
> 
> If the issue is that there's a race between TDR and GuC, and the solution
> is to 'immediately' disable scheduling outside of the TDR, then why aren't
> we issuing the call to disable_scheduling here directly?  Adding the request

The only place it is safe manipulate queue state is from scheduler work
item.

It’s rather convoluted why this is true, but the TL;DR is that all
modifiers of &q->guc->state are lockless. The scheduled work item is
what makes this possible. The work items are ordered (i.e., another
message or submit cannot be running), which ensures safety.
Additionally, TDR/global events stop the work item before it manipulates
the queue state, and TDR/global events themselves are scheduled as a
different ordered work item (i.e., only one of these can be running at a
time). Thus, we achieve complete mutual exclusion of queue state without
locks.

The reason I chose this design over using a lock is that, in i915, we
have locks, and it was a huge mess—we never got it right. It becomes
nearly impossible to make locking work if IRQ contexts enter the GuC
backend. At the moment, we don’t have IRQ contexts entering the GuC
backend, but at least one proposed series will introduce this. The odds
of that landing seem high, and I didn’t want a design that would fall
apart if IRQ contexts became necessary.

I wrote all of this down at one point [1].

[1] https://patchwork.freedesktop.org/series/153000/

> to the GuC scheduler still leaves us at the whims of the GuC scheduler, and

We add a message to the DRM scheduler which sends a H2G to the GuC.

> if it decides to schedule contexts with invalid page tables before the disable
> scheduling message, then we'll still hit the CAT error cascade here.
> 

Yes, this can still race between DRM scheduler message and blowing away
the page tables and hardware taking a page fault.

> I decided to test this modification and saw some positive results: After 50
> iterations of the reproducing test, there were no CAT errors.  By comparison,

You broke the GuC backend state machine by doing this. Eventually this
would explode.

> this patch as it is had a roughly 5% CAT error rate, which is significantly better
> than the current state of things but still has room for improvement.  Granted,
> the reproduction rate is low enough with this patch as it is that the reduction
> in repro rate may have been up to chance, but I think the experiment
> suggests the primary exec queue should have scheduling disabled directly.
> 

What we could do is wait in xe_exec_queue_kill for the message to drain
and for the disable to be received, but this might be dangerous at
certain call sites of xe_exec_queue_kill, or would at least limit where
xe_exec_queue_kill can be safely used. Another concern is that, if we
close an FD with many queues, this operation could become slow, as we
would serialize on the DRM scheduler message and the GuC response.

We also have to consider VF migration occurring while we wait, or a GT
reset happening where the GuC message is lost. So for now, I think we
should go with this patch, which makes things better but is not perfect
with respect to potential CAT errors. 

Matt

> -Jonathan Cavitt
> 
> > +	}
> > +
> >  	xe_guc_exec_queue_trigger_cleanup(q);
> >  }
> >  
> > @@ -2066,9 +2107,6 @@ static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> >  	return true;
> >  }
> >  
> > -#define STATIC_MSG_CLEANUP	0
> > -#define STATIC_MSG_SUSPEND	1
> > -#define STATIC_MSG_RESUME	2
> >  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
> >  {
> >  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> > -- 
> > 2.34.1
> > 
> > 
