Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825C5CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 18:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B0610E123;
	Thu, 14 Aug 2025 18:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYZEsweX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D40E10E123
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 18:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755197316; x=1786733316;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mTSJNcK3sPnYPmF0s+ZbdPk2rbOFyRng+w75b/4Pmlo=;
 b=UYZEsweXsQTzKx50nfZRI82Y1Z0i3xCJKiC68jYKJo0NEob7mIqqEDZW
 UwzWWQPlcuzElo0Pm5LIK0ERWBbXVPmAn+jXp6fAoLCDnCNZBV/0s0l0U
 8hH4TzDK6DkqqKN/FN0P2W0qrBlgcKjoMOBkoa4nlny1K6y1JXDC7m9eD
 2pUZvMwWko24W84vbY5MhJ/FtKd9Wnoky7aWF9XsEYZOQ1lcgmVNSrKcc
 iPyQc4YwXDaW1mPb/VRVt8mGynQmlSkK0Kul4uYmlZVkLQp4nHndOv3eC
 NwblXtF4vv74yUmgEKElGQI9QfYGduAWKgahudnoPwS0hPYjZPgt4kngu g==;
X-CSE-ConnectionGUID: ZDSQL186QVK/0fHC5KKQ0w==
X-CSE-MsgGUID: T15JuqJ9Rb+R6k2Z2MZNMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61331333"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="61331333"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 11:48:35 -0700
X-CSE-ConnectionGUID: P11FpsHKQxGZIZ+Jj0rWzg==
X-CSE-MsgGUID: A9VJHLOCQnyRyhaIV2C+IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="167092770"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 11:48:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 11:48:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 11:48:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 11:48:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auEwZRjQyzmvLLzcKFdBZO7wHC5Onhsnyv+MKb0WZZRvlzRkh6PPvie2XEXAI6pBeGNMfVTJg0UIaJehaVUsQ8bhRFi1+HYz79TfhAXwXIslDQlGKMqh4fXJNXZ8TOZx0pOEYCCOqfuG2KkrQIgDFy6c+LyqB9DDlUWT/ri6YoRzwPLMWs593oPp5H6oGhcZ0118Tzs2s/MEeoNinYZmZFL9RZqDWJtnl0xRCOi+4CLognVHHMhEB1s3+eCMjjPLeh4VFK1ti0MRVyfm/O9GxWQfvWeOahpbJSSGfrMHze8ScACl/mMzS4xu8PeurNN1CN/KDcRAUEnuSoY5gjlHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqXoYG48VpbK1/6JyhlK4Cs+3QGF0LJNIpllr1l8OHE=;
 b=FxisZSfesjMIBkKZutZTQKZqb9LAViwgHXbqd4GTB4jVqYiJkYWgH99NDxx9xc62ZdataRjPwQ3uzGpSVOqLppZl7AJTL6uJPndKYhcSZLzSFgxWhcCVyWWqeaQGc2n5akr3R/coHJ/xadsZhttUBRkjz3Hcpi2KXnW5oIe0wYlyH9F/YU776DTWEzM8o+ruxin5F+26Y+UZ7sbv+0VGA1DONB4MpkOzDyY3VTWI7Jpa7FIVs4v+ZiWZTejpkRDq5SLQRpR0k+EWQoFowiJYboiyOJxEspBaj5bzVS4aAyAe6YizY0urDy7Wl8YEx03u0lluxPVtMW6gm40468GMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 18:48:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 18:48:32 +0000
Date: Thu, 14 Aug 2025 11:48:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 13/15] drm/xe: Convert xe_bo_create_pin_map_at() for
 exhaustive eviction
Message-ID: <aJ4vfeIn9q9CuTTs@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-14-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-14-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::36) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c622687-472a-4d80-6aee-08dddb632adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlBIYVl0N2EyOWp4NHNrMzhtamJPZEx2OE1uZnEvNWpDU2N6UnFadCt0ZXNU?=
 =?utf-8?B?ZmVYRXhPYXp1SjNXV0hyRUt3cTAvTHovVWdCNGpaTlRzWXZNUWhqdFJCRHhp?=
 =?utf-8?B?ejkzcUxja0xoLzhjYVc2MFNCWTQ0M1lYMGpscERHbnRObGxVWm5TT3h6VDQy?=
 =?utf-8?B?Q3lheTR5UVFYTXc3RTZXTDB5VExnZlNjRUtGL2l5RzBtcUNzVzVWRG1IeXU0?=
 =?utf-8?B?RXN5TGhYSmdSY2xNZ1RyRHMvMVB4d0U5ZUoySUNXYVdqTUlsSENvcms0OTBa?=
 =?utf-8?B?WWEybHFwbU5sczhxM1ZMdzc2d25FOU12U1NiTExUcjJzVGw5V2NRNERzY09Y?=
 =?utf-8?B?QlRyWmx0T0JUM29ML1ZJWEJFRk80YXFlTHhqMThxVEZZZDJCTE5PS3JsbHpP?=
 =?utf-8?B?bG5vNThKcVNpM0lzY0QweXNkRVNJYWNoZTRHdk1vMjBzSFh4UTF5dmFYQXg0?=
 =?utf-8?B?RWtUSVY3Q0F5MlVvaXJlMjVNamJjN2pvSlVTK3JuRlFCV204bDBWVWZ0VGJ6?=
 =?utf-8?B?bFhhNVpjRVlNMDU5eEFUUTMrcms1ZEIrOGRWQk5tb21zb1lTcHJGTkVMQTIy?=
 =?utf-8?B?SVJyU3M2ZkhNR3dVM0lOWGZXaFpLM2tyMktJZTFZdFpKN3owQ2dodkt2VFYr?=
 =?utf-8?B?SWNTMUhPcGRaT3hMNHRNWHNtdGFYNVpjTVRPSHZMWmd0ZUVvWGF6MzRlenZs?=
 =?utf-8?B?SUE3aStHaWhXVVJpa2F5SkNNK3JzSUt3UVl1ZnVIelJSOXU4Zlk0bmdXK0I3?=
 =?utf-8?B?eXhMeVRqTndUNjVoVVY4andEZXg4b0pyT3hBcmRSWnord2NHOCtPcnVlNWZ5?=
 =?utf-8?B?Z2ZNRjEzWEptRlZTR243VDhobm0xSUdlc1k2amdVbW9ycjdqT25CbVp4bjdD?=
 =?utf-8?B?MjhiUWw4K2sxSm40eXREOFNjb0VUSklOQVIwZHVyOFRlYnJUQXc2cDlHLzAx?=
 =?utf-8?B?NlNxZnJhUWVtd1p2ek9FVTBLcURnMktSUXNTdG5CVG9ENVZYVVVsWkd3d2Fz?=
 =?utf-8?B?Y21aSHFOUi8rTHowTmZrY3NiU1Jod0k4UXpEMmRrOWFXR2ZvSWZERVM0TUpN?=
 =?utf-8?B?RGhndW1zNnhjQkhyK1VGWTVFR0RBWHBSV2luZW0xVDBTRkt6cDc3U01rZ2VC?=
 =?utf-8?B?RFFNM3IvQUxudXhZWGxlS016czlNcTdNbGpkK24vZUhLZ2RsREhSeWNUZVo4?=
 =?utf-8?B?VmFQSTlFR0ZYcmFwcTJZUm43emxCaURTOFZXeVg5SGtud09TaWFia3VKZmNO?=
 =?utf-8?B?Y3JHUDhHUVNmN0k0VDlWNGt6akRTMy94SmxzNkJxL2o4RjJ0eDNtc1ZCZGQr?=
 =?utf-8?B?Z3dtejRyazF0YWlkRU9wUHdReFVlOWNCdG5qTTB0ZXdzQlNLSnNLWFQ2SDh5?=
 =?utf-8?B?aXRXcGVNL3RsOTRnOUtGZm1qSWVJSmprRERUMXFMUnNFcERNaTg0ZFU3cVJ1?=
 =?utf-8?B?S0lEWDBVaENKM0s1TFpUZnlkQUVZb3RneGpjN3JnbGdkSUpINVIySnMySmFN?=
 =?utf-8?B?ajNHY2srUTFJSDlIOHJhSm9RVUJFYnBFMjd3dm5wSXU2SHAyVS9PelNoRFJT?=
 =?utf-8?B?eE11citQZFZ3aGJuNU5hbWtNemJYOU9hV1daMnF6Qys5RGhHZXhzSXVkeEhr?=
 =?utf-8?B?Z04ySVkyZm5OeGFHa2xpanY5ZU5JMzgxQXd4bktqKzFqTjZRUElzaXJBRmlp?=
 =?utf-8?B?aFhaWW1md1RWRXFwR2s5bk9WM2x0VXJ5bTJ2dHBKZUdqZ3FyMmNJbHEvSThK?=
 =?utf-8?B?NCtyOXRwaE00UmtyMWV6Z002c0s3TW8rTGwwN1p5MTkxcC9pMExnK24yVmpO?=
 =?utf-8?B?WHZwYlVJRGhwUlZ4RlptQ1dVUnh3NXJVVGh0Ymx3ZlpGRnlhbll5UDhyWE53?=
 =?utf-8?B?YWw5WGg4a1VyM3RmTU54K0dTZE9Lb09lS25Oc2dBMU9QbXo5Q2NrU2tBTnNQ?=
 =?utf-8?Q?U7Cu9RKmXtY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1BMakc0VzVHdStyckVxaWU2bnZwd3A0VGtaOTgrTjdRZndlRXVDck5FdzRl?=
 =?utf-8?B?R2VWdDV4aTYyY1RrR21qd0VVcXY1Rko2L29lTTc5RSs2NFNMQ29LZytaRGgw?=
 =?utf-8?B?OGtnUitnRTBwakEvcU1HaGxyek54UVNsa0wwSHlsSWJzVEZGa3N6VjkzbjNJ?=
 =?utf-8?B?RzBidFgwSGtMcHlJNHdJQWdsODhzT1pQMlRmVE9pMGVBZnFYQksxQlFkYWI5?=
 =?utf-8?B?SU1NUm9IRXFLV1pmTndmUVRnRGh4ZU10amRLYU02KzZIZ1VnYmNZWTVGbmJr?=
 =?utf-8?B?WWp1anN0d1haanFIUkkzNzU3c1EzQXZZT0t2ZHMyVmVyOUIvZUUrY2VJaitq?=
 =?utf-8?B?YWJLbzVYVE95Slh3NGRGb2pHMlVTK1hOTjgrdmdUd0krQVQzVmxaVW9vMHgw?=
 =?utf-8?B?UGRiMWppSDE5ZHRiL3VZOHlGRTdQT2U0OEtVa0g1eVRhTGY1THdvcTJIS25l?=
 =?utf-8?B?L2w5Z3V5c3JIdFI4TW1OVUJZcUdxUTlRYUxzWkFTOWJKS3FGR041OWhJUURT?=
 =?utf-8?B?SHJkTzRNbEpJNmRubGd6dklGV05YWDJXL2tSYXI0VTVnc0dXYkhpdXJkTDgv?=
 =?utf-8?B?WWo4T3JoUW1UdmZBY2tvTzk0TEJQbFFOb2VobFBHWnJ4ekVaK1lrRjlPNGYv?=
 =?utf-8?B?czhWdStpUlZvbW9HbEFJdlYvRkREYmEyTWQydjNxU3BaQTRFOGk1ZE5xU2xx?=
 =?utf-8?B?TE9xZ0NGY2wvdmVDTEdHbmV3VjRNM3NqdDV5R0ZySk1VL2JxNGF2UVNTYTBo?=
 =?utf-8?B?NFFDY0RkRWt4M3hWSldZQmo2UU5TVnRWN0pZTExjQWlIcnJyUVBZLy9LU3F4?=
 =?utf-8?B?STJjVlNPeWxDV3lldGs0bVRYaUNQQ2tJL2JvWGpCcVJ5OEVLNXNpVGYzekJi?=
 =?utf-8?B?VzRFMDkySjRERGw4QUlhbGNJR3Nlc3VzZEYrVmZTSXdwZTFPL3I1ZGFZRkhz?=
 =?utf-8?B?YS9jZXhqYkxGeHJ4b3JwcGdnUjlTQ2lhSS9GV2RXMkJ1RytlSDdEMkRrVG5J?=
 =?utf-8?B?Z2pTRkdjSnNaNnRuckt0UTJGNDI1WGI1NlNMcytFNm9wa3UxOTY1bkk4T1Jk?=
 =?utf-8?B?OWJjcFAvdU5COUQ4K3lQenhyaUFDVXZuakNBS1BDc1JFOEVVRVZwUitaV0t5?=
 =?utf-8?B?cnRvS0hBdWF2RG1ya3ZxMEtZWTRiMlpqSUVsNStCa0srbEVJUTd1dEhQeTZp?=
 =?utf-8?B?cGs2cURoM2lIN2dnd3NOVWJ5d2JWR3J2UVRmUWk3ZGVNbkRnZDdlNXZ3ajZi?=
 =?utf-8?B?U2xWQkVCMkd5My95bEIybGNUTlJ0cWlacmJVWXBweEwxSDN3Skt0MnhTdXN3?=
 =?utf-8?B?MjJyTkVsVWdRUndLTGdpR3BVTjVZS2hiYUZkWHVjYVVHSWZ4VEErYjl3ckZE?=
 =?utf-8?B?OEUyTnRZYXg1MXppbGI0NGIzWnV6M250Mm43aXlCMXRzZlZZTW4zMGNkSk51?=
 =?utf-8?B?U1R1RTd4Yy9KcWR0Ui9YbDJVMm85VDRpVGRzeXdMY3dRS2NUeG5VbVF3OVVY?=
 =?utf-8?B?b0VlMzFCejNwdXNYYjU2N0FXVytCZU80WVZtM3RpdUdmUmFXQXVZaFd6OGZS?=
 =?utf-8?B?WW1MNmdhTFFIRkhMQmgrZkMxZ1dxNjBSeDZBb20rRVRPNXVNMWtmN3VINFBU?=
 =?utf-8?B?RE1Ja1R6bXl0MnpMajR5UU4wemhQL000MEdvT2RvRHBCUVRQaVpRM3NLR2VU?=
 =?utf-8?B?dW1WRXd6eDhLTTh5OXRLSlM0eTdTRm9GVDhiaE93K1VGUmc5ZkR5UUd1VWdJ?=
 =?utf-8?B?YldzdWhSb25wQVJlNDNyNjJ0c2c1Y1E2QXI2MWxscDB4RkIwL2pzRzJ1ZEh5?=
 =?utf-8?B?aDNSakc2LzYyRkszSkt0Z0N1cFpybTZFOGthbENqV1BDUzJEQkVoc3JoNFJL?=
 =?utf-8?B?SFNUSXdDalhTMTVDU1NVUDI5RFNwTVNUbTAxSVlrYUo5MlZ1L2RzODRHVklw?=
 =?utf-8?B?czJrZ0FmZjRVUmVWajBpdkNPS0VzdmRvdHNlU3BxZjl1QjRpc2doK3dkOGF0?=
 =?utf-8?B?R3JWWi9QcWNENVZkV1dQS2xLTDlCcGdJNHRpSWVUdzk3d0VMRWk4R3dCcEZh?=
 =?utf-8?B?MXdiemNObG92cmRpaTkza1ovZ21HWEdBeFJkbGZBcnBOcEIwUG5WRVdJcXI1?=
 =?utf-8?B?VWoxVU5OcXVwcGFQTFljYnB0Vnl0NXhDZHFZczhQeUU0d2NTQkVWQlZyM0RD?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c622687-472a-4d80-6aee-08dddb632adf
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 18:48:32.5812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sv2/k2BRga5BC3uQEW1TDlGndrE6Xhbl5BzUmsvLE4S+1piLT0Ql+8w1NPSsxQOEIE4DYxBVa7+PoRlGPzXFGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
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

On Wed, Aug 13, 2025 at 12:51:19PM +0200, Thomas Hellström wrote:
> Most users of xe_bo_create_pin_map_at() and
> xe_bo_create_pin_map_at_aligned() are not using the vm parameter,
> and that simplifies conversion. Introduce an
> xe_bo_create_pin_map_at_novm() function and make the _aligned()
> version static. Use xe_validation_guard() for conversion.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  .../compat-i915-headers/gem/i915_gem_stolen.h | 24 ++----
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 45 +++++-----
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  4 +-
>  drivers/gpu/drm/xe/xe_bo.c                    | 83 ++++++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h                    | 13 +--
>  drivers/gpu/drm/xe/xe_eu_stall.c              |  6 +-
>  6 files changed, 101 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> index 1ce1e9da975b..ab48635ddffa 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
> @@ -21,9 +21,7 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  						       u32 size, u32 align,
>  						       u32 start, u32 end)
>  {
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
>  	struct xe_bo *bo;
> -	int err;
>  	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
>  
>  	if (start < SZ_4K)
> @@ -34,25 +32,15 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
>  		start = ALIGN(start, align);
>  	}
>  
> -	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
> -				       NULL, size, start, end,
> -				       ttm_bo_type_kernel, flags, 0, exec);
> -	if (IS_ERR(bo)) {
> -		err = PTR_ERR(bo);
> -		bo = NULL;
> -		return err;
> -	}
> -	err = xe_bo_pin(bo, exec);
> -	xe_bo_unlock_vm_held(bo);
> -
> -	if (err) {
> -		xe_bo_put(fb->bo);
> -		bo = NULL;
> -	}
> +	bo = xe_bo_create_pin_map_at_novm(xe, xe_device_get_root_tile(xe),
> +					  size, start, ttm_bo_type_kernel, flags,
> +					  false, 0, true);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
>  
>  	fb->bo = bo;
>  
> -	return err;
> +	return 0;
>  }
>  
>  static inline int i915_gem_stolen_insert_node(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 43c45344ea26..d46ff7ebb0a1 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -102,29 +102,32 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  				 XE_PAGE_SIZE);
>  
>  	if (IS_DGFX(xe))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size, ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_VRAM0 |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size, ~0ull,
> +						   ttm_bo_type_kernel,
> +						   true,
> +						   XE_BO_FLAG_VRAM0 |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	else
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_STOLEN |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size,  ~0ull,
> +						   ttm_bo_type_kernel,
> +						   true,
> +						   XE_BO_FLAG_STOLEN |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	if (IS_ERR(dpt))
> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
> -						      dpt_size,  ~0ull,
> -						      ttm_bo_type_kernel,
> -						      XE_BO_FLAG_SYSTEM |
> -						      XE_BO_FLAG_GGTT |
> -						      XE_BO_FLAG_PAGETABLE,
> -						      alignment);
> +		dpt = xe_bo_create_pin_map_at_novm(xe, tile0,
> +						   dpt_size,  ~0ull,
> +						   ttm_bo_type_kernel,
> +						   true,
> +						   XE_BO_FLAG_SYSTEM |
> +						   XE_BO_FLAG_GGTT |
> +						   XE_BO_FLAG_PAGETABLE,
> +						   alignment, false);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 826ac3d578b7..79d00127caf4 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -140,8 +140,8 @@ initial_plane_bo(struct xe_device *xe,
>  			page_size);
>  	size -= base;
>  
> -	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
> -				     ttm_bo_type_kernel, flags);
> +	bo = xe_bo_create_pin_map_at_novm(xe, tile0, size, phys_base,
> +					  ttm_bo_type_kernel, flags, true, 0, false);
>  	if (IS_ERR(bo)) {
>  		drm_dbg(&xe->drm,
>  			"Failed to create bo phys_base=%pa size %u with flags %x: %li\n",
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 23b28eeef59f..c9928d4ee5a0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2253,29 +2253,20 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
>  	return bo;
>  }
>  
> -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> -				      struct xe_vm *vm,
> -				      size_t size, u64 offset,
> -				      enum ttm_bo_type type, u32 flags)
> -{
> -	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, offset,
> -					       type, flags, 0);
> -}
> -
> -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> -					      struct xe_tile *tile,
> -					      struct xe_vm *vm,
> -					      size_t size, u64 offset,
> -					      enum ttm_bo_type type, u32 flags,
> -					      u64 alignment)
> +static struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> +						     struct xe_tile *tile,
> +						     struct xe_vm *vm,
> +						     size_t size, u64 offset,
> +						     enum ttm_bo_type type, u32 flags,
> +						     bool vmap, u64 alignment,
> +						     struct drm_exec *exec)
>  {
>  	struct xe_bo *bo;
>  	int err;
>  	u64 start = offset == ~0ull ? 0 : offset;
>  	u64 end = offset == ~0ull ? offset : start + size;
> -	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
>  

General comment for the series: should all BO-layer functions that
allocate (or may allocate) memory include a lockdep assertion that the
xe_validation_device->val lock is held? We already have
xe_validation_assert_exec in several places, which is similar, but IMO
it wouldn’t hurt to also assert xe_validation_device->val in the
relevant driver paths. The new TTM manager functions are good candidates
as well. Consider adding a follow-up patch at the end of the series to
add these assertions once all allocation paths adhere to the new locking
model.

Matt

> -	if (flags & XE_BO_FLAG_STOLEN &&
> +	if (flags & XE_BO_FLAG_STOLEN && vmap &&
>  	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		flags |= XE_BO_FLAG_GGTT;
>  
> @@ -2289,9 +2280,11 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  	if (err)
>  		goto err_put;
>  
> -	err = xe_bo_vmap(bo);
> -	if (err)
> -		goto err_unpin;
> +	if (vmap) {
> +		err = xe_bo_vmap(bo);
> +		if (err)
> +			goto err_unpin;
> +	}
>  
>  	xe_bo_unlock_vm_held(bo);
>  
> @@ -2305,11 +2298,59 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
>  	return ERR_PTR(err);
>  }
>  
> +/**
> + * xe_bo_create_pin_map_at_novm() - Create pinned and mapped bo at optional VRAM offset
> + * @xe: The xe device.
> + * @tile: The tile to select for migration of this bo, and the tile used for
> + * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
> + * @size: The storage size to use for the bo.
> + * @offset: Optional VRAM offset or %0 for don't care.
> + * @type: The TTM buffer object type.
> + * @flags: XE_BO_FLAG_ flags.
> + * @vmap: Whether to create a buffer object map.
> + * @alignment: GGTT alignment.
> + * @intr: Whether to execut any waits for backing store interruptible.
> + *
> + * Create a pinned and optionally mapped bo with VRAM offset and GGTT alignment
> + * options. The bo will be external and not associated with a VM.
> + *
> + * Return: The buffer object on success. Negative error pointer on failure.
> + * In particular, the function may return ERR_PTR(%-EINTR) if @intr was set
> + * to true on entry.
> + */
> +struct xe_bo *
> +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
> +			     size_t size, u64 offset, enum ttm_bo_type type, u32 flags,
> +			     bool vmap, u64 alignment, bool intr)
> +{
> +	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
> +	struct xe_bo *bo;
> +	int ret = 0;
> +
> +	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
> +		bo = xe_bo_create_pin_map_at_aligned(xe, tile, NULL, size, offset,
> +						     type, flags, vmap,
> +						     alignment, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (IS_ERR(bo)) {
> +			ret = PTR_ERR(bo);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +		}
> +	}
> +
> +	return ret ? ERR_PTR(ret) : bo;
> +}
> +
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
>  				   enum ttm_bo_type type, u32 flags)
>  {
> -	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
> +	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
> +
> +	return xe_bo_create_pin_map_at_aligned(xe, tile, vm, size, ~0ull, type, flags,
> +					       true, 0, exec);
>  }
>  
>  static void __xe_bo_unpin_map_no_vm(void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index a625806deeb6..d06266af9662 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -109,15 +109,10 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_vm *vm, size_t s
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
>  				   enum ttm_bo_type type, u32 flags);
> -struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
> -				      struct xe_vm *vm, size_t size, u64 offset,
> -				      enum ttm_bo_type type, u32 flags);
> -struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
> -					      struct xe_tile *tile,
> -					      struct xe_vm *vm,
> -					      size_t size, u64 offset,
> -					      enum ttm_bo_type type, u32 flags,
> -					      u64 alignment);
> +struct xe_bo *
> +xe_bo_create_pin_map_at_novm(struct xe_device *xe, struct xe_tile *tile,
> +			     size_t size, u64 offset, enum ttm_bo_type type,
> +			     u32 flags, bool vmap, u64 alignment, bool intr);
>  struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  					   size_t size, u32 flags);
>  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index fdd514fec5ef..afabfc125488 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -617,9 +617,9 @@ static int xe_eu_stall_data_buf_alloc(struct xe_eu_stall_data_stream *stream,
>  
>  	size = stream->per_xecore_buf_size * last_xecore;
>  
> -	bo = xe_bo_create_pin_map_at_aligned(tile->xe, tile, NULL,
> -					     size, ~0ull, ttm_bo_type_kernel,
> -					     XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, SZ_64);
> +	bo = xe_bo_create_pin_map_at_novm(tile->xe, tile, size, ~0ull, ttm_bo_type_kernel,
> +					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, true,
> +					  SZ_64, false);
>  	if (IS_ERR(bo)) {
>  		kfree(stream->xecore_buf);
>  		return PTR_ERR(bo);
> -- 
> 2.50.1
> 
