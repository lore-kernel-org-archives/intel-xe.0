Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7220C87FD2
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 07:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A1610E281;
	Mon, 11 Aug 2025 07:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoLVipv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC7C89F49
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754897957; x=1786433957;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=ibjv3LY0XXDRy3Hn2y0OXZ2H52l2roACk9TPZeuyLZM=;
 b=eoLVipv66t3CxTYoGJL89BV4nlxFd/ldmeF2+aUJTrDdPN+blEJapTZA
 UraLq+vtnavqAoIRJ4hpznnESBZFYIT3pzaIUjZAotOrX5J30M+wfFLCi
 WFu9lo5qaAWH3HKlzSS1YeSdrAluUI2DZ6P08eWOOOprtVpUJkHumvXJh
 4xuyiDHWWGOjOVgZHTy3jfej4BUUkWLLhQCoEPK3aaTd0UIPn4Y0+ddcS
 CBFs8/3avQkm5rRUUPSKLGmfIRRjdhe4cpGZd4VBgmLGRunOE2s4e0qRH
 /ERwFaxJXwigSaFHilnSAsRb24KOYI0EAt7Mj5QZZ0tLeodV9n1v3YAQm g==;
X-CSE-ConnectionGUID: ryvGLjEwQX29al2FSw4uiA==
X-CSE-MsgGUID: +To0ub0sSEqBtSKZEsyagA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56856955"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56856955"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 00:39:16 -0700
X-CSE-ConnectionGUID: FZeSYXewQMOyfQgj0QmqNw==
X-CSE-MsgGUID: ZjGcRVeSRFiMLI2Fj1drxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="171203709"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 00:39:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 00:39:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 00:39:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.88) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 00:39:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cD5Krao9yIMTUUtQIVUHM9xFtMFt/ap2ZkyWwV1PAn/Tt1xYKcCScCz4Tpv/hBvOe9RAV4ZrK432k6NERDJm7eY93M1FBFMzbohhFSrSvfOz5pbH0TNiHl8Ie9hfiSWOUsiH3B5FM+OAy1I8VgImAj/HEGhEeJCtS5kcrU8MIBhVup34cZ35Ztu2EZ6lmD0F++TUyBxArcobZoT2usxy6k7QGBBYKlbKfTQKoOBHc1vvaEqLgRJJ0DDMS18rrWSMp8GDof8Mn94to5Ja/3iNe7qkhYQySy7/YtnpaitPVJueSEsJOqIzoKHfUUpJiUXMTeilYBTdxLqoQ6EAzGVtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6QR+XftYsaT1Dyr/AzcsdFZwL4PX5vnUq8+KbiFtck=;
 b=tvIWfCUU9GKs/WfclIQjnAWG+DPCix0FjlckKnpcUGKJDTgkXlLmXt9vMuHoldfQiFK424/9JI41rVY81zjVQ8kuAHKjlzsaRofEMrIY71b/h1GuRLnAQKrp2bTJB7X77OfKQ+KB5pns/upFjsei/cqMwMpG+rqqB7TXHRxziH/Ex9hxJpdl6oVbUIQCufy0eDESdsCebv2yMASlhNROnWhdee5oJ24x7gWPINOqsUOr2kxmNJUIJ3i9/6x4wQlCUUgP3LePoboBrz5ZRDGjdFEyGdIHD5GL/0Y1PGcFvR77rAXTIt6bBD0durk7f9r8GfmZQp2PaoQPa0RKJ/d7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 07:39:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 07:39:07 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v2 0/2] drm/xe: Consolidate VM initialization logic
Date: Mon, 11 Aug 2025 09:38:54 +0200
Message-ID: <20250811073856.1950732-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0201.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c81be8-03bb-4ad9-8fa6-08ddd8aa2778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWlxb1RNUDRPeEdTcVZZNzVBK29ENnNJK1cwVjRzVTJ4ZGl5NExqUEFhdzBY?=
 =?utf-8?B?Qkw1UWwrZVB1TWYyVldoNVlxUVRIb0VRdHl1WHVZcHZWM05qN0NWZkdEU0ZJ?=
 =?utf-8?B?VnM0V3BJRW92T2RqVnljWWV0MzlueEVIY1ZPWFppMndFK2cweHkzcll5Zzlq?=
 =?utf-8?B?Ym13b3Y1WVE0L1gvVWFJZkpEOTNzM2ZwTlV2TUFYNjRsazE5SHlYSVlBYXg5?=
 =?utf-8?B?MU12NEk1bGFnaUN3bkp0a2FUZFdIOEZuR0pCN2dCdnVhdlNzQTlJM2ZZQ0VX?=
 =?utf-8?B?QkNHUStLWnlRWG84WUo4OXJLNlEvZGxCRktMZGhDSi9QUURGL0h2VTkzMDd0?=
 =?utf-8?B?M2MwUmE3QVpDQ0pBOWhQTDkzdU54MjRLMTVXWHBFSjgwd1pjVWozNVc2Mk1m?=
 =?utf-8?B?YnFnanRtZ3ZidVpBeHpKUkZjTnNYbGVCS2dhRlZrVEZyZ3BDZjcrbmh6QXI1?=
 =?utf-8?B?YjczcWlMcDMvdCtZVDNIeGVUUjg5WG5vYXBwTTAwZGl6bFBqWjZyeUtyM3pV?=
 =?utf-8?B?MXRMNEt1Y3pRa1VnUHVUSVRUVlhpc3R3SWgzeGc3NkRMNHNZQVdERVdCaGUz?=
 =?utf-8?B?Z0xFV1M1eXJZK01ZaVhPcTlGQXBjZTlUcFhlV2ZzU0c0QkVnUnNSRWxwbGNI?=
 =?utf-8?B?cGNETGdjdFlDTWlqbFVZblNVTlUxK0tES04yYysySmltZVUxOEJlYnhGUVJa?=
 =?utf-8?B?dVVEV29acGZScm9hRGRCcW04NzZNL2NQNEF4L3VhRWs5enhnL0NQZmhOMGpB?=
 =?utf-8?B?ZjRWMG9NNzVoenVwa0NReXlPV2xEVjhEMERNYU54RkFIUDliQ1NqZG1sckdG?=
 =?utf-8?B?VGFtSGJGd3lPKzVKVlFqbEhaS2krcFJOdXdHOVpmMVdsY0VNdUIwK1JHVXBX?=
 =?utf-8?B?dUNQQWp1MnZPWEVmS3lqV01EV3RIT3drVC82STRMdDBCazRmQkpqWU93OGVJ?=
 =?utf-8?B?N0IwR0haTG9CNFJNZWZvNGJaM3h0Q1I4VUNlRk94OGxHRU92R0xsYUt2MWdD?=
 =?utf-8?B?WkVFZ3czSWJXRVBkQ21JckJoMGtMaXF6Sy9GcXRIcUprcUUzemtmSTBoaGhG?=
 =?utf-8?B?OTRCeGJmbkJ5dkc4UHREa2lKNnF0NmVzMFRnVEJoSG0ySlphczYyanp3c01n?=
 =?utf-8?B?OVpLNytQVHk4YzV1b1BlZWJYT2FJVVlYQlhMdHZtRGhMcElMTXR1LzZ1dWMw?=
 =?utf-8?B?UGhrNTlkUDhvYVVWUG15bHAwK1FWYVpxKzdGUTJBZ2RDMEg0Ym4yZ2lwMllx?=
 =?utf-8?B?SEtuOWI0aWp6UzE3cjczcTc1aDlHREs3UFROVjFtT3RIZ29YNExwMVBoSm1Q?=
 =?utf-8?B?MWErbVZRRzZNdCtKRG96NDB6b292UzVmYWFQSys5eVR6cGFMN0d5YmRIRGZo?=
 =?utf-8?B?c1VmTDlYVUlvaEkyVkxLVWpJT2hORjFPMkV3RFR0Q3NUeGpyQTBlVVpHdFBJ?=
 =?utf-8?B?bG1ubnN5Z2RzcWE1NytGRk5uZG9nRlVBUXQ3OWt2aWpZcjRNRmhTZ1l3UitO?=
 =?utf-8?B?UTdrWEdTd2hBSWJjb2xYWnFkZjhXZHNrQTlibkFsTlR2K1JTQ1U4VDlnUG40?=
 =?utf-8?B?TVdNSG52djgwU1NIcVpVOUNmNUZJa2dFSkd2ZllTcDlmancrZFFwY2VRVXNN?=
 =?utf-8?B?NmxTWDNQZDNRclBvYUx1cUpxNWRqVTE2R3d5bjB6djhvQ1czcVI0VlRzajJP?=
 =?utf-8?B?QlV5SVpFWFlOaVpvYi9yOHhiaXA0S250U0QxZU14M2g4SXVEWERGVmlYcHZQ?=
 =?utf-8?B?d0hwM09GRUJZVEp4OHFZdGd1cVNVM3VXR052a2RYT1Jzbk9BNjZuRDYrS1gx?=
 =?utf-8?B?MjlnYXRldU5iUXZka09JQjAzOHV2SG8yVW1ZMVBGaGxWKzBkQ3lSOTdESVI1?=
 =?utf-8?B?L2NnaVhxdTdYY2FWeC9LckpWNldjREtvSFVDekVvY1JiWXgyOGpTTEdPVjJI?=
 =?utf-8?Q?k3bK/2kGz3I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDlxTTE5U05VeElYd0JROFNtbE1PWGc3N0hsekxDeWhwUG9IMTE2VHR5djNT?=
 =?utf-8?B?V1lwR2dUbzJOYWVWV3Axc1p5bHhCZlk1Z1pSNXErZGl5bVAzUEtIekFmQTJQ?=
 =?utf-8?B?d3F5WDJNS1JsK2dtVU5yK0Y4Yk80TmgwYW1PajBhc0Vrd3RTZjdSU2JMTmJH?=
 =?utf-8?B?TlFEM1dQTDdJUzZNQUQ5dFh4dFd1WHY2bjhmT2lYSEd2a2pDUXAyby9LQzVy?=
 =?utf-8?B?QjZ2bDlSNU90WTkyQkNJYmE2UkVHTmdJRUFadEpxT1FGeE5GNnVDL0pvVzhZ?=
 =?utf-8?B?YXMxWDV3MGdhVVM0dEl3aHI5ZHpEWkZnblpDZnE4MC9Jc3hmRzhsUU1lQW5C?=
 =?utf-8?B?a1Z1L3hBQWRNaDhuM0NhbEtqV3c1RDRVcmkvNnJ1MDV0QUtTdEZEVUdETnpy?=
 =?utf-8?B?Um0rKzRrL1puZXVGRGJ3OEpiSENBRlpkdTVmSDJCNEsvSSswNGltdXBjMjB5?=
 =?utf-8?B?elpwMlh1T3FGSzlYOEFoSllnK1BRMnZPVUpXekMxS2xSbktFSmNSSlBrK2Y5?=
 =?utf-8?B?eXppSElzVlV1YWVYeGVFZUVIMUd2b1ZxYng2SnRkYjhBNThUaXN0bkJRNElP?=
 =?utf-8?B?K3hQemN3MzZ5ZjB5aDlKZnBJMGdZQ2JCbXV6N2ZOaUw1U2VtT1hVRnU4eHJY?=
 =?utf-8?B?cGNwaGkzTWJMbFJlTklLaWszYmw2SGozQk84QWpONVBUblVpRmkwcC9GK1ph?=
 =?utf-8?B?Qnk5SWRkZ1FsNFFtOVlQWllUUExLTjZHd0RzQk42VG9jV1Y2bC9OTUNWMXdR?=
 =?utf-8?B?NzBaOFVnZFdvbDNMSjBrREJGbjBLa2h3OStqOE4yZWppWjZNbkZxZUkzc0Rq?=
 =?utf-8?B?eFpQTU9LUXRBdU1ORzRyWldGZzJHbTdUdmhtREpiUTcyUmZHSy9uT2VUb3o2?=
 =?utf-8?B?TkNZU2ZPMStlYTV4Ri81cWx4Q1lMamdjQTBDNVo0NCtFMVg4UHlRMEdzNHZC?=
 =?utf-8?B?UDBvcmd3ZXoyTFFyRkVzNjBteEJmdkVZbFlKeDRVc25EaXoybk5MbVlxWFd6?=
 =?utf-8?B?NHQ1UzZoeUI0V3FYTUdvWU1aRFpKMWM3NjY2dU96S2c4TlpFRlhpcDg3YnpQ?=
 =?utf-8?B?cmhQMjdkck92S1hRYko3b1FCVW5LMFFFdmxXZU1NVW9qcmJxV0FHN0VLVEtZ?=
 =?utf-8?B?Q210SEZ0THhURlVsVldMOFVZWGhoVDJ0YXhic3JiMGttSnBYMW83ajlqTmpF?=
 =?utf-8?B?cVFFZjEvb3hwSzVvRzMyWTFzMTVQaS92dTQyOGtIeWRxMWRMa2lWTmx6Vm9X?=
 =?utf-8?B?YkhTVmg3UDViVk5rOHkraktuS1g4Nm12bDR2OTdGaERVZmtEdDlmVy81UDA0?=
 =?utf-8?B?VjdvU1hjNkYyNVFyckdkUW93WWxnd3ZWR0hnWXgxOUZZOEh2Wjg3eWs4Rzd6?=
 =?utf-8?B?dmlWTGY4Z0c1NU13bitLT1g1TjlEQ1FBQWU3d1ZJRVZCVnFBeVJGWlZ1eWZG?=
 =?utf-8?B?ODVydVV3N0pZNFIzUUlKQ3pwWVAyVFJ4VjJoMG9yL2ViZ2J3RGUxVUl0Wk1j?=
 =?utf-8?B?SnN4L3NtOElUYXJxdFVGSGE0UnQvNkJFL1VTcUhzWWRsb3JlOXRlbVR6S3Mv?=
 =?utf-8?B?aVRpYnllOStqWkwrb2FPZ0RGYmhMZG9EWWpxM0J1cWRXaU1JUUpHbHV2QUJR?=
 =?utf-8?B?TkhvZVB4RGJuRlZwOHBLYmZFY0NoeXZycW1EVGhLSXBKQ1h4ckxuQU53aUFC?=
 =?utf-8?B?b01EazlZK3JVbkcvdjNNakQvNTRyOE1TWmM0ZW5TeDBLTENtUmJONVEvSkJT?=
 =?utf-8?B?RHpJaXRDTG5IYnUzd1JrK2ZpaG1zeGR2TC9EK3oyd244NjJDUVh2TmFpQzd6?=
 =?utf-8?B?R0dXeERxams5WHJ6ZzBmRFZ1L0VwdGJSV3lybllGdjF2Tm1GSTF2SlZMMVBU?=
 =?utf-8?B?eXBtL1FtWnd5ckxSd2VsTFJOOWJiYmxnWjRmbUs1b3h2UmYvUGtONTNTSVpi?=
 =?utf-8?B?Y2NLT24zUlY2bUJabU5aUmVLSUkweHZNWXF4cjliWjR0MHRJei9kSGRXZm83?=
 =?utf-8?B?dUJ3a1lLblVzZnZOR2xkRklUNUx5TWRzSVdMOFIwMmIvaDh1TFh2NHROSGxz?=
 =?utf-8?B?amFJTlJXbjgvc1hjZ1ZGSmhzZlhSRXpLb3liQVQwN3NsaEgrQ2lQckRKTHpm?=
 =?utf-8?B?eE1IYkdTSTI0WC85bGNDTnhub1IyQjFqTXhFVWxtS1VQVkV6QzhEUFNUejVv?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c81be8-03bb-4ad9-8fa6-08ddd8aa2778
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:39:07.6918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pb53OvPa3i7JpsaTWuLDV9JGRP/34iIV/IRtwFyuLfBglZt6XRTsvRRnYKZm0c2QTnFwOp6jscXLGT1iOvsjkxMEHxtQMMPZkxFKu/pJ4ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series refactors VM creation to consolidate initialization logic
into xe_vm_create, ensuring consistency across all VM creation paths.

This also fixes a bug introduced in
"drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE"
which incorrectly assumed that vm->xef is initialized before PTs are
created.

v1 -> v2:
 - take reference to the xe file object only when xef is not NULL
 - release the reference to the xe file object on the error path (Matthew)
 - move usm.asid and the pt tracking to xe_create_vm - new patch (Matthew)
 - add this cover letter

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Piotr Piórkowski (2):
  drm/xe: Assign ioctl xe file handler to vm in xe_vm_create
  drm/xe: Move ASID allocation and user PT BO tracking into xe_vm_create

 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 52 ++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm.h         |  2 +-
 4 files changed, 31 insertions(+), 27 deletions(-)

-- 
2.34.1

