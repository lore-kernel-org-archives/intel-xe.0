Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129A2D711BE
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 20:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB89110E5A8;
	Thu, 18 Dec 2025 20:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuSTdPfg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873C810E5A8
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 20:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766091349; x=1797627349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Jl3A6UuL8isT4zj49ehJ4JTpaD1PkEoVOyTW7OdARBY=;
 b=PuSTdPfgeL5ghau/ZEJNKKcQE0H4LvlqKi5kogvqZ/pj6Uxpo6Yej10f
 TT4Wnkqh+YoSKKDiuxiK3FZXhouKstKjdM27AoktTQub3zu5u0REspPk1
 Z+w4/f7OYpHnQk/hcsZ9jeLZNkIfi31wDYUskDTzypMQqtmMe2J1uL81m
 NPbctfYMdZvDfZyL5MhmhUFJwPlGxqu+BIayucS28lVsozo5pU4AvwI9F
 Egu88xmJ1prw+dAyojLpBlRdwxn+TwUFaurMExTlee046d5eNWZGJLRVS
 EIY9BDIUt/FSB8u0xb42MSHdL2lGOKTelQZ2hu5Q3joHjhK40xIEo4Z9B g==;
X-CSE-ConnectionGUID: pDHaI7FIRyO+EoZ2tUczhg==
X-CSE-MsgGUID: Hi30CqmPR1WbS6aH5R3x5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68101282"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68101282"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:55:49 -0800
X-CSE-ConnectionGUID: /iSHSs6nSvS51eEG0ePpMw==
X-CSE-MsgGUID: uKCa6EU9TrS5sA1iKhRAJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203585883"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:55:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 12:55:48 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 12:55:48 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 12:55:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1MNw3KETI8+2pSNwe0s5axB2JnEctG79zz4F5hiL5dllXbd64E7Dgh7ybQ7wWZx/UJ+WghcPAdj+TZTknkwmcSBLmA74f01wrCtMUTNP4yB2NfM1977W/ik/SrD5M/WeJBxblW2YQs2aS7gMRrx7PR4QC3QuWDs3KTgofyeTc2eozQ3opeR/i75z9+GB4O05RXTrHCovHR5FOZ2+L+xaYA2TNV+q2tNL0yAyGwh+iBZLdcdVR5BYbF3BnQ1GVG7FbfV1lXLKcLUw0ZTE5PdEy/VFdDdcxtqaoM9/uayt+Umnv4jaDREXZweZpTEzNQl9yBkiUjBpqxfLvQPU/lxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl3A6UuL8isT4zj49ehJ4JTpaD1PkEoVOyTW7OdARBY=;
 b=vCcYnjMwV8M0Z6vzvRcIpIwzvjOK85W71t0UXVYz054jtrluQOAbkZrraWQND0P/ReRhsvOwZdf6SA7fbIdGr8uvxkwakVbjqyqgUZsHXJatNoNLXHpoUuH8iAYU6oby+oh/O01a35fi+4Zsq4+Pnlep7WlOVSffoDm51HMTyptwvO37xnVTHMwQcA9+RqVHMla/hbPSYHls+D67eqmZDHCJODpoKT5sNQiRCW74hi8ufM80faaq+SJipZnXjxJJcIfyWLO0xyQbKm7ZvYFkXoXxUV5TBmXod5juqll/FTpd1MkU48NCpNQ7AXUN/FJdyVwYfb83MhEL9uhhkT5KRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:55:45 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:55:45 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Gupta, Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>
Subject: Re: [PATCH] drm/xe/xe_guc_ct: Drop smp_mb in parse_g2h_response
Thread-Topic: [PATCH] drm/xe/xe_guc_ct: Drop smp_mb in parse_g2h_response
Thread-Index: AQHccD+OmX4zRg8jZUWLDCF7l5WNtbUn4NqA
Date: Thu, 18 Dec 2025 20:55:45 +0000
Message-ID: <f25368be9cc3525a139439fb6424dc6a57b9f20a.camel@intel.com>
References: <20251218165803.9042-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251218165803.9042-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BL1PR11MB5978:EE_
x-ms-office365-filtering-correlation-id: b7aa5e11-7614-46e3-e5b8-08de3e77d0bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?R1RMZkRGMzhBd1dVY0ZvbmRzTkZheWJaRmpsRTIxWXBxeWJDeHd3VXRXbHc0?=
 =?utf-8?B?eTc5TnF2cEx5Q3g5Mnc5WEhlc2RRWFUxTkN0QkY3L05VUlAxdFh6bUVWbnV5?=
 =?utf-8?B?NGpFY1V0bmtUL0k1NmV4cTBnZ21vbG5vNmtwQlBHOXM3Zkpmdk5ONFFPaWFz?=
 =?utf-8?B?SFFDTnJwdGFjWkx1NWt2c0FsZFhscGloazREdkZuVk94VUlaYy9jS3pzcnhx?=
 =?utf-8?B?U3ZHdk9MbVIrQS9td3g4eS9jTDNUczhhRDVXcjFkWU9FZi9JRkxWMlk3N1Zs?=
 =?utf-8?B?R3BQM2RXSEJhM2xocDVHdXR1Z3FsSWl0d2JEY1JNU0h6Y2JTSng0UHVtNm9p?=
 =?utf-8?B?aDNnREh1Uk5SR3VKL0NQU2w4MVFFSHBXemxTM2t2MEJvTEtMY3cyUTRKem81?=
 =?utf-8?B?ZGtSYVMwbHVCTm93UkNoZmFINjcxVVVHN1RhRm1WVVl4WVI4UGZpd1ZxVW45?=
 =?utf-8?B?RDh0Rk9vQjhxWWphbzFEQUhZTmgrdHJhNis5RjlrK3A5MmR1cThDeGhPbGhp?=
 =?utf-8?B?VFR5NU8wZWJSZEgzd2VHQkFLZzJwZmYrNkYrbW8vTHRvVlRFdVpVR3o4WFN5?=
 =?utf-8?B?UGluSGZQS01sQUZEcjJhdUcyTjhzcitFOXRGS1hVUGptTEllejF3a2lDK3RX?=
 =?utf-8?B?UjJmZDh6RzZ3Rjc2NUplM2dtZ2NXZUlWbG1CQ1RTeHRibVV2YkNSZk8ydVB1?=
 =?utf-8?B?ZUhUUnAvZmpaMW1iSTF6dFBySVVwZHRNVWMzakZMSXZkMytiSHpxQjFtSVhZ?=
 =?utf-8?B?akVxRjFxWGpkV2xmeHVsUnNMdHF4U1ViMVZtUHN6bXNMQVdHV280OFpFOGds?=
 =?utf-8?B?M0R6ajVxeGQzaFhUMngxZmVPOFNDV0Y0QW1CVnFSL3NoZkVNMU43dXB1VC9C?=
 =?utf-8?B?eFJVNGVIcnVrQU5uQVhxTEwwaitSRDJnYTBQVVhaN25KcS9Fd0xWaXZiOWwv?=
 =?utf-8?B?MkNlVlg3TVpsa29IK0tpWFpsNVM5QmlZQUhEM25JdnV6dVhsVnNiSm5RVld0?=
 =?utf-8?B?TTlmMzhOUy9iOGcyLytqbzI4M0lsN1BEZ0ptWTVqOGVMMWMvOXVkcjdMWFhS?=
 =?utf-8?B?djJTc1RGS2hDWTBrV1Z1VVBOa1RoNHpnU1d5dlV6WnB0b21tekJyVXVTaXVj?=
 =?utf-8?B?d2lCUCtGcmE3a2dmZk82YWUvM1kwU1k0OHN1czI4NHIwUytkbVF6K2Qyek5p?=
 =?utf-8?B?dXlJVEY4Snp1ZCt2QTdtMnQwb291bnVyRVZ1WTN5VGlxTzVBc3FmQ2kxcWJW?=
 =?utf-8?B?MnVqOTRsWFVxUE5tVzBpZGJWNWxlVmVLSWw0RXYxc0N4cTBsVFRwT0xSTlB5?=
 =?utf-8?B?Q0E3TTR5cjVxajJxcG5hRUhrTDAvSEdMbzNFQk9CK2NxTTBCQXB3THdCalp0?=
 =?utf-8?B?ODZaQyt2Wk5qMEM5MnoyUVZqbURxbTVac1ZidGJOS0JOeE1VOUxTbmQ3ajM5?=
 =?utf-8?B?RklwYTAvWWRBekFRTXdEc2NlSEc3V01TMithcGprbzNJbmJEdjBKT2tFbnFs?=
 =?utf-8?B?eHlMR0dKTlYxVUNUbVlkU2Q3L0Rkd3lBNE5QRHhyendHNCtVR25raHhMek1w?=
 =?utf-8?B?aUVzcWRtTEVYZktQTEw1ZkxsN1FsOU00d1hkNHhtUWJFYUxEYUg3bkNJZ1Vi?=
 =?utf-8?B?SjFQUGQ2S1F5MWdvSDJOYWFEcmJyY0c4a2hhNi95WmRzYjVkS3VIYTZSTXJq?=
 =?utf-8?B?bjJ4c09DQXVwQ01xU2pCSEpMTUZRYXpXM2tONnU2a1JiaDd5RFF4cFU1d254?=
 =?utf-8?B?OWl1NWpJaFI4b1lIUlBhM0JDUysyYW9SRXZ0RUxmdXRNSG5HWGcycy94M0NU?=
 =?utf-8?B?WGNvZ1JPa01OTGhVNStBVU93bGsrQmpqbzZMWjlRa2YrYU9NTnBOdHpwV1hz?=
 =?utf-8?B?UGUxNm1pdkl4S2c2WVY3eTF6d3B0MWZqaW05S1I0U3JaNTJJT1FpRG5XaWhR?=
 =?utf-8?B?K1JGR3pvMzNiSUQxblZGT3JvVkV6NkRxWHpwMGR1NUpCVkYvMHlTcjZ3NEt3?=
 =?utf-8?B?MWkzY0tkWk5HendIUHRFcFhmSjVlVTYrQWluUCtTZWhsZzl2UHJtblFOTG9j?=
 =?utf-8?Q?gIJyp1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZndSbzRGemNHTGhLcmh3N2tnSkxSUmlSUXBqcWVHeVRxTE5aazRNUTM0VTMw?=
 =?utf-8?B?Y3ZkZ1VvUTUrMW9WZ21ha2dYamhlak9xcjZkaC9JckdRQytseXpuK1pXbjR1?=
 =?utf-8?B?WElqRnRIVm9rYVBpN3ozY0ZDYUVZU1BzOEZudFhTMFREMERhZXZzblE4WHR6?=
 =?utf-8?B?L2lyOGZUZGVIY1FyZlNJTGVCc1lnOU5kek1SeW1TdFR4am1XZkVMaEFpK2Ns?=
 =?utf-8?B?eE9VMnZOaHhMYSttNjRoNEFGdjJpNWV4ZjBieWdoMUR2Vk9sa0JjRGV3eTdJ?=
 =?utf-8?B?WWN6RW1yT3I4Z2Jobi9ZSHBCejlkMk5MbXJOQS9tcjlmNmEvbkVHa2cxOEdY?=
 =?utf-8?B?ak9GNUhLUktPT0FLZnkyQ0U5cGQzYkVranRJNThwY21YTFQ0ejljRElqMDcy?=
 =?utf-8?B?RXlxMUhBZDlGT3I0QnhBZHVDSW9RZEJrU2hrNU5DZ00yYVdveUxneUVCNDg2?=
 =?utf-8?B?Y25xQ0pLMEFtUVRGaUhuWS9hU2g0SWpFMjZkbXp6bkhGbURZeVgvMlNHNkcv?=
 =?utf-8?B?MHJYUGVjUmJreERodUpwaWlTbERYOHZQWXRJT2tWWmZxZDZreGFnMVpoSWYr?=
 =?utf-8?B?WG4wQnV0dUF6dHE1SFVBQmdUQ3dZcUhVUWRScU5zeVJ3dzh5SjdWSHl0eTJ0?=
 =?utf-8?B?RzZQNm9BcG1KYk9QTm90amVKVHdwd1U3SXd2WXBNR3dpU0RYTDBxbnZlOEIz?=
 =?utf-8?B?SUtPS3NHT1JqTFdpY3l5LzR3cVRCL3M4T2lmYVM2azZZT2FyMlhBZTdGV05k?=
 =?utf-8?B?RFRjMzRYcjRXZ1JOZTlIdGNpamhtU1Y1N09EN3lGdVlEak9HOEJnUHdSa3l4?=
 =?utf-8?B?dCtQVm1VUFkreVpya216Y3NMWnhtcndzWjRrdkYxTENQdEhsNDhCNGRJQjlP?=
 =?utf-8?B?V1g3ZkoxWE9iRy9pRVFDcEZ6bTBCQVkrekIzamtoMFRnU0QvclBBMDYxWDBt?=
 =?utf-8?B?YmJnQTN6MzVLWndsWWVjVGVZWFpiUW1jM3lSN0N3SU9GZW9vblVGa1BLTnB6?=
 =?utf-8?B?cnFMOXlIdnlZazRwNGtqL3JBRlNBNjFXQlNkcmQ5Y1FRbjYxekJSLy9yenht?=
 =?utf-8?B?aFFHR0JyNXN6NHlEanJIN3k4TS92VWJhU1JQVmorcWdMOVRKTis3YU55bi9o?=
 =?utf-8?B?MUhXOW40cE5WRlNpZ05KNWRRYzhidm9xU3JEalFySEwxQTNqVTNaeS8vQWtK?=
 =?utf-8?B?MHgyam5mVmJDbk1RZzhXMjBNNEpvaUlsMCsxMEQwRU5WaTJFUndua0c4Lzkr?=
 =?utf-8?B?eEgvV3NOWVc2OXpQcTl2MTdyVzJtOXdDVjJjZy9WL3pnaFZjVlh6VDNPeWdD?=
 =?utf-8?B?cmVVQUpSRmlYOWJvQnY0bVROWEJjbERrekJ1UFlCZVh5K0xSeDd4ZzJMMTBo?=
 =?utf-8?B?YWdTcWZ2dTN0ME53bGlCZEttSHcrR3JtK2V0bTR0ckZiUWRqcC96aUtZa1p6?=
 =?utf-8?B?bm91STU1Tml1WEtDNnRkRTZQazlUcjhsZVRHUnNWeU9wZ3dDMDFaaldzY2lG?=
 =?utf-8?B?OEg2QUtYSGZzdDMxVjEwclB2TkFYVGdORnJ5Mk5iUXpRNHlSQ2xtQytKMnF3?=
 =?utf-8?B?ZWY2aHRHdHgvRXhVaHNYaWhJWGh2NTFWdzNuNGRhUGdxUUV4SmFNd0tyb3d1?=
 =?utf-8?B?QW5lYUJKb0daM25PZUtXcktzUlVuZXg5K0dxNEtKOU1IK0VtRDBGcEJjUGFp?=
 =?utf-8?B?VjNvN0o4WnhBOGtXNml0WXdKTVRGa2FsaDNjWTlYZTJmTWNpcURlODZHdWNs?=
 =?utf-8?B?dUJHeDhYcmMzc2NxMWZpaGZSTEowaHdETGN3VEhNVzd0VnFTL2VtcFRyQ3B6?=
 =?utf-8?B?elRyQkw4VGp6MTN5MUlzTy8rY1hYbHVtWVBhcG1TajFWSzdpdnZ1S2xhUk9S?=
 =?utf-8?B?YVE1dnlxTHJRQ2tPUHo1Z1BCdTRCaVZXMEUwN2pBRzQ2SEN6RHRSMW9hY0F3?=
 =?utf-8?B?djlDRVF2aFN4VGV5Uzh3VkllTDNTanh4QVNYTDZ0YjNxUHBwSDVwTUpZdjNM?=
 =?utf-8?B?MTc4c3haRUYvYVo2UUJ2YjdRd0lWcXkxV0piWSt4TS9tVDZGemRGUjdEbWNM?=
 =?utf-8?B?Zitmc1JMYXh6S0tLUm1JdmNPSkM1a2JwVndRNkw2Q3hKUktoU1RGMVBBd1Rm?=
 =?utf-8?B?YW1SUytodktaWnBtbVZkZGlUQUw4WG8vOU9hdlRoeVUyajd6cTYwS0lWcmxo?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F3F53993828BB418BCD1B9E439A258C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7aa5e11-7614-46e3-e5b8-08de3e77d0bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 20:55:45.7078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMtiJI0Z+qjYD1t+/3U8kgcUMVAF72EAFcnPJeYdUE4FlpmXK46zJtxgSCb8E3FrT3PIobc99pI4uezh3oDZPAOV89pxF75p3OBbbtoSi5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5978
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

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDE2OjU4ICswMDAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
DQo+IHNtcF9tYiBiZWZvcmUgd2FrZV91cF9hbGwgaW4gcGFyc2VfZzJoX3Jlc3BvbnNlIGlzIHN1
cGVyZmx1b3VzLg0KPiBEcm9wIGl0Lg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+IC0tLQ0KPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfY3QuYyB8IDEgLQ0KPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19jdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+IGluZGV4IGMz
ZGY5YjNmMWI0ZC4uZDEwMWIzNzEwNmRhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjX2N0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+
IEBAIC0xNDk5LDcgKzE0OTksNiBAQCBzdGF0aWMgaW50IHBhcnNlX2cyaF9yZXNwb25zZShzdHJ1
Y3QgeGVfZ3VjX2N0DQo+ICpjdCwgdTMyICptc2csIHUzMiBsZW4pDQo+IMKgwqDCoMKgwqDCoMKg
wqBnMmhfcmVsZWFzZV9zcGFjZShjdCwgR1VDX0NUQl9IWEdfTVNHX01BWF9MRU4pOw0KPiDCoA0K
PiDCoMKgwqDCoMKgwqDCoMKgZzJoX2ZlbmNlLT5kb25lID0gdHJ1ZTsNCj4gLcKgwqDCoMKgwqDC
oMKgc21wX21iKCk7DQoNCkkgbWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcgaGVyZSwgYnV0IHdo
ZXJlIGlzIHRoaXMgZ2V0dGluZyBjYWxsZWQgaW4NCnRoZSBjdXJyZW50IGNvbnRleHQ/IEkgc2Vl
IGlmIHdlIHVzZSB3b2tlbl93YWtlX2Z1bmN0aW9uKCkgdGhpcyBpcw0KY2FsbGVkIHRoZXJlLCBi
dXQgaXQgbG9va3MgbGlrZSB3ZSB3b3VsZCBuZWVkIHRvIGV4cGxpY2l0bHkgYWRkIHRoYXQNCmxp
a2Ugd2hhdCBpcyBiZWluZyBkb25lIGluIHRoZSBpOTE1IGRyaXZlcjoNCkRFRklORV9XQUlUX0ZV
TkMod2FpdCwgd29rZW5fd2FrZV9mdW5jdGlvbik7DQoNCldoaWNoIEkgZG9uJ3Qgc2VlIHVzIGRv
aW5nIGhlcmUuIFNob3VsZCB3ZSB1c2UgdGhpcyB3YWl0IGZ1bmN0aW9uDQppbnN0ZWFkPw0KDQpU
aGFua3MsDQpTdHVhcnQNCg0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgd2FrZV91cF9hbGwoJmN0
LT5nMmhfZmVuY2Vfd3EpOw0KPiDCoA0KDQo=
