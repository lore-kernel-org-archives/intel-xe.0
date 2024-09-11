Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6EAEE01F1
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 00:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9485F10E9BC;
	Wed, 11 Sep 2024 00:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2HNolHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1873710E9BC
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 00:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726015735; x=1757551735;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KLHk7/k/L8PJXiYPHEfKgMc0zIk6SIoUbybmbnr1hHw=;
 b=P2HNolHz7EqXhV1whNqQiLkjd3S/XR5CGDW+SvoRreu3Ji+44TpIakyD
 /kuh1UWxw31nJtMZRfZpNuftdtkRSvmykAq6gTycsE/plPREg2Vqc0+6n
 +eIk6GGUizCwp7T0kGIAQH1sPKt27o71vVM6dJORZC3rv1q3DhVQ8aNB6
 ERelDu5sZvwdF1Ovjko9wRiwYb/UzBwezY9cKvfWbuRUbNpxT6Y57S1/s
 IWAD1FMWtzrRbMoZ0JZHaF5s6Km0WXSSC0S6sjfiI7EfsCvY7w7h/VtnV
 soqIOWqibs6MBUi1iQWS4kaRFDlTpCFLOhMf/zfeycICayhD2mdpvi3g4 A==;
X-CSE-ConnectionGUID: 2deebKBCS9uigwb4eIZU6w==
X-CSE-MsgGUID: 2TTSwFXPTCSFbi/mJ46BMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13464613"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="13464613"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 17:48:55 -0700
X-CSE-ConnectionGUID: 04VFwRi0QSGXorz2ac3VFQ==
X-CSE-MsgGUID: +jyEV1TlT9K1d+RzstYA8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71814528"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 17:48:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 17:48:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 17:48:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 17:48:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 17:48:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BATBDGGCD9LBwv+B3hKzg5LxPFgfTnTdhfoTGRX6oshuUqe+/NOfg1CYoF9cGaQ2yMELC0ZccqUemQVO0UhWkf+dD4fPXLkS+ecMZ0GEJ5VrrQ38vz3rPdrPHDrMWOFugVXWW1yIDms0VkIQxKDGr8sbD9profj3xqWncxNGnF0CQLNiA7kQhFfq+PwzqbFEGYuaGP5A4gU0b6/GywBxGHqVI4Lxb9+kARP+Fyjkpff88BdZMA7LKP+NIvlQLaa4vMuEGtJrAYdl11lNnEk98MBTWrikVV3GMgZTUO79Xn/m+7IVMeCPhELGEsPcb2UrQ5b/bSS+jn8wKylwoPcQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP2zK2QOr7T/RR9+VW33wElTufczdOUrw2jKO7dF0Ec=;
 b=HZPguNkwcUP9jj7+fNUHjsft9dQ/nQZXhpcNzKGaFKhkW/LC03Zeb6xg022FdpW9G2Axcmd6JSuuLkh3IxOHffxdHFjzBqpR94aLrBXasMmnOqrvKfmimvxfF+hQHUPdS0uA1lw3Atn8BtLzE7a+Diw9hUSTuDJqYo/j7XCI9hc0VRKGzRxLkhTtt5xHJ7XdoO9oqZ6Sn9ZSii8p3/NJuA1Xpu0cR0fkAOJv6IUkhUNzXkPm9/ogMF78IvT8thsbYS8CvMKSV4U6dmfMZvWM7LvpUllAdf9E3LYhmCqCltmKRZDvvC23izb2jeo7F4Usy5hnAhH3s9SgCtKuUgC1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 00:48:52 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 00:48:52 +0000
Message-ID: <ae8a8bf4-04e4-43fb-b850-c63574990fb9@intel.com>
Date: Tue, 10 Sep 2024 17:48:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] drm/xe/guc: Use a two stage dump for GuC logs
 and add more info
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-6-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240905205106.1063091-6-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::22) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9dffad-f7b2-46d3-1695-08dcd1fb818e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1U5RG5GNFAxYVMwVStNQWF5bC8xcnQxaG9EWG5vZFlXNC9DaXBaRjE1RlhH?=
 =?utf-8?B?WG9xMnM4U2JxWVZ5OUliazMvSjJuS2dQQnFYMDRwbnpObnVtN0V1b3BHRkJG?=
 =?utf-8?B?S1JZMk10cGhzV1RaWjlwYWVuNGhIazJPNzU3cVNHQzhQQURHNnZSSkl0Z1lD?=
 =?utf-8?B?ZW9DM3VDRDRWc3Y2VVlBaXQrQW85YzJ1RmxDNk4xN3ZvYVVwQXlsWXdRdytO?=
 =?utf-8?B?OXJnQkt0QVNpbHJZSG9WNFBmZ1djLytERFhieS8yMTRwSG5qQmJwNWpwU29H?=
 =?utf-8?B?NTBFTjZNZk9KSExGODR1N0dDMWZSRFczMEM3Z1FrOGlldk9Mc0QyK3YrNEdP?=
 =?utf-8?B?YTJReFc4UXBYWlMrVE5WOU5sVVZFZ1RzUnIreGFrV205MXdLNTFaenZZQWZR?=
 =?utf-8?B?N0JRcDhRaWlPc1NTMVU0RWtLbWhwNFg1NHpVR3ZjQ1QwNm9jamRTcWhRS3Yv?=
 =?utf-8?B?OGhQR01kRmg5SExYTml4dkpTblpueEZkaFloN2JJYWJFNjB5ZC9MMHdpT0pJ?=
 =?utf-8?B?Q254MUJiSEVyU2dwR2txNURld1crem9VOHE1R0lXSFpHT3BFTHhRK0RRNjJq?=
 =?utf-8?B?a0UvcVdOWE5tS2o5RWNaWlkvMDdSL1RMRnYramhpRngyWGtvSlZKdUFmQkNP?=
 =?utf-8?B?Q0owUkpmbmh4NDlQc1orbTEyTFJCSUNwOG50RCtZV1JrZGUwNnhzZDFxOGRt?=
 =?utf-8?B?S0dBbnhqSFYwNlRNa0xhMGdxWlBzTUhqUW1YOTRXdTZVTUdXSm8vNEtrN2hi?=
 =?utf-8?B?aHdxOVFwRFR2aC9GdUNmNHUrSlpJak1QNmpCSjFwWm84dHI1UEJoVjJzMzlI?=
 =?utf-8?B?N1RNeCtsLzVHK1I2YytCVDFRcndGZnk2NlVNdmRBekJtd2twbmdZTzk2Qm9s?=
 =?utf-8?B?Y2hYdVBqbW0vK080Ylljb0VNenYwcVR6NHNYWllRQ3JjUllOZHlxTTlJZThV?=
 =?utf-8?B?bjA1Sno2WVF3UDVzU0RBNldqSGlpd3RSWnBDU29pTGlBclZ3TEZzM0MvaTdV?=
 =?utf-8?B?RjUwaU1vdnFqdUo5RklaSnRhcGNQN1lFQTR0bHE3bWRTSWV3QzFzWTZ3aW5l?=
 =?utf-8?B?NjdNeG5OdXp0WGtuSkRPejA0MHAyczdFWDU5eXYxZk9oRGdvMG8yNERRWGpj?=
 =?utf-8?B?Q24zR3dQSXc4ME5jUC9XMVpxYWJiNDhDdmw5b3hjNVRwMFNPaEdEWE9hbEx3?=
 =?utf-8?B?aWs3aEJXcVNzUVp0YXUrdGZXRGo0QmVsZjF1TXUxRjZwL2tUTFdnTFB0d0Zo?=
 =?utf-8?B?UExsYzY3RlBmQjdBalk1Rnl5Z1pLbkx5THZqNUpvSWJjNEZ1Wlk4L3ErSnkx?=
 =?utf-8?B?ZkhqSXZjYmFUdGpUVXJTbHczbzlWcUdNeWhKQWFMbzF2UEJlRWh3LzBoZmty?=
 =?utf-8?B?MEdRZEVWdThlVUtGK2pwRG0wZGdaS2IxMUtjaDVxVjNxODZQT0lKd2Q3Y3Z1?=
 =?utf-8?B?RWo5WnRJT2pjZXFqdUplcVZ1L09rSkx4UE9mT3dYTHkvcUt3dm9KMWdDeDFy?=
 =?utf-8?B?TzFxa1lacHJ3L0E0Z0d0bUpUQ01pdkJ3Qk80NFpRODdhNHZ6bXNJQ01FNEo5?=
 =?utf-8?B?OFJMVzhXbk5Za3FScnRUazUwUFVOajM5SUVKYVJOeDV2bG9hVy85aFp3ck0y?=
 =?utf-8?B?Tms3a0QzbS8xcVRrMC9LN1YrUmtpeUZ0cnd3cHM1OWREdGRXd2N1SDh2KzY0?=
 =?utf-8?B?NjhOWlJPRERLZkg3Q041TDRWcHpiRUdUeCtPeWFZUHlPNXhWalFudVh3QlFu?=
 =?utf-8?B?TDIzZWZZTjljY0VHSWhNNUwwVkNYaTF3c2wvMVBpMncyTVQ5SXl5TUJZVFAy?=
 =?utf-8?B?UExlZ2ZLbFBFR2VUSk0vdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnFiZnowWEdCZzBMOEphWVd3ZXRoKzFPd3VlMjZDNWUzSTJwdlpCSWNFMjQz?=
 =?utf-8?B?emlGY05jUnowMTVoOVpKZTNYYWY3Ri8wb1Z6SSsyQ2VMOUVtYVlkK0JjUHF1?=
 =?utf-8?B?WGdodHc3eXkrSlFFRFVXUklpbzhGNjNqWG5IRW5ZTDg4ODdUYUoxMkxzZnVX?=
 =?utf-8?B?MTJhZXNrMEtvYzFta1didkMwalo2TzN5Smx5OEIxYTd3dHBGenpuNnRoN1Ri?=
 =?utf-8?B?ZEN5R24zS0szdWNQNUNxSHh1am1WWk93ZThEdHlHeXIzaXkzMEhpSGg2bEV5?=
 =?utf-8?B?RGg3aXljMDdZL2pKM3IzL2taWHBlSkdzRFM2WVMxUmdWaGdCRVlCdUlSTVUx?=
 =?utf-8?B?YWtGcXN3VXhmSGk5bm1hS3EvMlMzRkpoOVZzMlhDK0VqYmUrZEdEQU1HRHBH?=
 =?utf-8?B?TGoyTzVLUG1mNGVZQWNwWCs1bHBIdUxZK2VaeVZGOHRoYjl2eW9rWmJ2OEVN?=
 =?utf-8?B?ZmhYUWJIQWNLdTFWY09JaUdZSHlVVDRNR0VUWTRUKytreWtsMUZadCtlVlQy?=
 =?utf-8?B?U1crZjZldjQwT0dDOCtLc2h6Tm9BbGx1OU1zUVk1dmM5am9LTWJicVFMd2Mv?=
 =?utf-8?B?U1FIZnJqNlQ4Z1FUbGxteVo2RXhzN1pRT0FZRzN6NndtcU5WMUQ4QWpOQXU1?=
 =?utf-8?B?S04xaTFVTURRZURSdENZY3dtenlWdzhxRng2SEsrUDVmeC9IQk50eWN1WlpN?=
 =?utf-8?B?cGZUUjB1UHJtbWVLSXRNZ2V1UHNFMU9GOFpuVXJTUXFtR09wQU1ZeE1sV2l3?=
 =?utf-8?B?OEJWa25oOGhkSGdCVlg5aWMxa083NG8wQTRaZmc1cVAxbjdaS1ZlSFdCR09X?=
 =?utf-8?B?SXhpZFdCbS94bEJvUTVzZTUxS0ZxOHBCRUJvc0VVdGl5akk0NHlFcDRkclhk?=
 =?utf-8?B?L3hLK3QrY1Y2dUx1N0VuaDlHaGt5dUVoVXpCRnZiRGR6QWdZU3BoK251NU5S?=
 =?utf-8?B?MmIrTWpaSTcvclZqTWRxTUN0K3hBTEI4SGovTUlhdk9qYWkyVmJkSVlleVI3?=
 =?utf-8?B?M2UvdGpMSS9hNngxNmtRZVZWSFZMWU8vZGFBV25Na3JuQnlVS1FTTDVHOWIy?=
 =?utf-8?B?SFFBSGQyRlQ0cUVjdDJQaTBOV1ZQci9iRzZTdDJkVVpKM25CelZDOFdIdjBK?=
 =?utf-8?B?a0F5UnhIUlRjNEpCS1VVaXpyR2QyMHc1ZnJaREwxZnVvTXlqc1hYNnZJQ3dW?=
 =?utf-8?B?VmFWak84QTlodCtNc2RSNXE4YkF0bnV3WGIvYjhlMndTU0dKZi9oTGZkaFpV?=
 =?utf-8?B?RlRqcC9RVWs5dDFielN1c0Y3b2ExNmlndC8vR0gzanF5V0ptWG0yeGZqV2FF?=
 =?utf-8?B?bmJPS2tSZkJnaVFUK1ZETmVLQlVybXpEaFV6TE1FOHc4TEpMVE4rbVQ4NDNr?=
 =?utf-8?B?SHZRMXN4MzlsSmprNUQvQmlIUWRZM21BdWhTN3pqd1hXTzZuQm90ajJMUlBJ?=
 =?utf-8?B?enpRUStML3UrdGtKcGdlZ2svSXhJN251UjYzUG15WHc4QUgwRmZ6cGJIeHVY?=
 =?utf-8?B?ZWFRS2RtTlJGTElBZE0rMndwRmt0ZnlJT2FYWXZQSXEyN1R1MVg0Q2tTR2tx?=
 =?utf-8?B?b0RCZU9sSmkwMDUvVjhvY0RvQ2J3aHBuVEFSSjNVYS9YYWdiVTE3cFVaZHdp?=
 =?utf-8?B?Yi9KNGJoemFvVXFncGtiYk5WcEZuRGQwL2o5Mm54N01HeS8yeGJWL1grVVdN?=
 =?utf-8?B?dWZTWDRnamZJZzNjazVwZ0NpTklWR0RUQVZOcm9KWXF3L244eEQ3R3ZubGU3?=
 =?utf-8?B?WlZPL2dwZ3gwTDlVV2NmS0g1SjAzSWVSeUJEYTF3dnAyclo3azhpWFJ1TmZl?=
 =?utf-8?B?NUJZdXBtbitxQVRzZURWSUh3ekg1em1XYjh4UjBoQkY1cks0SU1xQVgrcDR3?=
 =?utf-8?B?c1IwZ3k0T2dSOFU0cWJZa2dkL3FzQkp0M0lXRXo1Ri9ENEFjZndZa2t2VEZn?=
 =?utf-8?B?RjVhNFBqc20ycXZoRmxEbjFBUTZPVk5jK0ErOXBMSW9JY2dIb2JhbllQVWpQ?=
 =?utf-8?B?b0VESGlGbFlSb0lDREs4emZDeTV6TmxBTVlTa2l4cTdVK0lvQkxySldCVDVR?=
 =?utf-8?B?WDFwbThGMVhuU3g5NnlBbW14Qk5CQTYxcWxKTjhYQU5pK1Y0TGdiWTZoTTYz?=
 =?utf-8?B?NUk0dkNidW5TMUVRMUtPbXhYamU3MjhHOTZOQ01Ma0VBa2VvQTZSSm1pRWpi?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9dffad-f7b2-46d3-1695-08dcd1fb818e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 00:48:52.1104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPHnNgAbFZRVfssZ12c3XgP5Q+OPensGiGpQ77uyM5/kOABG2y1LGI+hYhQ4iRFCztSTJXsjvqO/RUSlzqddxj9NcISz7y2+r8hSzAoS4Y8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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


> +/**
> + * xe_guc_log_snapshot_capture - create a new snapshot copy the GuC log for later dumping
>   * @log: GuC log structure
> - * @p: the printer object to output to
> + * @atomic: is the call inside an atomic section of some kind?
> + *
> + * Return: pointer to a newly allocated snapshot object or null if out of memory. Caller is
> + * responsible for calling xe_guc_log_snapshot_free when done with the snapshot.
>   */
> -void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
> +struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic)
>  {
> +	struct xe_guc_log_snapshot *snapshot;
>  	struct xe_device *xe = log_to_xe(log);
> -	size_t size;
> -	void *copy;
> +	struct xe_guc *guc = log_to_guc(log);
> +	struct xe_gt *gt = log_to_gt(log);
> +	size_t remain;
> +	int i, err;
>  
>  	if (!log->bo) {
> -		drm_puts(p, "GuC log buffer not allocated");
> -		return;
> +		xe_gt_err(gt, "GuC log buffer not allocated\n");
> +		return NULL;
> +> +
> +	snapshot = xe_guc_log_snapshot_alloc(log, atomic);
> +	if (!snapshot) {
> +		xe_gt_err(gt, "GuC log snapshot not allocated\n");
> +		return NULL;
>  	}
It seems err is not yet set in this context. So it would be a random
stack value leaked? Or are there macros setting err I am not aware of here?
> #define xe_gt_err(_gt, _fmt, ...) \
> 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)

Suggest to zero the "int err;" allocation. Or set explicitly.

In general why is xe_gt_err used here over drm_puts? Is it a more
specific error handler in this context?


>  
> -	size = log->bo->size;
> +	remain = snapshot->size;
> +	for (i = 0; i < snapshot->num_chunks; i++) {
> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> +
> +		xe_map_memcpy_from(xe, snapshot->copy[i], &log->bo->vmap,
> +				   i * GUC_LOG_CHUNK_SIZE, size);Suggest cast i to size_t. Is the "i * GUC_LOG_CHUNK_SIZE" implicit
conversion fine?

> +		remain -= size;
> +	}
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err) {
> +		snapshot->stamp = ~0;
Is this a convention for timestamps when failed?


> +	drm_printf(p, "GuC firmware: %s\n", snapshot->path);
> +	drm_printf(p, "GuC version %u.%u.%u (wanted %u.%u.%u)\n",
> +		   snapshot->ver_found.major, snapshot->ver_found.minor, snapshot->ver_found.patch,
> +		   snapshot->ver_want.major, snapshot->ver_want.minor, snapshot->ver_want.patch);
Missing colon for "GuC version" print format string.


Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
