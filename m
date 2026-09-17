Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A47C88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 13:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904EA10E40A;
	Thu, 17 Sep 2026 13:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCow3/RK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1A510E40A
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789652498; x=1821188498;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eb83VJi6EwyR8juyuwUjsBlVfDShdlbS7MpJ6qg4VrA=;
 b=fCow3/RKnjV7XecwIfNCsazi6MiZWxLd3JhBPZPOjHr2M1BcSMD7Xuv5
 7hkN9qEIDvQyG3wZuGpWZivG7Pzc21SCMqznvGj1ART0A0tOJuNF1zHpM
 TQO1XJmtdR2OifdYe8wxY79y8WlRxPTX5jtjI7xhx++qLx375ZEkvDOzn
 hemsRRMcUuaAji/lpM6cb3jprHufhWv1n5rgx2Xxch67IHbsH6Eb9SK5S
 kr5B4qPngt3qA4/Rr6Ion0thVzfVXnQRoh8Cyzz0BKnrFbBJRFBhsDcqW
 J5eY5S8RXghnQGursAkN8Bb4pYJiBYK8bm0CEC50m2EXZjDeBY0uQSwG8 Q==;
X-CSE-ConnectionGUID: RACg0O64QICk0s7UtZk9/w==
X-CSE-MsgGUID: xMadREDFTmasORhKcJcN/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90092275"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90092275"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:41:37 -0700
X-CSE-ConnectionGUID: U0ET2hjMSz21ApS4JOl0tg==
X-CSE-MsgGUID: 2T558S6aQ3KLBNNE3a+8+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270112742"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:41:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 06:41:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 06:41:34 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 06:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtLeO2sfM0P/x4x9CU9sK1RmXh6hm50niHzgXCX/bS//8b0nU5Rqff/mI6uc07LMcSpqT2mZNcBGrHGG7Dr/e52TtN/OhJqEOFZoVlDngTXTLkVWldUDTP3PXWS3V/r2YwqCbXqHkARHvtn5hWum26xMtguvRgjsrdJQbAQ2DSayouE8YC5qECa8ZdcfYb3sMtcIM8JIxLq7wSCExOtHzUEof95WLEBKNkcKxLFDpcmjnGTpe9xv97N5lJfwQBcwq9MTf4LDTj3O4paKSEvxQl4vgr7g2NXf2FmUlGjn9Nn8DdY3/shmsFTbebBDtFa2/z4pEbOpKqZGcE1l0dLmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYQHTDmA6DLW6DGrnjeUvqkewQy/rpu631cHN0d9kXU=;
 b=U7G1TX8VOqIzWLoUqcD9RUmA0kvE3OzoBlupue9QABmPvMRdWZglw6oyq8lukWZqIKskuMu8SyvA0VVYHZN2p2AK8+CI+cx25BmaVgjUD7P6PoH578D1PJnCuiymcneZoTXzoWiPW+NHA1XLlsOWqMJIkAZtFhmK71+XYIDQjgSpTj8m5Y07bM0ogxyvRhMsEOEfL9f8sanFaclw7dMZkcRvNz+PaH6iFeqJSH8H53z+b7cgqnarPut8yGMtOnOtBk/9CAJF1FNwSa0+MzpzLG1g9HaVRu1CPxA5LyFXi5ol9pPb2Zs8+8CddxtXMGzFnn6OnxJEz+kyX8GR52b9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Thu, 17 Sep
 2026 13:41:17 +0000
Received: from MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86]) by MN6PR11MB8148.namprd11.prod.outlook.com
 ([fe80::76f9:6cc3:f4f3:6c86%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 13:41:09 +0000
Date: Thu, 17 Sep 2026 15:41:06 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/pf: Use KLV decode helpers to parse migration
 packet
Message-ID: <aqvt2UNUE9vuacvy@nostramo>
References: <20260916215827.13488-1-michal.wajdeczko@intel.com>
 <20260916215827.13488-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916215827.13488-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR06CA0206.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::27) To MN6PR11MB8148.namprd11.prod.outlook.com
 (2603:10b6:208:472::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8148:EE_|PH8PR11MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f346665-b53c-4757-06ae-08df14c154dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: +fRCtw/Jyt1V70qzER3+Pl/1Tc/bqATZp+kvvKadNPZ1G5U+/65TFv/PEpuuiAGsPocsqkLCNRRSvKZGsIpfRwpXfUA2fCD+jAd+2R3HhQF3tFBv8BqqU41Utghw7dEddLEAKGv3r7yBdrKGyES1LbGQmcIubgtUXk7Y9gtbb+zdVT3fbFXiTwngmN76tBkLjVRHB93W9FlyTjxtu+VeZAbBBs1/m6/XOSsAy0QSXS5ukbcxpPI/33WCKG+Lwv0RiPhswdVJwxDV3hHc100SB50WRbgsZDtFqE4ohTtPs6cIG5IGr7fZ+znhDxlr7f1qr2xmNY7wy7n6SIiUnGfH/oEKmZGccDEe8Q+r8hVJsKSsGq+ULo1wYbyZU15rv0sNHx09a0b4Zae+8mxDZdM/FnWpCJLzMaCnZpSVwj/5Ln6CtD10VfXjyXld07xciAY6sNvi2yTcGPEAfqHLf4mGTHzk/s32hjERJwbyrfe2DaiP/TJpU7wgqpD9YptL+e8GedZFGHI7WCkHDWl8W0qiPZVC0qk2GmdVqkP29ZyElpEcg1PblZhfhP50B8t2uHEJQpwBhsY0f/cHT5IQ+HvkuSLTs5Kff86cmkmg2NNp2oj2fkk2cWry+k3w9Z0laUtos/652ZwUANDl3qWAagh/KslbmeSrY+kR3mq+oK6r+Cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8148.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3VHb3hTcjlBeXNzVUZZNjJpenkweUExRFlLN3BaOElZQjlnbFJobk0rMTZ5?=
 =?utf-8?B?ZWg5amJHOVA0eVlObmJaTXRtZVA2QzJRMkVORTlXTmsyVnZBOWVJbWhQWVQx?=
 =?utf-8?B?V0xSenczYUlTcGwrUnZQY0hOYUp0LzluNWRvcElOS3owSWxCQzRBTUFSQ3Nl?=
 =?utf-8?B?eWRHLzJmU1dmUmlGNjVxa1hQSVNoWEFIZG1jc1V3VnZpbFgzNWNlaGh0UEpt?=
 =?utf-8?B?U0FkNDJ0RTlBcFJxT3ZHdGV5OUNvdmJoclpWcmp3UklPWERyMGxkVFgzM3Iz?=
 =?utf-8?B?QXJxejgwN1FaWmd4NG1CUDlHNk1vSkZMcHhlVlcwZkJMNW82cFFnWDBnVzZ3?=
 =?utf-8?B?RHRZdEVxMCtlSW1tQ2JRYW5VM21PTUM2Z1ZnTVBnTTEwWmlpT1JERitCSW9S?=
 =?utf-8?B?b1pjYUhvRFFMOVdDV0hreWFTcEgwYXcyRG1hdW1LTnBIYk8xdmovQXh1V3BW?=
 =?utf-8?B?MFF4akh6azl2a05BSThIdVRUbnhMdHhnczZnNnl4RTJuY0pWU2ozUUpyNXhY?=
 =?utf-8?B?aExuUThOMmsxWWdhUnVTVldCU2k0RStLK3JpRHpsRWprWjMxL0o0bW1tOHZZ?=
 =?utf-8?B?d3pySUNmV0RTcXlzNEsrL2ZyUDF3Q2NtK2RidmUwMEs3SUc2bWw1dlNnS1ZF?=
 =?utf-8?B?SlZVQU9pV1EvclJYakxHS1hwM1dRQjRBUTNhSlA1SVpqUDdIRGlqN2w1N01Z?=
 =?utf-8?B?UzVPWTdvSVRpWGZjaGlLbTR1czZ2NC92L2pkQzF0MEZRWG53Z0VhV3VJUFBN?=
 =?utf-8?B?QzczTjZnVkczUEVFVGM1VE5IT1RVaUpxeTd4aVUxWUdZSkVURUx3UXhDeTRV?=
 =?utf-8?B?RnZYaERqQjBhSDY3TVg3NjI3TGlFTlBEU21tQTZSYWREZFVNTGxLNk45aU51?=
 =?utf-8?B?ZzhGRzhveTdsNzRMbExEQTZoNVBFby84YzcvOG5VTWhnUUJwdWJjOVNDdkZI?=
 =?utf-8?B?Y1lnb1paS0hTUHlWUTFselFSUFovbTNSTXFwTGpjc1ozVGhKQXVDaDFMQlJt?=
 =?utf-8?B?OE5XU1crL2VUWkl0RUEvSlZmR2FCdGFUcUNkbDlkeGhvTDE5VlByN0ZMVDdC?=
 =?utf-8?B?bGFGU1FPanRianFLVDVnR00wNkl6VHRFeS91MzdxamlOVkcxUUZydVFqckFl?=
 =?utf-8?B?cFNEb29GWHhaY2hnUTRBZ3BRZEVUQ0V1dkJrMnpaRjMrSGx6M2JYS0N2K0tC?=
 =?utf-8?B?aFF4VHN1L1dST3FzcVBJVTI3alBVYWNkZTBQTDhFd08yNUNBbE9mTktqOWRQ?=
 =?utf-8?B?eERQUm9WVEltVGJmSjk5d0NGZk9PMHZFM2ZGSS9RUzZzU2JFK0dyRk1MS3Bt?=
 =?utf-8?B?dnVjL2x1Y2VqQVRHeHdSNGZHTmM1ckhuVlNmblIwV3I5Rjh6c0FNczNkcUJ2?=
 =?utf-8?B?TEhEOHQ0dDFyT0k1bGlKa25peTdkSGZUdkhtTDR3YU1QMGNKTEVpS3BJOU9N?=
 =?utf-8?B?T0cxaHNCOU1STi9GeXV6ODBnN0tlK0F6WFFUV0ZRZ05mYVBGa1Z1YUQzOWE4?=
 =?utf-8?B?UTdVNm1PeUNqRTRxQ3hMeXhOVG9OVm8wYXVlaWpVZ0crS1pQREVVTlc5aGNX?=
 =?utf-8?B?cXVEejVadVRTVTlOajJxcjBaM0FHMEtPSC8xamo3Mis5SmdKbWt0RU9ySndW?=
 =?utf-8?B?UjZkaVNlVUZkV0hZTTZYSFYvTVFFd2luaTcrREVKVVcwSnJFNzlmOC82SGow?=
 =?utf-8?B?bkJ5QWFHcG55bytZSGF1NVUvRHNuWGFRWTJtRDlZTmxINC9nVDhxcXBBZW1G?=
 =?utf-8?B?Ynd4VjhsUzZpajQ5bFo4QURHYzlHbFJHSCtqd3lDWGFvMEp1Sjg2NHlNZmFj?=
 =?utf-8?B?dG5qOE9yaW1MTDBRYjhtbmhXVDBsdW81eUR1S0F0WnM5NDA1OGRMdlB5VlZz?=
 =?utf-8?B?R0pSV29nc090amxpS0Fub2p1S3ZyRW9hSTBCME5tM0tpYzJpVUZpS2dwaytu?=
 =?utf-8?B?NDFpb1h1cWVlcG14ODlka0xGRjgwNThlZlJVZ1l1TGtoTSt4b1Y1ZG1Hcjkz?=
 =?utf-8?B?WDd5UzRBUHUwck4zZmZVWXhBaE9sWjRyVDdScWtkcmZESEdVVjNHcWxvOEZ2?=
 =?utf-8?B?NTJtY3dSTUlqUlVmRWUxNVVmUTBhWUdNYVBidjlQQ3Z4SnUxVEhVcWdyN0hQ?=
 =?utf-8?B?VGtQL0NxbEJadEhFc1NDWTUwaFFPbCtxVTFhKzNzQjRIV3NZcGdnRTFMbUhV?=
 =?utf-8?B?SUlwMVkzdnMydVBwU1FwQVVtNWRqUGdJUmxDNE02aTZYRGFZSDV2cUlTbUc4?=
 =?utf-8?B?T1pQWGhJZUpTWXJBMHdMRXBLUForTDhxQ0M0bGdlWituUWZPWmEwVTRUY05o?=
 =?utf-8?B?RzRhTU9uTlhwU0FWRXRZNmJDWW1kRnI2d05aSnFTcjFtb1B2elJOUjZRbUJ2?=
 =?utf-8?Q?frI27D2YfXe5WNAo=3D?=
X-Exchange-RoutingPolicyChecked: CYifCK49FAEC5teA7NYWqrg0T/htjR49kU7+vryMiM1qNAc25RNkBwtCRKb6HK+1lSoTlsONCoWwx58GzA0bGWGwfXg64HrOtwtbsXVyPAa7Jv7tqYAU0hDsZSHK4TPDdCuYqyxsL9cFah+8YRcZ1Pwej/thrbsAcdmb4iarBBjSDVfMBxWbvNIPM3/7luTHwd/3zi3kEyfaq/LtylzKm0lip64qdkD1KHf1BFYQAigTxawzEqFS9TlFEJeTYisTRkbWRGa2dMEikq1ThOCXv4A5CJf5eq/zzeLm/4QuCmYzu5XZZ/yEe1NheteCXOUZ/b1vJjCHi6O5zfOKrwS34w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f346665-b53c-4757-06ae-08df14c154dd
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8148.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 13:41:09.8669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWumCSRzCHt95i2O5ovB/2Jko0WRQ14QObmQ0Kh6ptkMZNvF5KijaZh/M8JjK6WAsFZBK+5mZ8TmruVVNhctqoHYTV+OMc9Qf3Hm8241ips=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
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

On Wed, Sep 16, 2026 at 11:58:27PM +0200, Michal Wajdeczko wrote:
> Start using recently added KLV helpers for parsing migration
> packet to properly detect any malformed KLV formats.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> ---
>  drivers/gpu/drm/xe/xe_sriov_packet.c | 31 ++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
