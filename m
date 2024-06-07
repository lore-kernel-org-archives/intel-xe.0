Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B983C27C5E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 02:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BFC10EB56;
	Fri,  7 Jun 2024 02:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1zIFKD9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604D710EB56
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 02:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717727191; x=1749263191;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sAaZYg8G03yof7zTIbVjO1CoFfH6/c7soRhScIYDNW4=;
 b=D1zIFKD9WbG0xUaexjDTsQufOBmEfxT8bZW1/kg1tgAhBJPPH/WhDHps
 SvFgVIhz6HSnDuIE+WaNwkIh4obv/NdqPmy2MstMewGMkIOZ0stxP+bhf
 2S66llBteJ4nOYc7AGdx6H6mJMncE045TOvO8suZFzIg96KMyphGBHOTO
 0AkLkDg6qwn6o8blDyR5xLO9nqEIjC1uaJahoRqbjZB+tHk1F/uso6Uh4
 L/06Y5FnYVFPwTRGvhhFRqeqJ0hg1t33AjF1F8jV7YUQD91bX9tWh5eVX
 8IYYAUIoR8fphbKrC2j38hvOv4GAkUXlnXE8j4oYHFKtUYIufP1VNe1z0 w==;
X-CSE-ConnectionGUID: AHJWwabTTQisaA0zes0nbQ==
X-CSE-MsgGUID: nIWTJW8MS9OPjmHT2sKlMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25061098"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="25061098"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 19:26:27 -0700
X-CSE-ConnectionGUID: 5906bjmnS56P/YYQ5pd1Xw==
X-CSE-MsgGUID: N3Xxw9ORRHWhBTCwmr6BKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38015156"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 19:26:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 19:26:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 19:26:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 19:26:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 19:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cweVD6CsSToVvXnkISEe6IxhlBjTFZibVTCzlU4CW3ztvdZMZb9No9l7N1fFh5TMmHu2IQ7tsf09t2RJYCO9dudMzgqkPShGE9BORxmn2Nym4sepYuQs4Mz91C83mf2D6PJ1MG1PPOup1QSkjzYh82QdQTaZhkflT/Vtk8c3d52ZB//CdQQpfzOIA1BD64/QC0H/F1bqOrbX5WS7nDBBHVVRujWadeese/ELiQYSgqkHQLlV9Vwa+9C+C4OBECS0z6ueOR113ASM9Q6f7GnH5AbFAOkoYRIOS6GYPtQVUXoKUU6rzruH958jsZ5RT4RvW6KfEjRYWQ4gwYhGVIgXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoQAFX1p9SBuI3foDw15m83rrgNcyNMXccGHduHre3A=;
 b=hOhiovECVJu1vSCC9eSkQ/hmdUwFGjxpsDg/rVE1ZX7MM7AxaU03eGQHpSWP+aqhEQ0bULHaIytQcg6p7nBTvcHtusI7F5V+1ri66kub9Uxe7aFqb0v1VGoE6Z2VedmB3uLzfutgZRZK6q5uzp1OplbDUvq/dQ44QZufxchwc2p2Y8h366Ixe4idKPdSuKFF7CCpd8On8FbBQJ4Ts9+thOFqkPd5eAbCmfHdCOSZl81SWvJujp2oBbt6m8n6R6Dbj4L6Mrd38Bd8wjQyFfIwEwc+eAN/noNq157CxnmRyAKg8G2V9A2Et6A5PCJTjvwhgP/8Lu759+0uloDg2GhyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 02:25:59 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%3]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 02:25:59 +0000
Message-ID: <fba4303f-4c63-45d2-a932-f4681ba5ccbb@intel.com>
Date: Thu, 6 Jun 2024 19:25:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Rework GPU page fault handling
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240607015212.2190106-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240607015212.2190106-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7454d6-c7b1-48d9-0fd8-08dc86992ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0FIN2pPcGRBSDVYdGhPdUh4cDhSK0xFVmN6T2RKaWtUeDNLc0dpWE1BSGVL?=
 =?utf-8?B?ZkZJMXNTRTFaRGpIZHZGU05GYms3RWtMS0kxUVVHeWRpTzZTUnM4NWZ2NW9z?=
 =?utf-8?B?dXlwamcyNGdEbHR5VTc1NmF5aWVwcVJSbGlDeFBGQ2RDZng2UTV1dHJLWUJE?=
 =?utf-8?B?L1ZJZnMzWGZ3V3lieHRJd3RkSUdwaTkxc3ZxWjNZaTRBaG5aelNkWFZnYXhF?=
 =?utf-8?B?VVlvUGc5K2lubUNnendTOXB5NGU1OFVsbCtRbzVHbC9PWDBEeVUvTjRKcFda?=
 =?utf-8?B?MUdVd1BVZ2grTHZjajdON0NqWHZYcUx2ZUFYNEZRWjFzY2RnMnJ0UnJBdzVY?=
 =?utf-8?B?aUdLNHJzSEpXK1VTclRGczJwSGZDMXlET2lYR0dUUTFoSEFRSVdVUHJNVjNx?=
 =?utf-8?B?NUhNeUxiS2dhVzhqaEFCSFVWc0l0OEVGTG9KcjE1WVVqK3p5QTFlQ3hreWtk?=
 =?utf-8?B?QktKUFRhMnRydG1EMDYvdFlTN2NmK0FsRGlISlhvNTUwbmFVNEIyZGxtakhi?=
 =?utf-8?B?d3dLWS93TkNNNWhrUUgva1EyWk1LRml4ZHhRalFXbUgvS1FQTVFncDlxQmtW?=
 =?utf-8?B?VTZCSjJyVnZ0Skp1QUNvUTJBKzk0SzUyWmVmN0N3eWxwMjJleFJPYVVqMlc1?=
 =?utf-8?B?M0dVbWxDUzRNcWVJVUVEUmNxY2hjbUV3SVFMank4djZ6c05ReFlxMTBPZ2xy?=
 =?utf-8?B?dGJ0OUhTMkRwdUUvanNBVUtkUXB1Y1pXaEdTYThqV2k0b2MzTU9ZZTA5Z2xu?=
 =?utf-8?B?UVdmYyt0S2V0NTltMmZGNWtId0dEVGtuQm1xdjB6c0VuVDBFbFk0MHlYU04z?=
 =?utf-8?B?MGlzblVaRjgyeFRSMUd5TXRRdDdwQWRTZUJjcWpiN1dUa0MzWlhCTTBEekNs?=
 =?utf-8?B?R2svTC8rdGNacUd5TU1BRkEwQXZyMkVtcE9ZdTBTMTlZZWN4S04rUHp1NERh?=
 =?utf-8?B?Qm9RZWc0WWFkbm9nUDVqS3lVYUNrZDUwNXFCc0M1VTBlZW1rU2xDN1NoWEVw?=
 =?utf-8?B?bnpZd0t4Z2YwTFJPUmpwTVBlV1JJR2M1dUJSWFRnSklHZk1OOC9SUEtmeStm?=
 =?utf-8?B?QlQ3aVJ0MUl5d2x5UGI0ZEczbkQrSWJWbUJOTUJLZXRGWWs2MGR6Wno0T1Iz?=
 =?utf-8?B?NVVobEd4TTA2Q2RxekZuVFhhbjMzWXhkVWtKUmVPenYzUzNmUzJLL28zYVNF?=
 =?utf-8?B?bTAwV09QYjkyVnhxZmcrTkV4bllnOXpaWUJCVEtFSlR5NUdiOEJYMFNCTmdF?=
 =?utf-8?B?b1lBNXU5Z05wZVQ0c0hJVEtmMVJOelVKY3QzcnpkOTVMaWZHOGlOanZaMXN2?=
 =?utf-8?B?SnVPSW5qVUFaeklZbld5U2tBWnpoUjU4c2xUSXQzeXo4cGY1NmRiSlpjR3BR?=
 =?utf-8?B?NWlVMVpYeGpjb1I0TzFuWWdVemhkTEo2a01IV0xzbDFGVmdyOFdFQkFyNlFF?=
 =?utf-8?B?TFRQcm1ab1I4eGthNFI0N2lvdGJLamU2QkgrREk1U0w2enVXVld0SmVFSUtY?=
 =?utf-8?B?bVYydHJJb1c4RXAycHJoYnhtUUxSazlvRTBEM1lIcXpRVU9JcUpRNXQycmQz?=
 =?utf-8?B?d1hsTHl3T1N2ZDVQY2lxbk1HVGdrOWplVGZZTmZsMmhLeE5WMDNnQkMzNE9Q?=
 =?utf-8?B?dHF1dUhnQmFNalpuK25aNkw1Y1FtcDBCQTdMZzhtNlNvdjVxNjczTzNhMVJx?=
 =?utf-8?B?WmlMVnUxWm9VSnVyMGRzcTVueGg2cHpmdjFGTGI1Wng0dkZuSVZRbE5XemdF?=
 =?utf-8?Q?Ylw+q0ew5bOf7KCHlg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUJmQlQrWjJPWndxVE43MTdoVHlWeEtib0dMVUl6WnVISHc4U2xaVnI2cWdK?=
 =?utf-8?B?ZTRaOGVVejY1aE85Mm40TXVxdWRLbmZzU29BSDlHaUVZZjd3azYzWFZmMjRv?=
 =?utf-8?B?YWR1SEFDeVNBVTR0M2xDU0JMQmRzbnJzSlRFUmpmbTdSTFBRSzltd2d4dU83?=
 =?utf-8?B?WlpGTW80N3VkK2NSM1diWUpYMUFHeXQzUXBTdG04eDBqN1FtdzZqVmpzQVhy?=
 =?utf-8?B?WUFRd2NCZnp4bElSbjB6bDVVYWgwZkx0bkN3MG5nMXcxNU05bERGNFlGZC8z?=
 =?utf-8?B?bzhFVFlaK0EwaHd2QVZLR1U1Rk1PNzcrTnlDYmNiOW1WQndHMnRLSCtiOFpy?=
 =?utf-8?B?bzZINFZzQnVNWTBSc3VQd29pem1lcFpoSUhZQWhReTB4OWNjYS8rL1RkVk5t?=
 =?utf-8?B?SnNIcnU1aGZ5d3dseG1WQjF1RXA0TXgwdm9DclRNdFlzWUdLazQ4WmNEcjVw?=
 =?utf-8?B?VFlTVWpnRCtONU5hbEU5MkNDM3NBUkNaMGg1WFhwVERyRkhhdmlFTkNaaDRW?=
 =?utf-8?B?UUt6SWdzTU9wb0w0TjU4Z0ZFUlFVdHp5cUFYRW9qZnU1TEw4RTdkaWZjTFVS?=
 =?utf-8?B?bndIQWZSQzVkeGFXY0M4b1lkNmZ1TnNuNUdwOWRtTEV0S0E0QVI3eTdCbDRr?=
 =?utf-8?B?bzBGcVhudFNUbDZhNFNXOEl1dzlkNnR1MWtJeUhSYTZScUE0RGIrL2IvR3Bz?=
 =?utf-8?B?RlArUnhCQ0hXZWNLL2djalFFZTFMUDIyMVFHdDdhODVxclVVTVgrdU9KaWF4?=
 =?utf-8?B?cHJXTjRpeVhhVkxoTGZMQlRSVW1mNDdtNzg1b3Fpa0EyWmY2eGJHZ3dSdXhM?=
 =?utf-8?B?aW1RR1NvdzF6M1o2dDlUczY0WWM3NmZwT2tmUE5yQ29mNjZkaFJhT1VmVmNF?=
 =?utf-8?B?bDJiY0RJWXR1M21vZnFwSU83bzZMd0p6QnE4M012aytrMkVPTDd1cnFoZ3JQ?=
 =?utf-8?B?V1p1YTRLTEFxZW9KZ2tLVHFCcmdSVm0zL05OQk1jcFdGS0h2L0RPVm9ZNXds?=
 =?utf-8?B?WTFBOWN3MmlBcHhna1ZCU3VIYldSYU5jL01aOG9hdnp2TmtsdzBaMjlwaGFS?=
 =?utf-8?B?bWIrSVdYSFN4MXBGUjVNRy9jY0VCY3BPWllBeFRxditrb3ZvRHV1Yk5VVEdH?=
 =?utf-8?B?RVN3aGhGVVlMbjRlWmdXbEhLdGpyUzNWbEJLRTRSN09LU042dXpiTmYybnhU?=
 =?utf-8?B?akVTZ3ViVCtFWjkxUTZob1lsT01lVnF4aEVPTFZ6dnlCdEtIUEw2SUhLaVRW?=
 =?utf-8?B?WWQwYklWZjNPYUN1aWkwbUpRUnNua3dtWkVmS3B4NWFEdmRhbDVYSk9TRXFk?=
 =?utf-8?B?WUpDZDF3M21qaURtZU8rSVBxKzhjOFIvVWtndmJlZE5nVXZSUnUyYVg3aEtv?=
 =?utf-8?B?dElMYWcrbE1FZU9ZbWxaNUE5bGk2MjRNVUNqWWs2S2hWUENRa1NTb3RLb05t?=
 =?utf-8?B?TkEvRFhQamNRU01vODhuNXBVVkN6WiszY3NneFQxVjlIOXhuTDVVdkZtdkQ0?=
 =?utf-8?B?c2xzdytONjNiZkIzc0JISXMySjVQT0wzTlozTGtTT0ZaWVA4SlRPTE1DTUk2?=
 =?utf-8?B?c1lQL2s5ZjJnZnNIcnVpUnplWW51TjFoT2RVVnlLanJVbnA3bkxhN05FT1VZ?=
 =?utf-8?B?YnBETnZ1bUpnY0pxUjFvRzNQTlNBejdZU0UxMU1RQUxzVVlkRitTOFplSGEx?=
 =?utf-8?B?bFk5STVzcjQ0cUpyRWZJUVJWcmMyenNHem5hV20yMnorMllqVk4xc0RKWVRx?=
 =?utf-8?B?M0dWNDVGR1NyUytyYU93eElmc1Jla3hITFk4NWp1bG9WTlNJNXFpMm04eUZm?=
 =?utf-8?B?ekRNRjVhZjNsd1hBcjNyYnVQcHIvODd2R2ZHVVBHcitRTWxrS3JDOGJEbm5D?=
 =?utf-8?B?N01lcmJZWDBVZHc4NzlDZlYvSG1pdHBROG91dUd4a2dLU3JvdXpGeG81YUln?=
 =?utf-8?B?Tm1Xc0l0djJJb2hBYUNYQXVHMHFFMitxUlJoYmZRQ0xOSjlNU1oyMktta3di?=
 =?utf-8?B?cEhBUXBmR1lrRkdqSHYzd3JrazA5elFtTnF5Sm4wZ0RrZmdETkxLWTJrdUFz?=
 =?utf-8?B?N2RHSGVmd21oOE5xeXgwRG5YWVBTNElMUlBFLzhGODlTSzFwRy9ycW9GSW5u?=
 =?utf-8?B?ZWFVRC9IRkxWYjRBYngyWXlXcVc3djVOYjhOQUtCUEZRcU10L2tsRXYyai9u?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7454d6-c7b1-48d9-0fd8-08dc86992ade
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 02:25:58.8566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 829V0Ql0Ey5JriEs8bVlKbYMHnT4UjYs6fhEcQBdfyaCyYsxA1Y1pLKG9Pyt+mc6S7hs3ja34mYzIx4qW5Mo4X4O1Qg0vZHfxhCjQe8Me7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
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


On 6/6/2024 6:52 PM, Matthew Brost wrote:
> Add helper function to implement VMA (user binding) page faults, remove
> unnecessary userptr.invalidate_link list del operation, retry on memory
> pressure, remove unnecessary xe_vma_userptr_check_repin after rebinding,
> remove unnecessary TLB invalidation, and always use vm->lock in write
> mode. Changes help facilitate SVM page faults.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 142 ++++++++++++---------------
>   1 file changed, 62 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 040dd142c49c..eaf68f0135c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -125,126 +125,108 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>   	return 0;
>   }
>   
> -static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> +static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
> +				struct xe_vma *vma)
>   {
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	struct drm_exec exec;
> -	struct xe_vm *vm;
> -	struct xe_vma *vma = NULL;
>   	struct dma_fence *fence;
> -	bool write_locked;
> -	int ret = 0;
> +	ktime_t end = 0;
> +	int err;
>   	bool atomic;
>   
> -	/* SW isn't expected to handle TRTT faults */
> -	if (pf->trva_fault)
> -		return -EFAULT;
> -
> -	/* ASID to VM */
> -	mutex_lock(&xe->usm.lock);
> -	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
> -	if (vm && xe_vm_in_fault_mode(vm))
> -		xe_vm_get(vm);
> -	else
> -		vm = NULL;
> -	mutex_unlock(&xe->usm.lock);
> -	if (!vm)
> -		return -EINVAL;
> -
> -retry_userptr:
> -	/*
> -	 * TODO: Avoid exclusive lock if VM doesn't have userptrs, or
> -	 * start out read-locked?
> -	 */
> -	down_write(&vm->lock);
> -	write_locked = true;
> -	vma = lookup_vma(vm, pf->page_addr);
> -	if (!vma) {
> -		ret = -EINVAL;
> -		goto unlock_vm;
> -	}
> -
> -	if (!xe_vma_is_userptr(vma) ||
> -	    !xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> -		downgrade_write(&vm->lock);
> -		write_locked = false;
> -	}
> -
>   	trace_xe_vma_pagefault(vma);
> -
>   	atomic = access_is_atomic(pf->access_type);
>   
>   	/* Check if VMA is valid */
>   	if (vma_is_valid(tile, vma) && !atomic)
> -		goto unlock_vm;
> -
> -	/* TODO: Validate fault */
> +		return 0;
>   
> -	if (xe_vma_is_userptr(vma) && write_locked) {
> +retry_userptr:
> +	if (xe_vma_is_userptr(vma) &&
> +	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>   		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>   
> -		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&uvma->userptr.invalidate_link);
> -		spin_unlock(&vm->userptr.invalidated_lock);
> -
> -		ret = xe_vma_userptr_pin_pages(uvma);
> -		if (ret)
> -			goto unlock_vm;
> -
> -		downgrade_write(&vm->lock);
> -		write_locked = false;
> +		err = xe_vma_userptr_pin_pages(uvma);
> +		if (err)
> +			return err;
>   	}
>   
>   	/* Lock VM and BOs dma-resv */
>   	drm_exec_init(&exec, 0, 0);
>   	drm_exec_until_all_locked(&exec) {
> -		ret = xe_pf_begin(&exec, vma, atomic, tile->id);
> +		err = xe_pf_begin(&exec, vma, atomic, tile->id);
>   		drm_exec_retry_on_contention(&exec);
> -		if (ret)
> +		if (xe_vm_validate_should_retry(&exec, err, &end))
> +			err = -EAGAIN;
> +		if (err)
>   			goto unlock_dma_resv;
>   
>   		/* Bind VMA only to the GT that has faulted */
>   		trace_xe_vma_pf_bind(vma);
>   		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
>   		if (IS_ERR(fence)) {
> -			ret = PTR_ERR(fence);
> +			err = PTR_ERR(fence);
> +			if (xe_vm_validate_should_retry(&exec, err, &end))
> +				err = -EAGAIN;
>   			goto unlock_dma_resv;
>   		}
>   	}
>   
> -	/*
> -	 * XXX: Should we drop the lock before waiting? This only helps if doing
> -	 * GPU binds which is currently only done if we have to wait for more
> -	 * than 10ms on a move.
> -	 */
>   	dma_fence_wait(fence, false);
>   	dma_fence_put(fence);
> -
> -	if (xe_vma_is_userptr(vma))
> -		ret = xe_vma_userptr_check_repin(to_userptr_vma(vma));
>   	vma->tile_invalidated &= ~BIT(tile->id);
>   
>   unlock_dma_resv:
>   	drm_exec_fini(&exec);
> -unlock_vm:
> -	if (!ret)
> -		vm->usm.last_fault_vma = vma;
> -	if (write_locked)
> -		up_write(&vm->lock);
> -	else
> -		up_read(&vm->lock);
> -	if (ret == -EAGAIN)
> +	if (err == -EAGAIN)
>   		goto retry_userptr;
>   
> -	if (!ret) {
> -		ret = xe_gt_tlb_invalidation_vma(gt, NULL, vma);
> -		if (ret >= 0)
> -			ret = 0;
> +	return err;
> +}
> +
> +static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_vm *vm;
> +	struct xe_vma *vma = NULL;
> +	int err;
> +
> +	/* SW isn't expected to handle TRTT faults */
> +	if (pf->trva_fault)
> +		return -EFAULT;
> +
> +	/* ASID to VM */
> +	mutex_lock(&xe->usm.lock);
> +	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
> +	if (vm && xe_vm_in_fault_mode(vm))
> +		xe_vm_get(vm);
> +	else
> +		vm = NULL;
> +	mutex_unlock(&xe->usm.lock);
> +	if (!vm)
> +		return -EINVAL;
> +
> +	/*
> +	 * TODO: Change to read lock? Using write lock for simplicity.
> +	 */
> +	down_write(&vm->lock);
> +	vma = lookup_vma(vm, pf->page_addr);
> +	if (!vma) {
> +		err = -EINVAL;
> +		goto unlock_vm;
>   	}
> +
> +	err = handle_vma_pagefault(tile, pf, vma);
> +
> +unlock_vm:
> +	if (!err)
> +		vm->usm.last_fault_vma = vma;
> +	up_write(&vm->lock);
>   	xe_vm_put(vm);
>   
> -	return ret;
> +	return err;
>   }
>   
>   static int send_pagefault_reply(struct xe_guc *guc,
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
