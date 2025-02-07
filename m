Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB3BC02198
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 00:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB65810E012;
	Fri,  7 Feb 2025 00:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2l2Dq89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0653810E012
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 00:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738889159; x=1770425159;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b9JyXtYIZQzy+EGGpYpem0MyZ4W6BCzh/JSq1y6oVrI=;
 b=T2l2Dq89WymFRPIit0G83+m+2TLX52QUZ1Ydew2iJyhh2yt5xiRQaWTV
 gjeq9w+iN3qzLByhu4BOLG6ciIj2GbgXLf/EADr0XIEIT6IMX7C/S8Pmk
 Sq6lo85FiM6ikbUDt2WMwTo2BOBlsauCg+VIDYX6aLFi9xRbs4SJf4fUq
 FqYrEhCS2+zYXSAhOlpKr0QBqm+Ksrs4drxgAtJjbxZBOjA2pjN0+3NuJ
 aG9ftrCFLCvQe7BWz/aad70iBVTIQAHNIG24cQVTFylnzLzgCF1QBLvDb
 1XGmc+oao4bKNF+PuXF6LeBZtZVXKuNZU6BstIjpuRaxBdgUDcGp13ERd A==;
X-CSE-ConnectionGUID: 2Us2UJKDTIG7WzBqeQeToQ==
X-CSE-MsgGUID: DDcuLLnITVazCGUGJY3GDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39545277"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="39545277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 16:45:59 -0800
X-CSE-ConnectionGUID: AzQjFwuWRee9Ad8SbG8cEg==
X-CSE-MsgGUID: nIBq5yr+S5yTaX84cRgEhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111209665"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 16:45:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 16:45:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 16:45:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 16:45:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsiIhkrkivRvmWMRFGtIkcQa5FvyVTh2dcWuOqmGxiYOlH8OV2qJ1yBksXQQCYqfl11HXLzLdCzcTB7wIgBPvC3eXptRCEzDYevGgAuZ0evjdEH55i3b/HZvBH/v+UVYxHLA9yX6sCECf+KfLvswFds2GeQO4xIjWQ2JDikN6KVAKIR0j/TmpJCcam1rPwh6u9pzcltijSdb4/jUCLMvYkcVAXPI/v1MwNsIGK6DMHQkKCrVHK3Nj4PS7XKBIuASdyRdhFU3TtqdwFtPiBxuDDQAHABZwTQoHIjuJQTCJk+YQUX840t1NvreYbe8PHA5iBokpcvG9FtPWh258AiZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9nU4wkr3xS0w63OHchgCdqVVM+Pa9c4rzpX5XPqoj0=;
 b=wQvbHvtGxgKsm00k7Fv1xCd5GOkGw2gO9zyFSoSgob9gnL+qyQG8PeQ/W4lOYdy5cwwwy5OD5kQVZc48fLlRK69wspTce7CrMv0xrzoFuH6hZYP9SZn4z15Df2CRdJ8XieQd0YBpd0XaLyP4CKAqT0ooefvZaPFxE0lgwescPf0DnG1fUoL4Djv/PpbATLVtVkVUiSPVRIC3HiqCKdIBcg6fK31a/xj4fiPcyiaN+b0ZH8gSPKNAScLD79ggUseAvaSi1NVx6Gnc5sacEQtp5vu/cBtQPyTdDt5yPJKAksXIWmDd+3UCgZAqIQKSimAEaDdO2rjye7h/EhYGTTNu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7590.namprd11.prod.outlook.com (2603:10b6:806:348::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 00:45:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 00:45:52 +0000
Date: Thu, 6 Feb 2025 18:45:48 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 07/14] drm/xe: Cleanup unwind of gt initialization
Message-ID: <zzznxtriyne25xsxckltstmnwunirvd4ri7p225lyzbw2jz7wk@kxrsz2enzxlm>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
 <20250206232333.2660325-8-lucas.demarchi@intel.com>
 <ca37bf12-1810-492b-bb38-bd41cafe686e@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca37bf12-1810-492b-bb38-bd41cafe686e@intel.com>
X-ClientProxiedBy: MW4PR04CA0261.namprd04.prod.outlook.com
 (2603:10b6:303:88::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a06ed6d-b72e-4670-6034-08dd4710c60b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?485YUdvTwbMkp4j3YBsPZakurn/81IqKw2vTC0LA4rppelJymh2t0m/jY3?=
 =?iso-8859-1?Q?ll7dXs7OUbokqOomJceq1t+NB/S5Ews7ePBrpJeH0PxiNtX1ZPKNzvwDUY?=
 =?iso-8859-1?Q?p9SjfB+AGwyB06S5ctZ4Jn5qlcxzIaf1/v6fM/RdRfKE2xqe85LyGSqn5Z?=
 =?iso-8859-1?Q?unJKP+jFo41Lh+5+SPv89S7E6Z0gxgr/+P9/EG8BpVR/XAkPn8x+2rMOdz?=
 =?iso-8859-1?Q?yVVodySRhIE02ONKvrlN/GKfR5tQB//4tbV8Bb8SO5DhdeNB0ty7G+9a8Y?=
 =?iso-8859-1?Q?4s1vS/x5CpltRZV6Z37pm5Tg+X+nXjVDx+Y1j2HO87AJpkqlFzsOy2fNlj?=
 =?iso-8859-1?Q?JKEbpPytj99HAZQLFjnDRoXKARMwKxrBHM5H2firQ064BS9e8AylBJAjTU?=
 =?iso-8859-1?Q?VdwoPw41bQjSDv8zFQbwXdVNcCrTvaBRSRgR9NmW1rZmZhiysromzqOBGb?=
 =?iso-8859-1?Q?U+jhlVfTEretPYFBbmioL3dhR3q6I8l+BZh++MiqoPwF8lK33o0C1kYBOC?=
 =?iso-8859-1?Q?RIrUHFZ8P2e7BMpUiCtXQj3BqYxrhdm1bTTEigZxGBm+QMYnUmHFcGBZ18?=
 =?iso-8859-1?Q?PQZTqKpM68WWqwRUfPMkKDAw5+VgRA8qyb1i3qeJqXNHGktTzo7sto/vJI?=
 =?iso-8859-1?Q?tE74bkV0TrVJEXRQglNhhL7YRI2ATECD17zgb0CvVXtcziE4pv/h8JPxhi?=
 =?iso-8859-1?Q?oWnY/0vEGDuoXhtHU8bpBRJi5YcyK6RnnAn3GoQfKvtvdmyZZRmsaLAMZu?=
 =?iso-8859-1?Q?RNhzpVf0ey9NiTjdu/OqnvJ9Iik/4O56XMFJEAfK6MOnhQP0Iy1LJMC587?=
 =?iso-8859-1?Q?NKzhQVFtbpZOgtHMMph4oE4awVbMwhNWrsUvpXDy8WnAfUBFkAVtfJIy1T?=
 =?iso-8859-1?Q?pbOQhOFqDK9yFGBu0cFmgGw8dKaeNRK3kmpmlPI4FkhqOy7Ov2ei7Lo3yq?=
 =?iso-8859-1?Q?5yEBhRMeOkbdZ4VgpZhxk287BKJTRbChmU6VaK9cH6M0P+LQKn4GH1bPcW?=
 =?iso-8859-1?Q?HYkAyJ2jYFbRGG4gEC/j26+w0QIfzdwtbCXdQ6zPXloZ3gAOvQfYVj0GNc?=
 =?iso-8859-1?Q?1aekGpht3gCB5xiu/9y1+0FghQajSr/y4hmLKfDlltnl53ftqYfmiW25wz?=
 =?iso-8859-1?Q?UtM7Ei3NlkrkY/dVHw7zDepJfedPT+ZV+YYlIDYeYxc26AcgDEOG02ntHU?=
 =?iso-8859-1?Q?ALu5QtsOOOe6QsbG+mTBLkJSkESMB391E9a/lQwiapyqemSIeDsiv2eX9X?=
 =?iso-8859-1?Q?5vn0+2Mm3kJTNEBwUfhiqAF7AyIVvjimUoFqfn0lyklIJvHN2MtO/2zonX?=
 =?iso-8859-1?Q?NzzehFx8n1Q4YANQoFy2v5EBfUPtYk4EOMDWoQmLOUc7RCoMNB/SpPNRbI?=
 =?iso-8859-1?Q?yduhZLPgxQonJl4rMayd6opFt0lmCkKpeG23x8CJvzvd42xcY2s11C+GZA?=
 =?iso-8859-1?Q?pZFEeMRO7GNp/reE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tAXZLoHZvh5CnhShKxmZI1xxI497819gAe6FTpvQGy8jlsNbH5Pl2GlqGs?=
 =?iso-8859-1?Q?vE06eSBACvwvE1Ll7LwyMR1adeUaZczaZ3U8heA0YpGcDSkzpL9bi8xABL?=
 =?iso-8859-1?Q?XeC1zo0eVirHsQlWUmDLiWnSXN2n2i1tIcvcyDc8Nxg4+0EmgGqv1vBV4e?=
 =?iso-8859-1?Q?1ZUFVGkWTxnu0tZ2wuzTACeQp6levJrkahsJJTQIa2MyxWlcuXSJG1pS8B?=
 =?iso-8859-1?Q?NDyMqKMvUARMQh+V4pW/TsMrrx6tc7dOkc6LPBXqms2ofh94BJlMwHdG9v?=
 =?iso-8859-1?Q?jHovg4KBZsA7xZhyq6bAzCwkboMivKgOjfrkzyJ4XK4L2BjawJh5sfO1Ct?=
 =?iso-8859-1?Q?Zzw0vjDIP6xfjTYqTFdccc0M+fyndWeldfY3XPL9CGuO8XZnAz/Y/K5WHr?=
 =?iso-8859-1?Q?n0XKt+7fLaydp5u/42goEb1nw0oF0g8FTGn2+ISAmp9v9YtzW7+MKMEkUH?=
 =?iso-8859-1?Q?JjESkxSnwt9zyW6btoD3nXXmr5m8gAN3Sr7CyoZVC+NHhRKBmg9x2ICsuR?=
 =?iso-8859-1?Q?XIKJJZ7DBOnrRQTl6Ic/dMTDbnyQlXYi0TZXX6Bs98rUzvFmYRWT4GDDNH?=
 =?iso-8859-1?Q?LRCt2i3EoroneSRSYsLje/koBu21cATNVAUWzl3SV9564l54yY5KsxRY9b?=
 =?iso-8859-1?Q?mybw/BDeh2dZcgO5sU1gxQiBOqcUExjMADXbY++plaFdYiAAOqMvCEftpn?=
 =?iso-8859-1?Q?ThIQq1BiL4Gc7wgGiLa3yifLiib5PytQ4+hfsLMeCKfwZfkt3/1LNEdCQN?=
 =?iso-8859-1?Q?eypCDHFxAGFqevznkmIAMi3UBsrmu7kfozHcQ8iQgUSzgWIurQHaCbMSj7?=
 =?iso-8859-1?Q?/aT48pUj03aiYNbbiiOltqpohmCiD/Fpfi9m031iKs9xYK3rtlKVCR9YtC?=
 =?iso-8859-1?Q?EKTsP9fFPByl+YfxUgr/xP9+vCcLGcnepeJDnEkugGqoq69C6RZwYebLH1?=
 =?iso-8859-1?Q?YfpaKaapl1/UItuubKXdM0DJuIjk6GoUe+Vx+wwDfX2xsKfU2SmLMHgZTn?=
 =?iso-8859-1?Q?alLYVcveCnDywy+hyFYTasLv1j123sawObYgDrPFtbsAtyC2pU39teqTG3?=
 =?iso-8859-1?Q?kxMrvl1kXrIpZFo3XT1N0qd5zDeUw6enm8NIdo4TkBBiQidojg4P5XU4FD?=
 =?iso-8859-1?Q?7Hu5A2AEbM9EuQpjDpxdh4usVwCmhapkqe/0p3quL6M3l6QEvBU+1HdA44?=
 =?iso-8859-1?Q?2xxDbO5woJiyJ/9y88ZVx2kZxXGytlurXNs8VyYCnkOy2Y+8Ucyc6rPjrR?=
 =?iso-8859-1?Q?K+hlECEmvTxftV3huf0cG00BFqIu2WBYpzjMIn4b/tOiMeE9OS5NXtKsO1?=
 =?iso-8859-1?Q?xK027n5VLQ1rBX6RXGKxPphGxRdAFedpUq8qjuzfZE2pfhJJokemBmrggo?=
 =?iso-8859-1?Q?bC87pmhjUoZ6mG38c7meIIe7BG40vZDr4B+kw1WRhstvNX0OKOWHhOb9Gw?=
 =?iso-8859-1?Q?ImGDG/j7UFcgwzuCMDzbwggb2IEF+M2hZug979RCoZHFBnWGziT2R90x46?=
 =?iso-8859-1?Q?YXN+w8IpXBXvZvIdWtN7s+2ZvSnQRxAZRdh4YRYKyMirfaP0Zc9rtm9ukK?=
 =?iso-8859-1?Q?7rm9an4GTCzhUrMkMPOuMJfYOw1/kUrS36hYaTOkNIz/unx5o3A0TJN+Hl?=
 =?iso-8859-1?Q?gS2V26JJztjJfg45P5YodMjz7XlZuB3DIcM0nrGs9Tw2r6hxbtDESSuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a06ed6d-b72e-4670-6034-08dd4710c60b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 00:45:52.6473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlmkuypGVySAb7NEi6wf+wsXEZT3rUO11GnWqxRZ3MkeQAw1Ph3Gb6Xn3j1VusLYnPrDhqNYYI4Ec2FW9nF8i1pBqrXi1/DkpBaPvCjmvbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7590
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

On Thu, Feb 06, 2025 at 04:21:26PM -0800, Daniele Ceraolo Spurio wrote:
>
>
>On 2/6/2025 3:23 PM, Lucas De Marchi wrote:
>>The only thing in xe_gt_remove() that really needs to happen on the
>>device remove callback is the xe_uc_remove(). That's because of the
>>following call chain:
>>
>>	xe_gt_remove()
>>	  xe_uc_remove()
>>	    xe_gsc_remove()
>>	      xe_gsc_proxy_remove()
>>
>>Move xe_gsc_proxy_remove() to be handled as a xe_device_remove_action,
>>so it's recorded when it should run during device removal. The rest can
>>be handled normally by devm infra.
>>
>>Besides removing the deep call chain above, xe_device_probe() doesn't
>>have to unwind the gt loop and it's also more in line with the
>>xe_device_probe() style.
>>
>>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_device.c    | 21 +----------
>>  drivers/gpu/drm/xe/xe_gsc.c       |  9 -----
>>  drivers/gpu/drm/xe/xe_gsc.h       |  1 -
>>  drivers/gpu/drm/xe/xe_gsc_proxy.c | 63 +++++++++++++++----------------
>>  drivers/gpu/drm/xe/xe_gsc_proxy.h |  1 -
>>  drivers/gpu/drm/xe/xe_gsc_types.h |  3 ++
>>  drivers/gpu/drm/xe/xe_gt.c        | 35 ++++++++---------
>>  drivers/gpu/drm/xe/xe_gt.h        |  1 -
>>  drivers/gpu/drm/xe/xe_uc.c        | 13 -------
>>  drivers/gpu/drm/xe/xe_uc.h        |  1 -
>>  10 files changed, 50 insertions(+), 98 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index 5fc4e696262f9..09288558e4e44 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -744,7 +744,6 @@ int xe_device_probe(struct xe_device *xe)
>>  	struct xe_tile *tile;
>>  	struct xe_gt *gt;
>>  	int err;
>>-	u8 last_gt;
>>  	u8 id;
>>  	xe->probing = true;
>>@@ -855,18 +854,16 @@ int xe_device_probe(struct xe_device *xe)
>>  		return err;
>>  	for_each_gt(gt, xe, id) {
>>-		last_gt = id;
>>-
>>  		err = xe_gt_init(gt);
>>  		if (err)
>>-			goto err_fini_gt;
>>+			return err;
>>  	}
>>  	xe_heci_gsc_init(xe);
>
>unrelated to this patch, but still tied to probe failures: AFAICS we 
>don't call xe_heci_gsc_fini when the probe fails after this point.

yep...

>I'm not 100% sure, but it doesn't look like this is intentional for 
>survivability mode (because that one has its own xe_heci_gsc_init/fini 
>calls), so maybe xe_heci_gsc_fini is another candidate for using a 
>remove_action callback? I don't think we can leave the child device 
>cleanup to a devm call.

I started adding it, moving the xe->probing to be set on
xe_device_probe_early() to account for the survivability... but then
when reviewing the survivability enabling I got into a "coding
deadlock" -- I need to split the changes I have in xe_heci_ to be able
to do something like. Right now it's not very well integrated:

if something in xe_heci_ fails, we may have the situation that we enter
survivability mode but don't have it really working and no error
messages.  Since this problem is already there, I decided to postpone
further refactors.


>
>>  	err = xe_oa_init(xe);
>>  	if (err)
>>-		goto err_fini_gt;
>>+		return err;
>>  	err = xe_display_init(xe);
>>  	if (err)
>>@@ -905,14 +902,6 @@ int xe_device_probe(struct xe_device *xe)
>>  err_fini_oa:
>>  	xe_oa_fini(xe);
>>-err_fini_gt:
>>-	for_each_gt(gt, xe, id) {
>>-		if (id < last_gt)
>>-			xe_gt_remove(gt);
>>-		else
>>-			break;
>>-	}
>>-
>>  	return err;
>>  }
>>@@ -978,9 +967,6 @@ static void xe_device_remove_display(struct xe_device *xe)
>>  void xe_device_remove(struct xe_device *xe)
>>  {
>>-	struct xe_gt *gt;
>>-	u8 id;
>>-
>>  	xe_oa_unregister(xe);
>>  	xe_device_remove_display(xe);
>>@@ -989,9 +975,6 @@ void xe_device_remove(struct xe_device *xe)
>>  	xe_heci_gsc_fini(xe);
>>-	for_each_gt(gt, xe, id)
>>-		xe_gt_remove(gt);
>>-
>>  	xe_device_call_remove_actions(xe);
>>  }
>>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>index 1eb791ddc375c..fd41113f85725 100644
>>--- a/drivers/gpu/drm/xe/xe_gsc.c
>>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>>@@ -555,15 +555,6 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
>>  		flush_work(&gsc->work);
>>  }
>>-/**
>>- * xe_gsc_remove() - Clean up the GSC structures before driver removal
>>- * @gsc: the GSC uC
>>- */
>>-void xe_gsc_remove(struct xe_gsc *gsc)
>>-{
>>-	xe_gsc_proxy_remove(gsc);
>>-}
>>-
>>  /*
>>   * wa_14015076503: if the GSC FW is loaded, we need to alert it before doing a
>>   * GSC engine reset by writing a notification bit in the GS1 register and then
>>diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
>>index e282b9ef6ec4d..d99f66c38075c 100644
>>--- a/drivers/gpu/drm/xe/xe_gsc.h
>>+++ b/drivers/gpu/drm/xe/xe_gsc.h
>>@@ -17,7 +17,6 @@ int xe_gsc_init(struct xe_gsc *gsc);
>>  int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
>>  void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
>>  void xe_gsc_load_start(struct xe_gsc *gsc);
>>-void xe_gsc_remove(struct xe_gsc *gsc);
>>  void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec);
>>  void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
>>diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>>index 24cc6a4f9a96a..0da33d5e9b1c0 100644
>>--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
>>+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>>@@ -423,6 +423,34 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
>>  	return 0;
>>  }
>>+static void xe_gsc_proxy_remove(struct xe_device_remove_action *ra)
>>+{
>>+	struct xe_gsc *gsc = container_of(ra, struct xe_gsc, proxy.remove_action);
>>+	struct xe_gt *gt = gsc_to_gt(gsc);
>>+	struct xe_device *xe = gt_to_xe(gt);
>>+	unsigned int fw_ref = 0;
>>+
>>+	if (!gsc->proxy.component_added)
>>+		return;
>>+
>>+	/* disable HECI2 IRQs */
>>+	xe_pm_runtime_get(xe);
>>+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>>+	if (!fw_ref)
>>+		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
>>+
>>+	/* try do disable irq even if forcewake failed */
>>+	gsc_proxy_irq_toggle(gsc, false);
>>+
>>+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>+	xe_pm_runtime_put(xe);
>>+
>>+	xe_gsc_wait_for_worker_completion(gsc);
>>+
>>+	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
>>+	gsc->proxy.component_added = false;
>>+}
>>+
>>  /**
>>   * xe_gsc_proxy_init() - init objects and MEI component required by GSC proxy
>>   * @gsc: the GSC uC
>>@@ -461,43 +489,12 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>>  	}
>>  	gsc->proxy.component_added = true;
>>-
>>-	/* the component must be removed before unload, so can't use drmm for cleanup */
>>+	xe_device_add_remove_action(xe, &gsc->proxy.remove_action,
>>+				    xe_gsc_proxy_remove);
>>  	return 0;
>>  }
>>-/**
>>- * xe_gsc_proxy_remove() - remove the GSC proxy MEI component
>>- * @gsc: the GSC uC
>>- */
>>-void xe_gsc_proxy_remove(struct xe_gsc *gsc)
>>-{
>>-	struct xe_gt *gt = gsc_to_gt(gsc);
>>-	struct xe_device *xe = gt_to_xe(gt);
>>-	unsigned int fw_ref = 0;
>>-
>>-	if (!gsc->proxy.component_added)
>>-		return;
>>-
>>-	/* disable HECI2 IRQs */
>>-	xe_pm_runtime_get(xe);
>>-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>>-	if (!fw_ref)
>>-		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
>>-
>>-	/* try do disable irq even if forcewake failed */
>>-	gsc_proxy_irq_toggle(gsc, false);
>>-
>>-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>-	xe_pm_runtime_put(xe);
>>-
>>-	xe_gsc_wait_for_worker_completion(gsc);
>>-
>>-	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
>>-	gsc->proxy.component_added = false;
>>-}
>>-
>>  /**
>>   * xe_gsc_proxy_start() - start the proxy by submitting the first request
>>   * @gsc: the GSC uC
>>diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.h b/drivers/gpu/drm/xe/xe_gsc_proxy.h
>>index c511ade6b8637..fdef56995cd43 100644
>>--- a/drivers/gpu/drm/xe/xe_gsc_proxy.h
>>+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.h
>>@@ -12,7 +12,6 @@ struct xe_gsc;
>>  int xe_gsc_proxy_init(struct xe_gsc *gsc);
>>  bool xe_gsc_proxy_init_done(struct xe_gsc *gsc);
>>-void xe_gsc_proxy_remove(struct xe_gsc *gsc);
>>  int xe_gsc_proxy_start(struct xe_gsc *gsc);
>>  int xe_gsc_proxy_request_handler(struct xe_gsc *gsc);
>>diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
>>index 5926de20214c8..3649239f19622 100644
>>--- a/drivers/gpu/drm/xe/xe_gsc_types.h
>>+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>>@@ -13,6 +13,7 @@
>>  #include <linux/workqueue.h>
>>  #include "xe_uc_fw_types.h"
>>+#include "xe_device_types.h"
>>  struct xe_bo;
>>  struct xe_exec_queue;
>>@@ -57,6 +58,8 @@ struct xe_gsc {
>>  		struct mutex mutex;
>>  		/** @proxy.component_added: whether the component has been added */
>>  		bool component_added;
>>+		/** @proxy.remove_action */
>
>nit: should this have a description?

yep..

>
>Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

thanks
Lucas De Marchi

>
>Daniele
>
>>+		struct xe_device_remove_action remove_action;
>>  		/** @proxy.bo: object to store message to and from the GSC */
>>  		struct xe_bo *bo;
>>  		/** @proxy.to_gsc: map of the memory used to send messages to the GSC */
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index 9fb8f1e678dc8..c33040278e1aa 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -141,26 +141,6 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>  }
>>-/**
>>- * xe_gt_remove() - Clean up the GT structures before driver removal
>>- * @gt: the GT object
>>- *
>>- * This function should only act on objects/structures that must be cleaned
>>- * before the driver removal callback is complete and therefore can't be
>>- * deferred to a drmm action.
>>- */
>>-void xe_gt_remove(struct xe_gt *gt)
>>-{
>>-	int i;
>>-
>>-	xe_uc_remove(&gt->uc);
>>-
>>-	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>>-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>>-
>>-	xe_gt_disable_host_l2_vram(gt);
>>-}
>>-
>>  static void gt_reset_worker(struct work_struct *w);
>>  static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>>@@ -583,6 +563,17 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>  	return err;
>>  }
>>+static void xe_gt_fini(void *arg)
>>+{
>>+	struct xe_gt *gt = arg;
>>+	int i;
>>+
>>+	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>>+		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>>+
>>+	xe_gt_disable_host_l2_vram(gt);
>>+}
>>+
>>  int xe_gt_init(struct xe_gt *gt)
>>  {
>>  	int err;
>>@@ -595,6 +586,10 @@ int xe_gt_init(struct xe_gt *gt)
>>  		xe_hw_fence_irq_init(&gt->fence_irq[i]);
>>  	}
>>+	err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_fini, gt);
>>+	if (err)
>>+		return err;
>>+
>>  	err = xe_gt_pagefault_init(gt);
>>  	if (err)
>>  		return err;
>>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>index e504cc33ade4f..187fa6490eafc 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.h
>>+++ b/drivers/gpu/drm/xe/xe_gt.h
>>@@ -54,7 +54,6 @@ int xe_gt_resume(struct xe_gt *gt);
>>  void xe_gt_reset_async(struct xe_gt *gt);
>>  void xe_gt_sanitize(struct xe_gt *gt);
>>  int xe_gt_sanitize_freq(struct xe_gt *gt);
>>-void xe_gt_remove(struct xe_gt *gt);
>>  /**
>>   * xe_gt_wait_for_reset - wait for gt's async reset to finalize.
>>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>index 0d073a9987c2e..d8167e818280b 100644
>>--- a/drivers/gpu/drm/xe/xe_uc.c
>>+++ b/drivers/gpu/drm/xe/xe_uc.c
>>@@ -288,19 +288,6 @@ int xe_uc_suspend(struct xe_uc *uc)
>>  	return xe_guc_suspend(&uc->guc);
>>  }
>>-/**
>>- * xe_uc_remove() - Clean up the UC structures before driver removal
>>- * @uc: the UC object
>>- *
>>- * This function should only act on objects/structures that must be cleaned
>>- * before the driver removal callback is complete and therefore can't be
>>- * deferred to a drmm action.
>>- */
>>-void xe_uc_remove(struct xe_uc *uc)
>>-{
>>-	xe_gsc_remove(&uc->gsc);
>>-}
>>-
>>  /**
>>   * xe_uc_declare_wedged() - Declare UC wedged
>>   * @uc: the UC object
>>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>>index 506517c113339..3813c1ede450e 100644
>>--- a/drivers/gpu/drm/xe/xe_uc.h
>>+++ b/drivers/gpu/drm/xe/xe_uc.h
>>@@ -20,7 +20,6 @@ void xe_uc_stop(struct xe_uc *uc);
>>  int xe_uc_start(struct xe_uc *uc);
>>  int xe_uc_suspend(struct xe_uc *uc);
>>  int xe_uc_sanitize_reset(struct xe_uc *uc);
>>-void xe_uc_remove(struct xe_uc *uc);
>>  void xe_uc_declare_wedged(struct xe_uc *uc);
>>  #endif
>
