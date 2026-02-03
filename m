Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F9AE7FDE0
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 00:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7D410E4AF;
	Tue,  3 Feb 2026 00:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnjjF3c1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4876910E4AF
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 00:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770077823; x=1801613823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mq4Fn2xt0NMy8NoVG91xxhH40Q19dpJLzBiSfColXDo=;
 b=hnjjF3c13aTjLETIOCoD2pyhWpRJ+7UtC0YyFqE8SSRPNDfczcH7ZHDC
 ggpgGZ6MaJbNvHft0Nv2Y/AeNePCYqJRNuontLFhZUScr1gvIeYpN8DsB
 ibSNDLnnqRUJTh7ZdF5QhTR59Kpem4rlW7OtRyhQgfM/ysjxutLTbw5Pp
 QY7D3RXgvZKPHlsMfHkAZNhb31rYhiKHAHeKPxVJl4HmaW0397mcKjS9g
 dgZ+Dc9wcXaHRzHvRqz9LQZHB0KrXfFfD6dYkv81/XNidjPz4r2ISW8QF
 OMOjk/I020DzqjYvcuu4vHnURgtXvYUr4wLCFAETl+hPDgsnsWreQngTq g==;
X-CSE-ConnectionGUID: WqXi+NuhRXqsKVUjB1Xk2A==
X-CSE-MsgGUID: TUuGkdcdQDWxxfYD3TmBjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88819831"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="88819831"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:16:56 -0800
X-CSE-ConnectionGUID: k9hKlZn5R/KJLdd7MNttcg==
X-CSE-MsgGUID: AZeeUMgvR2CV2MI+NA5KvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209888602"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:16:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 16:16:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 16:16:55 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 16:16:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t06HiFi8vlxpB1XyZofc0NwFN+n02k5C7Ispm7SFTm1vLbu1/8kYgnis061bYQZ9v/tbs6EPGBuyxGFPZLjxfmfoOIIqUUxnvyLdWLlL2Qh6Cm+uuYUHvg4Uy+e0oa3rKJjbtJMeO+BZqaRZq478mhEvPDdInUZOXoxdDIg7vC1RUqCmE/v97WdcB8yTiW5YMsSW9Lqu71MQUStHIu5uGebsXa9hgPGCh6YvQ21bEy6s1zbrW9KhwONeHbYF2mw79VSwX8d/Ei4N7snj+CQZnelmj9hhyWlLtM1el0Qq3HPbf0wAw0AyWMAT3fCP8L7wkpvchGIQoO59/akqzJWgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI9UT9dr3bXW/vWDs/vGqfSiIIzCUYn53doMFTvj/iU=;
 b=WQ9XRJi4brpRB2pZ5MGdXqiHU8vZntUHgH/DIxBCNXfdtxDw1ndUypfGtgC4+6Fa1t3g4f0mubawoBgxWRPkN5FjvN+NvjHklSDCYseeNl5Xn3N8RflSv4uUKy5LrILfiz156wEpOj/tlp3czjWjrpahOQ2exJPcerNzHeoZs4qe+qGi0CUgSew20/brb+Zsx/wSdB5QzYeNCs4m4GKBfyJOkiiFZOs2qsMat4nMxZT/nAy4S2TGfC+vTDgK0DFbBN/nHO4S1m+yeaXSx3oSS/6wpgGcEP7tcYrducu1pdHMb7xOxk7AeaSNMCMga3iuNvwENX+jOwnzbweH0KNGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:16:48 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::b808:ac79:43bf:d3bf%6]) with mapi id 15.20.9564.014; Tue, 3 Feb 2026
 00:16:48 +0000
Date: Mon, 2 Feb 2026 16:16:44 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe2lpg: Extend Wa_18041344222 to graphics IP
 20.04
Message-ID: <aYE-bPdOqtNpx0uJ@intel.com>
References: <ddcfcd0631ccc39a84d63e1760cce672dcc7f097.1769499842.git.harish.chegondi@intel.com>
 <20260127205004.GA2174980@mdroper-desk1.amr.corp.intel.com>
 <aXv_7mzwHdpYVGY0@intel.com>
 <20260130182814.GB458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260130182814.GB458797@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::21) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SN7PR11MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9d303a-216e-4f18-614d-08de62b985a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUFjRWdLVzdpLy9hSWxyZm52THNRbDM3Q3Rhb3Zja3V5OGREa2tEMEJMc1V3?=
 =?utf-8?B?QXJFSEpCMjlRL0FRQnc3dmdMTGsvK3M4RUw4WUZ2di9PMjVpZDNpREUvQmFR?=
 =?utf-8?B?cmZIQ1B1Ymo1N0xZeE9kTm5wWHVJL3F6WCtldVFOaERqcDRGUDAxckNmMG5Z?=
 =?utf-8?B?MTFkWGJJQjFPTTcwY1cxY1Bud3lyVkhGTFpydVF3UmhubU13bVBzQUxvSEg3?=
 =?utf-8?B?b3RnQTdBUWk3VE0zS0FKZjJ0QzQxZ1dJclhHTEs0ZkdpNlgyR2g4T244M0RR?=
 =?utf-8?B?NkkraldyZ1RFZ2NpcXNER0lHWXFpWjJBZHFMUzdOZlhKVXZoZTVYN1NVV2lW?=
 =?utf-8?B?R2ZpWHRoT2RFWklJK1E5aERLTElXTkdJaDIreVJZaThhQTVFdlE2cnFaMnFk?=
 =?utf-8?B?Y2RwUitsdEJURExnTFlWWHkwNzFvbmJQa0xhcmMxQkdSTWN1RFJteDVPQStq?=
 =?utf-8?B?WEJXZlVyK0pxS0VXS3dxekVVQWdEVTlTbDQxT0QxTjJOSXVVQUN6czZ4RHBn?=
 =?utf-8?B?R051Q3VxVlJrWFdXNWdyMDlnSVY1dTBMTnpLbXd2Zm1uSlo1RzRLTldkdFV0?=
 =?utf-8?B?eVA2NjM1ZHIxMnFFNlNObXB3QzczbnhmMDd5eEwwcTZKU0NuM0FjUnF5N2Y1?=
 =?utf-8?B?MkR3ZzZuREtVcUh3WVRvL3ozUFgxSmd5U25VTkRBSHBvVTlybk00WGNjemFL?=
 =?utf-8?B?a3hhQU5ZTnlPc2JObUxtT2VIUS9TWDd6bWVGR1Rad1NZbzZMb01ZRDIxWFFI?=
 =?utf-8?B?cHRpUEZSRWhxWDZieTYvTkNCTlBWazRFQlcvSTBabkdpQ0hueFN4SUxxZ1lE?=
 =?utf-8?B?V0Zjek1qYUlpT1BtRy9XOWRMNXYxYUhmbmc4Ny9qWTVrSStrVFBycm4xSTRq?=
 =?utf-8?B?eFgrWE9UbFgvdTBlOVhwdFBNWkpNb3lPN3J6RjgvL0RwS2JnOWZGM1dlRy9P?=
 =?utf-8?B?clJyczJIbGhWL3pUNzhkaUV2bjBmRis1WGlWZCt4NEVtT04zcWl1NEsrTHBD?=
 =?utf-8?B?bWF1b3A4SVUwbVRDS09IMjkrNVNYdXhRZUFHMEFmejB4NzhrVElzR3Z0YnBy?=
 =?utf-8?B?cUhabHMwdmtlTVNFcDJKQktzbG1rSGtodXVjRHdpVHgvQnRzZS8wN3RBLzYv?=
 =?utf-8?B?TnY2Z2N3ZUFXNUtLZEhobWFONzZBZ3IrREltWldyOVlOdWJjQ0ZGQUhhNXNO?=
 =?utf-8?B?S3dvM3Y2bWRSUGl5ZXRWNFUxT3hzQkhHL0FUUHpnR2dPL0ZTS0tDRjQ1ZGxI?=
 =?utf-8?B?c3lISFlDSnVpeVdsVUhVd0lxWWppaW1GeVRNVDFKZi9SQlBFL0gxYjlNUTJE?=
 =?utf-8?B?T2R1SkFlK2RqZTVFVkxaZWh0ZDlUTnJHUUVjbHcwcFVPTjJSeFNXNGNoM2Uw?=
 =?utf-8?B?Nkt5V1I4VVpaYytIMzhETWdxeW1EMThjY2VDdmxSQmpPN09vZTVxcmxGRHVT?=
 =?utf-8?B?SEtHYlI0QWxZcHlyVEVRV2F5b2dKR1NHQTMvN0cxTXpESTZHcUZsMGMwdEhD?=
 =?utf-8?B?ZWpsK3BESmJYbFFWdHdvV3JDdUpFN25SbUphdWNCZEdlYXFEa0J3V2dTMzVj?=
 =?utf-8?B?RTkwS0xZOG1iWHd2M3NMNGJvdytVU0NoMTRoTkZRc0ZyOUJiWVE1a2pWb2lS?=
 =?utf-8?B?UFdjRlBBQlg0d0NRdjdZQ21JTXFBYXprU1A1dEEyQTQ2ZlA1cUszZDNHWmVH?=
 =?utf-8?B?WkFyYkJxWDB5aEVXYkExNTRuMGs2WU8rK3BvbE4yUGRsL0FwS1NHR0VpcUxn?=
 =?utf-8?B?YXMzaW4vOGtCNDhtVTNIRkpTbGZIVzNxMXA1ZmhrbkgyVlAzc0VoNVlFczR3?=
 =?utf-8?B?cVJqK2xWUkw2MWhCSzU5bTQxaXJYTlE2VUxTc05qNnczRVBrVjVmNmVpbmxk?=
 =?utf-8?B?ME9CRTV0SmJVeW1UWi90c2ZKOVFBVGI4ZzJTODZjVjhaSzZzY0Z2TzFyUjNP?=
 =?utf-8?B?aXpNako5Z2NUby9LakZFSHJZeEg3Qi84ZFNtUzV0UlNCUXhMNU1RVldsTHBs?=
 =?utf-8?B?TUpmYnFXK2JXRUlSZ0dPM0swOGpjM2dJcEZ6dWZ1WnRMV2FmQURSb2xYU1d3?=
 =?utf-8?Q?Wx/Ij1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmpjSWpSa3NqT1c1M1A3RVJyd3ovOENBUmx3b1NaWnpKckRPR3ZpKzZRN0pF?=
 =?utf-8?B?UDNsbnZjQjZWQ1VieDRuQktNdkZQbWtPZkNaa1JtZ2N1UThpUDNXVWZ4K212?=
 =?utf-8?B?L2xZSUhHZTdnT0ZNY0xxUG9qcGZ3RTFid2ZZQSs3UnEvZUV6T3JiQmVhRloy?=
 =?utf-8?B?SGJKaXI5RmxWM2N1RFBtVlpKbnhySmFtVHhzWjcrb3U3VkhlNHV4aGtxaTRi?=
 =?utf-8?B?Wlcxa2V0eXowSVhDcnYrK0VMTm9VQmg0MHpESHFIY1dwY2Vobml6REZHSEI3?=
 =?utf-8?B?L21OUTYyY2M1d2YyMDA4bzRWb3ptUEZUbU1WdGkrZW9Xc0djaTNwZkpBbVJW?=
 =?utf-8?B?RTFpYTEvWFVuajFJeXZVUWxtVC9yV0JNbDhvQVY2TGVaRCtJbHFZSEhFWTZU?=
 =?utf-8?B?YmVyaVJUYnFOZE9vVzhJaDl3akQ0Y3pYNTl4cWp3S01mS1pGL3p1Uk1adm9D?=
 =?utf-8?B?RjlQenIwSU12OFY5MEtHOU5UU2Z0L1hQMGZkNHYrZHhsNkpjakxDeEJtWW9m?=
 =?utf-8?B?SHNpZ3p1QndOVml3V1FidG5KS2NrOCtMOEdScHZIK2RQbEJid1BmbDV6NWtW?=
 =?utf-8?B?Y0lzYUVhczcvS1BTdHd1Vktyd2VtK3VPN2VOOUlINnY0NnhsSEN1YjBTM0pT?=
 =?utf-8?B?Q0NXNWlWQ3dTK1JzVjV4d0RGZlNHUGMvUWdvRXpYY3dqbVBLVTJnV3U3VWQ5?=
 =?utf-8?B?M3JaYTRnYWt5V1c2VU4vcWdSSVJwd3RzL1BpM2tFSjJadUdSNVdHV0ozVGxH?=
 =?utf-8?B?UnM0aUo5SWxQTzJFYkVZYjJpeGhQUmtHdU5MbFVBTEkrTEE0emVYclZHV3pR?=
 =?utf-8?B?U1B2VHVLb2ZHcmUyNmN0NndOVzZBZUk4c0Y1U21RVXUxekJvbzFsNlFraXlP?=
 =?utf-8?B?a2xNeWZlSFViZWtZRDRxcUgrTWRHSUxEU0dZWStXNGhGT2xVRUNQSm1sZjlt?=
 =?utf-8?B?c2N0amRna3hpand0VkxEdVl6a0ZNQ1pWQ0tCdVVySzBDTTYveHVKWjR1NEdC?=
 =?utf-8?B?SmNLaEpZcUQzSW15d1Nhd05qUG9xQ2NMK3l2S1dTeHprOGF1SS9rVWtWNjhn?=
 =?utf-8?B?eUNvTGNBaCt5RnlaMGtERVphV2w1S1dac3FPOVhPV0srZytSQk1xRDM3cW5a?=
 =?utf-8?B?d2YyZXczQVgyOUZLTFJnSVd3dkd2Q1crb1crRzVLNC9zMW93WXppZWx5cmZZ?=
 =?utf-8?B?aGxYMUYrSWhmSk9pN1ArdFRxcmx5K1BXVlJZb3p0dGQrVFBZYWU0elhTVGxE?=
 =?utf-8?B?a01EbElCbEhtYjBBUHFpUm5ZRlExbG5NODFJOHJhbnJESDVQZVcrM1VqN0Zw?=
 =?utf-8?B?WE4rb1hZVE9FTmhlYVY0Zlpuc1VReW43L1ZHenNxcmpVZWRObXdWM25aMDE0?=
 =?utf-8?B?NG9HK0ZCd0VjM3A3L1M1S2JBTnJvcXF1R3dIcFpHYjNJSTM1R2pXa3ozblo3?=
 =?utf-8?B?a0R3ald1Q1dXU200QWpzYTFJSXc2ekZMTUo5TG9iQmlxWGZJZkkyWDJrRG5l?=
 =?utf-8?B?WHY2TEgvamVEUDZPQ2R3QjRPSit0NDhkV0JqQW55cVk0TTFMQy9Ic2o3QmpQ?=
 =?utf-8?B?bG9tMnlZdTlpVkk3TXhtaVc4MGR4OWZ2akxVUFAzSDNEd1lma0lWeVVXdDlS?=
 =?utf-8?B?S1FyMG9jWmp6Y3hlekNSeG1PTllpbnNwYlRoeWk0dktUMDd6dDBreVVxanhU?=
 =?utf-8?B?UE5RQThDdC96eDFLSlptdjRtOXRKMHhMV0hPSFpJWkM5bzNPU0xjT1JPcG9i?=
 =?utf-8?B?d0pmblV6RjA4enhBK0xEQnY0TVFaRU9wMWg0VzNDYjFBSS9BRzdiaXJFVlNt?=
 =?utf-8?B?aCttdUdvS3NGV0F4SCtmZWhBb1JQbXg1NmRmOFVNZ29xUmtnaXhULytLK3l6?=
 =?utf-8?B?YldLMXk5cVExRldFM1NnMjQ0cUdpNnBkWkF4a1dQbVRqYmJCZmM3NVpGZ0hT?=
 =?utf-8?B?YkF6K0MyLzZZM2Q0R1JGaDBoNExvZ3lrNU9KVGUyQldoRlhjRjdjWXpYaGlh?=
 =?utf-8?B?bDJFQjFqd3VSanh6dWpTZDFtUWVEQ0tkelVTaHpxN0VlOTNCaVl5NldsZGxN?=
 =?utf-8?B?UVFIcnhZcG85L1JySmt5MndpeXN2cDhNZkQxRTFnQnliQTlRTWJCTERIM21o?=
 =?utf-8?B?L3FhM1dnTjVqZHU3WHVsL0dkZEtLdUg2OXFycS9IVHErZG5LbWRKZEJzclAy?=
 =?utf-8?B?RmlWK091MVFJUkQwVEtIQitQeGNGbVlnYUUxTGpPK1dGVmdiZUROL1ZIeDdx?=
 =?utf-8?B?U3AraDI4UmlzaEl1dUNWTjYveHR2S1FyQzF3QitKRElaZ2VLQnFmL1BTL2dG?=
 =?utf-8?B?VkRIU3kxVUUrWGdIdVRkTGZEV0p0Rk9LYXdtR2wvTm5GOUNMSTVQUmlHVEZT?=
 =?utf-8?Q?l5MU6h/tjfbEn8dg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9d303a-216e-4f18-614d-08de62b985a0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:16:48.5299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JehNYGG0iqBWe/fePi4GQoQmY8nmPdEEb+ibrnFY4IPV13pBOJPbA97uuJ1toGhZEMUmA/y9J21dRSCPGzJ+XJ4Z+Hjn36PwOmrPz/B56ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
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

On Fri, Jan 30, 2026 at 10:28:14AM -0800, Matt Roper wrote:
> On Thu, Jan 29, 2026 at 04:48:46PM -0800, Harish Chegondi wrote:
> > On Tue, Jan 27, 2026 at 12:50:04PM -0800, Matt Roper wrote:
> > > On Mon, Jan 26, 2026 at 11:49:50PM -0800, Harish Chegondi wrote:
> > > > Apply WA 18041344222 to Xe2 LPG graphics IP version 20.04 too.
> > > > 
> > > > Bspec: 56024
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_wa.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > > index a991ee2b8781..1153a7363cff 100644
> > > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > > @@ -535,6 +535,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> > > >  		       FUNC(xe_rtp_match_first_render_or_compute)),
> > > >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
> > > >  	},
> > > > +	{ XE_RTP_NAME("18041344222"),
> > > > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > > > +		       FUNC(xe_rtp_match_first_render_or_compute),
> > > > +		       FUNC(xe_rtp_match_not_sriov_vf),
> > > 
> > > We don't need this; nothing on the engine_was[] list applied to SRIOV
> > > VFs so we never apply any of them.  This RTP match function is intended
> > > for OOB functions (and possibly LRC workarounds).
> > 
> > I submitted a patch series https://patchwork.freedesktop.org/series/160865/
> > to remove the RTP match function xe_rtp_match_not_sriov_vf() from the
> > earlier WA patches and the SRIOV IGT tests are failing.
> > 
> > Michal mentioned that with the below patch, WAs are applied for VFs
> > 92a5bd302458a1663 (drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs)
> 
> It looks like that failure is coming from the 'process' stage because of
> the logic in your xe_rtp_match_gt_has_discontiguous_dss_groups()
> function, not because we're actually trying to apply the workaround.
> Adding the 'FUNC(xe_rtp_match_not_sriov_vf)' rule happens to avoid the
> crash because of short-circuiting, but you'd still be getting the crash
> if you'd put that after your custom FUNC() rule instead.
> 
> 
> There are two steps for workarounds/tuning programming:
>  - Step 1:  process the RTP table that describes all workarounds to
>    identify the subset that are relevant to the current device, and
>    compile a reg_sr list containing that subset
>  - Step 2:  apply the contents of the reg_sr list to the hardware by
>    writing the registers
> 
> Of the three main classes of workarounds we have (GT, engine, and LRC),
> only the LRC workarounds are relevant to SRIOV VFs; VFs don't have
> access to read or update the registers in GT and engine workarounds.
> So the commit Michal referenced allowed Step #1 to go forward because
> VFs do legitimately need to process one of the workaround tables (the
> LRC table).  However there's also commit c19e705ec981 ("drm/xe/vf: Stop
> applying save-restore MMIOs if VF") that blocks Step 2 for SRIOV VFs for
> the GT and engine workarounds (LRC workarounds are applied in a
> different way and not affected by that).
> 
> So the result of those two commits is that we'll process the RTP tables
> for all three types of workarounds and generate reg_sr lists of
> workarounds that we initially thing we need for the current device.  For
> the SRIOV VF case, the reg_sr list that gets generated for GT/engine is
> bogus (since we _don't_ actually want or need the workarounds it
> identified), but it mostly doesn't really matter since we effectively
> throw the list away and never apply it.
> 
> This mostly works, but there are a couple hitches:
> 
>  - Even if we'll never apply the workarounds for GT/engine in an
>    SRIOV-VF, we still spend the time processing their RTP tables to
>    needlessly generate a reg_sr.  This is a waste of time, but usually
>    harmless.
> 
>  - If any of the RULE conditions in an RTP entry try to read a register
>    that an SRIOV_VF doesn't have access to, it will get back a value of
>    zero.  On its own this is harmless, but if the logic in the rule
>    fails to account for 0 as a possible value, you can wind up with
>    things like divide-by-zero errors, which is happening with your
>    specific workaround.
> 
>  - Even though we never apply the register programming in the driver, we
>    still report all the engine workarounds' registers to the GuC as part
>    of the ADS regset, which will cause the GuC to attempt to
>    save/restore them around resets.  This is probably harmless since the
>    VF GuC won't be able to read/write these registers, so nothing will
>    happen (and the PF's KMD+GuC are probably already handling these
>    appropriately on its own save/restore list anyway).  But it's still a
>    bit misleading/confusing.
> 
>  - I think (haven't checked) that since we filled out a reg_sr with a
>    bunch of workarounds that we're not actually going to apply, some of
>    the debugfs entries like 'register-save-restore' and 'workarounds'
>    probably report misleading/incorrect information when run in a VF.
>    Not a huge problem since it's a developer-only debug interface, but
>    it could cause confusion.
> 
> 
> So maybe what we really want to do is block the processing of RTP => SR
> at the GT and engine callsites (but not the LRC callsite) for SRIOV VF.
> Then we won't waste time processing the rules when we already know they
> won't be applied, we won't run into problems with FUNC() rules that
> can't cope with SRIOV VF environments, and we won't report misleading
> information to the GuC and debugfs.
> 
Thanks for the detailed explanation of how the workarounds are processed
and applied. I agree with your suggestion to block the processing of
RTP to SR at the GT and engine callsites for SRIOV VF. For this
workaround, I plan to do the following:

1. Add a check for SRIOV VF at the beginning of the function
xe_rtp_match_gt_has_discontiguous_dss_groups(). All the functions in 
xe_gt_mcr.c and others that access steering information have the check
IS_SRIOV_VF(). I think xe_rtp_match_gt_has_discontiguous_dss_groups()
should have too.

2. Remove xe_rtp_match_not_sriov_vf() from all applications of this
workaround.

The optimizations to skip processing of the GT and engine workarounds
for SRIOV VF will go in a separate patch.

Please let me know if there are any issues with this approach.

Thank You
Harish.

> Matt
> 
> > 
> > Thank You
> > Harish.
> > 
> > > 
> > > 
> > > Matt
> > > 
> > > > +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> > > > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> > > > +	},
> > > >  
> > > >  	/* Xe2_HPG */
> > > >  
> > > > -- 
> > > > 2.43.0
> > > > 
> > > 
> > > -- 
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
