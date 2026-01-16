Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E226D4A60E
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 08:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFEF10E82D;
	Fri, 16 Jan 2026 08:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFMY2hh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B668710E826
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768550848; x=1800086848;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ckOkFLhgcg8cDLBFVlY58rC5rsFJhHCenK0qMdD7ug0=;
 b=iFMY2hh1C5eSX1suNwWbD39xiu6pti45HWD13XS1t51kQZBOuZOEO9Oo
 SF9mPEuwT9yiDTF2KWTB+lI2ll3eU+KGJFwUJSUSeqsyuSvhvvpdK76Fh
 EERZrSzCL2xYxILZOxg1faJC3RV8eVR3wiDMaRpDx90Do/Jn7It9oGnSq
 /SuKbTIfZOVZ47Qua1YNZGpsy+AyOj1iRrJuNq9WYF2ndlUi0tO5LzKqj
 mU2oFUb9j4BcgjTEHfsT3A0v4+xWmVsbaUNRyKOoCxEwCC8dDQs88xzNF
 ap4yVppSlwGBXUXscOWNMMPKj5L8EWBkWfo2cZfErgKGAjxuMxp++tF8V w==;
X-CSE-ConnectionGUID: h+wSR1f/T5+bv/FOCVuHeQ==
X-CSE-MsgGUID: sUDNQPluS/6R4DWHg1bdDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69918361"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="69918361"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 00:07:28 -0800
X-CSE-ConnectionGUID: lg9e422xQM67jBwfM9FihA==
X-CSE-MsgGUID: YRRKHkjQQwapTonj09TMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="209665529"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 00:07:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 00:07:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 00:07:26 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 00:07:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGg0F4LANiS/I7B019fRSCmDM0LSx/N/FQeWBM/k7b33hEhk7x9SYvAtZfGGiklrb+f3/fXk1FDYh/wvKbi1UTC0ISoGOR/uMmX64klNsd15k22eWOW4WGhP7gwlakBVZFh7KgKWG2+lswzowhbOXGpS2Yih+X6mu8QZw9gywG7ZhJnx0nCwkmB/v8UhlxJjZr4ddr0rQg08yUNSBWKw8J7NYfcoZNcO/488ryoWX/Kc2+GShm+/FfrHsYFvWauxRwKHceJkayiO+Iepr0EhbaJl2HzzB7r+FlXaFkVvt1l4omIA2Ulu5Xty67fWSNHJiQ/FwKqKpwSXIDhKW3Laeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1Fw3vr5aCzMUIJDj7zEg42R0yCvlDQXln9gLyJ9PGo=;
 b=fMCxV40Gkckv3jf/sqUky0SWWyMDz4yCV9DrsYj/xP7nF7Tl8pSAZyQVFSF75VfFkWDJFgRQhnWOBKAQvB/zjnSDKrtHYqTcvDheROL3f0BDjbKMnP5YcHml1kltJ42VO1IseMtf+FS8iCwXCVMIW6DqQintJPnM+U0HtuyFUaLndpgnLeLGK3dDqnoOYuqS6j9fhefqoQbMTpdp26Pugs3nhNC0QUI0QSoDuCmAs/yczNLjCQq6ZsxCMVXr3Fl3V5Yj/8w+Re3MeQg0y5WkCVcd7sSc74u0//4Un+zvQpL4RyA4is8bGHvClfs5CtoO1l1AnFAVfkCKGHYbn0sVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB7285.namprd11.prod.outlook.com (2603:10b6:8:13d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 08:07:22 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 08:07:22 +0000
Date: Fri, 16 Jan 2026 13:37:16 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2hpg: Performance tuning changes
Message-ID: <aWnxtIjVvZObm1XE@bvivekan-mob1>
References: <20260109164250.237044-2-balasubramani.vivekanandan@intel.com>
 <20260113153426.GE458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260113153426.GE458797@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MA5P287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::14) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 590a65b4-bde1-4c5d-9a6c-08de54d646ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bG90MnZXVGRJSE1uRnEwUVJ4T3ptTjlBdHJYaStjNWxJWkc2MW5QY2ZBTmhu?=
 =?utf-8?B?N05kU1NmS1g3WlNMQmJoaENPMHU2bzBUTkpDekpKU1NEOWpUdXlDejMxSmpR?=
 =?utf-8?B?VWpHYTNCaU12a2NrL2NZOStvdTdRbENJWmdjMmRDTnUvaTNrdWM2b0tkcTJn?=
 =?utf-8?B?WTRzSUpENnpGY0lTbUVaV2Zmd3p1Y1U5ZGNXUHpPWVBzZmR4bWcyaWlGQ000?=
 =?utf-8?B?ZjViZ1hvNGkzTCtmMkNXeGdGTzVoOU9IU2tvSFZpRzBaQ1cvendPdzNVN1pF?=
 =?utf-8?B?dWtsOUM0TFhqUUZJVmxyNCtGOWNLc3lKaVpsNHlkc1F4eDAydlo5cFpPL2xY?=
 =?utf-8?B?bkl4MVlPdlRsV2RUanlma09sR3crZUtjYWdIZnVnUnpXVmNHckIva04wcWRH?=
 =?utf-8?B?WHpFV0pxdGFxSlhDV3d1NUxTQUJsbmRLRW54c0RwRS9QMFU0a2wzL3FXK0JJ?=
 =?utf-8?B?bDZJWDVGYy9jaHl6V2JuUW5vb2svZlhHdGlGTGV6VytKa3p3ejdMSGc2S1dL?=
 =?utf-8?B?eFlMaEw1U0g0TWZLeitwelM5SUhDb0lIdmE3OHROZG1LVml0a2xmSXY1a2xl?=
 =?utf-8?B?b2p3ejZiN0hQRlU5aGdCSTc3MXhMTmVkdHRJaWR0bGJ5ZURiYXE3R1FnamhX?=
 =?utf-8?B?Y0VBV01nNGg4SysxZVJ2UTByakVmMXloUVFzTGxZQVN2UWd3OVdOUnVyQTdw?=
 =?utf-8?B?VEtlTkpScmZCRnZhTGlQSHdyaFVKeXlEZmlNWFRrRlhvVzR3WGtReWFnV2tM?=
 =?utf-8?B?c1hMVjk1N3ZYNk5EOVJTQlllRzgyaUxLZUMyOWxtZUNjd1lySWgwZ2dDb3Ju?=
 =?utf-8?B?aUhGd2orVzcxY3laUHBiV3VKN0ZjRnRReVowcVV3SlhYd0x0Y0lVQmduOUJ5?=
 =?utf-8?B?L2lTeE5JdExickk5bENoVlBHMXNnVjcwU0szcjVDQ0k1MHlGcFQyRDhXN0p1?=
 =?utf-8?B?RVRRWjNkTEN3MUl3VnY1akxzcUphMFN0TEZ5bmt6UnlrNXo0YjRKVkpkcUNO?=
 =?utf-8?B?eTYwaHdPWGNZaTZzSTRnZ2NaenVaRU5SRXNXRW5MNGQ5S25oaEcxM0VHS3Bz?=
 =?utf-8?B?MXV3WDRmeXNvZURKUkFZZWcrVGtRQ2szTEZuVEVmNUtvWkV0cEJTVW5WOVNJ?=
 =?utf-8?B?dUhnL044WUgzdWVPV2J3QUdKbDVwOGYwVE14ZU5GdGhadjd2L3h2TGlvcGw2?=
 =?utf-8?B?TlZRTGwvbmM1R29EWWdLQ3VlSmprVXhBby8zalF2LzBWcXFhZzhRalJlZzhS?=
 =?utf-8?B?MXJZVnJuNHM2SEtGUDB4Ym94RGNxN2lETStyM1FnOEJYaDRvdkhiYVUySkNp?=
 =?utf-8?B?NzhScGVIYVNnS0R6WXlNMFNmYmdQY1NxaVVoY1p4QXVaUWpETHY1NE04T1VW?=
 =?utf-8?B?ekFEUVp1TytTRi9JcWI0alRnQ01NdENTd28ySE8xT2JNaVBReVdCbGtDWm1y?=
 =?utf-8?B?WU9PbVhaSWhLRkUrYVBQNkw0QTFHZXcxVDl2SENXQjNtRUE2ZjlGcDdwaFFx?=
 =?utf-8?B?SlVYSW1BV3NFN050SEhlNjQ1c0RVWUhOcVprYkFzTW44WmNNRTJFdTRleGE5?=
 =?utf-8?B?eVVFSkc1L2FOMFpIMXl3V2YvRTJVSkNEcTZabXNVNEJUcklmNmRXR1o1OFhB?=
 =?utf-8?B?RWNsZlRKNHhEOXFQajFrYy93aUltOGVQVnpvY3dTRTJoRkhTOXBCeTlzL1Ns?=
 =?utf-8?B?UmUrMkJaRGJUS3huMVRtMnlZUU91V0V2SG13Y0VtQndmWGhwVjNzenp4bUl0?=
 =?utf-8?B?Vzc5T05zbnlTZldUam90eWFuSEM2VHM1R29SYlAvUUFnL0ZrQ1NINzhGek53?=
 =?utf-8?B?UjZnalNVUDRJOWJjQUtnTkRydW5FbjliSHNGWk5rcW0xbER0M2Y5M0FvQjZl?=
 =?utf-8?B?ajhlWWdCVW5pRGVDY0w4WGEzSnFGUVEwQ3RGL3hZakpELzA2anBSd3pHQnh4?=
 =?utf-8?B?SzN3czFlVzNrSlU0NldqRTcrTCtnSGovK0hDVzlocWxRaXBGZVNNWm9YRTgw?=
 =?utf-8?B?SlprQ3kzYVRXamVnU09kRC9KMHFjOHQ0czJCMHExR0tpSFhoWkJhUlBjZE1K?=
 =?utf-8?B?QzBnWGo4MWpIZFZPR085TGljVFIzcksxSFFsdWhaeHFlWDlDZlhjQTRTVlNp?=
 =?utf-8?Q?xyGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEdYeWV2WGFFYzBIUnNlSUVUM2xNam1rN0dTM0FvUXFGdmV5OWZ3dWxsS0Rp?=
 =?utf-8?B?WFZPRG13Rnl5MU1uNXdodXBmMktPTlpqeHM5ZFEyZnJucVlXdlFPVEdoMFFX?=
 =?utf-8?B?dUZFWW4xQlY1a3JNemZKSEtseHRRSG5rYStLdVNZSm1NY0ZqZ3daR09YeXcx?=
 =?utf-8?B?cjVneXFzQ2JSbm1EMDdLb0xzTllKMGNUVDZoZ3V2QjJRNDVERFo4Zk5sOENK?=
 =?utf-8?B?SUFJWFd6Y0p3amtuV1d2TWRHNzh5VVorWDl5WHBDaU94OE9XWDhEbGhtUThH?=
 =?utf-8?B?dk1OOUhnWCs0OWtKbVBBVHlNdVJZM3pkVklsMFJkWDl5L1liWG1hckJ4eGNp?=
 =?utf-8?B?blpyNXZNT0puRUN5QWs4U3dLVUFRdjRLeHdzck9RTlB6WTN1eHcrM1hYd3lT?=
 =?utf-8?B?QWk0R1A5K0F5MHEvcTEyVDZlSU50ekYySW56d21DVDkwc1Vob0dBUnRPc0Nk?=
 =?utf-8?B?eHl2YmRLVW16WjY1dXI3RzBqSlhnbjMxNzNhWGZZa0tOcE16OTZXd2s5bEJt?=
 =?utf-8?B?VWJRbnJ3ZWhBYVo1U3R1OGtZSmQvbllRdUVHMm5JSlh5c0hJU1g0RnoxT2xU?=
 =?utf-8?B?anBLUHpncFVyZVovSUlteE0rcVh5WFAyRVhEdXVDTFVJV282M1J0SWM2Q2xz?=
 =?utf-8?B?Q2lQVkdpMkwzbmR4bDJPak93RHAyZE9pN2hMenlNQ2RQRlZjV015WFRIU3FZ?=
 =?utf-8?B?NkRaNHROVTZueWcveU8rQ0FxNWU1bThabGdUbGJTczRtNDh3Nys1NzJWOWhn?=
 =?utf-8?B?a3VPTFNpOC9zUE1QTHpTd3VHTUk2eDl6UFEwSmxmMFg1N1pGU2RZRzBSNGRH?=
 =?utf-8?B?VE9jdXk3eTJTdGFFWUhvNS9jci9hSTdIdFhrcXQ4WThITVhTS2ZMNjh1ZHZ5?=
 =?utf-8?B?QVQ0NDN0cGlNc2NNTVFkRFZocEprL0ViaktSL29kVmcrR1VJUHEyMTUvd28v?=
 =?utf-8?B?aDNxS2xiVmJPclo5bUxNcXhoQkh5WlNMdzVVS3QzaVdvSmhrOTFJaEh5L21J?=
 =?utf-8?B?OWY3eFlwZUtUdkl3bzN3bzFpYU1DbDRuZlVaUTAwOW1TVUhrY2VrUXZrWjNr?=
 =?utf-8?B?UHFENTlUcGNWN0JmUGY1LzVzM3VjZjZLMnR3ZTJRakk5THZSSlh1T2JmeXls?=
 =?utf-8?B?eitCcDJDdTlUdHNkbjMzZ242VnZaRHFmSW5jOFhKM0hXengvRnY0V2NMQjht?=
 =?utf-8?B?QWhMWG1GOXdvRWs1WWlocUg2NjRGdlB4LzhHc3FpM3U5cTNHbGNYZXdrOEZ4?=
 =?utf-8?B?YlVleDRObnpUNjZ1SDNvMG9Rc21pSGhnM2cyUkJFckxmVm1nR2drdkFmdmJN?=
 =?utf-8?B?Q1A3UTRzQnVJTStuRG85Tnh1ZStmUDdYRys3VkRsb1J0djFjcWVFTW1iQjJu?=
 =?utf-8?B?dkFPbERRYUpVUUFHd0xoOTBrVUNtdE5HSDVIRXhTTVpoQlhtUndaOUpnUlJ6?=
 =?utf-8?B?N0k5bU5YNWJnc2xqdmJFNEdnRHlDS2g5ZFp6c0NQa3ZZdXFYWW5IS1JoOFA2?=
 =?utf-8?B?Z3Z1bWg4RDFqVzgwQXpzNEVWRlpyMU81djNjc0orV1U2S3N2Z01WWXlIMGIy?=
 =?utf-8?B?cmJ4Z0F3Qml2SnJwOUw1MFRxYS9Zc0JzdGpJN0ZDQmJOSnlMT3ZxVmFGR2JH?=
 =?utf-8?B?cDlRc2k4OEQxeGcvZDZzQm5WU1EwNExiNzdJQng3QTJwS0JyNVpzeFNZUXZG?=
 =?utf-8?B?UFI0MWtUQm1lTHRFZkJBWVN5ZXA5dXMzK1MwVHJCNW1tYU45cG5YSm9FR0RD?=
 =?utf-8?B?RXhyRDhncUlXM1NvZVpBK2RpUVJldVhnNmoyeWZWM1N2NkFFcnRRRGVwaFQv?=
 =?utf-8?B?VzRYNC96eWlKR1ovNTRZNnp4eVdYN2swKzNZTnhxL2h5bTNaT2NSU1lFOW9h?=
 =?utf-8?B?SWlJZGhhSEV3cWpldnpwNk8zZlhEajgwUmJKaDlLcEN2TGFzVUlyNVFLMDho?=
 =?utf-8?B?YTdnTzVXOUV0LzZ1NEpTcTZ2bUZkZC9BazU2NG1mR3Q1SXFzOWlNbzQ4SjF0?=
 =?utf-8?B?U1FQRjVkVDFSQWV3ZWRLckZkV0dUbzlvVXF4SCtCZC9ZZHROT3NWS2dlUnJh?=
 =?utf-8?B?MEtNeFd2R1RyWk0zUVJkZVpyMHNlQVRRWEhPMWhVWDhvRTUzcVZ4RE1kQVVw?=
 =?utf-8?B?NEgzdG16cWJVWHVmbVdJVmhITFV5enJpTGZaYXB6bFhUMHh1UWdlTm94STVh?=
 =?utf-8?B?eWE0TGowM1M3YnhtQ1pBbkFHUnpiL2hMaFA0RTZaRW5WY1F4S1ZvR3NjdWtm?=
 =?utf-8?B?bklacHNqTUxkUDBlNGF4VXlZbnZjS3ZHbnRPSkdncVRIYnhna1lZVGw5UGw0?=
 =?utf-8?B?NG00aERoYUduQzhCWEhMVHYxTHhwdStFUU1pUmxCWlEvTjlIUXN5RlNjcmhB?=
 =?utf-8?Q?NrejgG95J4ukWbZwL3WqdlTfKXAf3Gqc5CAu7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 590a65b4-bde1-4c5d-9a6c-08de54d646ff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 08:07:22.7312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i79xUzK1iS+8gP+NsIl8h12N1P4vFW3x6cX4isC2TawtLRJ0iLtqdps2mU2LW93+tqBq0JoQrQV0GB9sR0tfBp3GIkUwW9zjNjYUm0ntlTCWlKxfyJCKdbzfuHiydIL8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7285
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

On 13.01.2026 07:34, Matt Roper wrote:
> On Fri, Jan 09, 2026 at 10:12:51PM +0530, Balasubramani Vivekanandan wrote:
> > Further updates to performance tuning for Xe2_HPG
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
> >  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 93643da57428..cc18ddfb7cc0 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -135,6 +135,9 @@
> >  
> >  #define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
> >  
> > +#define CACHE_MODE_0				XE_REG_MCR(0x7000, XE_REG_OPTION_MASKED)
> > +#define   MSAA_FAST_CLEAR_ENABLED		REG_BIT(5)
> 
> This register is under UMD control and Mesa is already applying the
> workaround on their side.  Is there a need to do this in the kernel?

I wasn't aware UMD is already applying this workaround. Thanks for
informing. We can then drop this patch.

Regards,
Bala

> 
> 
> Matt
> 
> > +
> >  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
> >  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > index 5766fa7742d3..122829c8d14e 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -144,6 +144,11 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
> >  	  XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
> >  				   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3f)))
> >  	},
> > +
> > +	{ XE_RTP_NAME("Tuning: MSAA fast clear"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2002), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(CACHE_MODE_0, MSAA_FAST_CLEAR_ENABLED))
> > +	},
> >  };
> >  
> >  /**
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
