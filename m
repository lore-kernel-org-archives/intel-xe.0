Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B82C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 18:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DBE10E488;
	Mon, 15 Jul 2024 18:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1OJ6uVw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3619F10E488
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 18:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721066614; x=1752602614;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Cw+muKXeiHnA9x3gqJRh1/ahPCLFSLMN2N9uuGKup8s=;
 b=U1OJ6uVwbwXvg0uuvvaVvyL5cun1EIf55GmnYDmbvkJI1ZnTJaoX2eu8
 8nfDEGUP90RcDQXSacz0lhDNjY0bPjudXDU0Qp5zVwd3RbzD6UUZxvLNQ
 swCjQ7XtLsg7YOCs3G/rVu55DCYA6uCaa0bDIFOKArMmSix+9fiBY7F7I
 E9glraybhQrGvwBtfLxzMZk9oKGqCw4NAIHbe2MBbp3Wlf4aJVfDlwbDo
 4AJb84wTmUTl5cdK/Mx/Y/8X0aNRvwbxbcX1JMfXRHkWrcE3M+JRZj5Z6
 1tqDhx1Y+fR0MPG0un6gg7v4PIFaKe/YT5NlwOaahpollFBDc9SJSUcaC g==;
X-CSE-ConnectionGUID: pCnmY2WdQRa0O7JCTWH7GA==
X-CSE-MsgGUID: Oe7RqE2lRriAgWd9l5BpWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="35891645"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="35891645"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 11:03:34 -0700
X-CSE-ConnectionGUID: I7QcHi5eRGmw89ad5ujdoA==
X-CSE-MsgGUID: 1cYEs+ZkQTyRRfOxljyy2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="50339904"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 11:03:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 11:03:33 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 11:03:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 11:03:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 11:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFo2Ldt3Nk8mMtayicb04EsSaztgxLHpVrPebCDdRgEgnlAKASUAG+AaT3xpvGfX8D852KkQ5szsfF7ejG3/yg76nmN2ip/mmXTmurHo+pecyUNliX9VSjILWDRPS9nQW3Xe1YPH7EdQWuNYyfOqjoJrSmepC5etOjnzDQAnWGDpvoYuRejgEGYdAMmFl/3YYeAP/Z0b9dzH7dPioSBjKtLI68HA6vNfMJA/d3ztqQw+6X4uVmSASMWJuYZJ0GLWm/wbKxDre71BkhfxgwNS59AP0k6Xcq2/Xu5VhSaaf9MPkubKnp2P1dgdBUvd3Rz9VatbKFOcap8ncKDYtnaiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28Zn9dM+q0rLCE9QXoP34Zg82PwFN7KggAyUDAUETqU=;
 b=SZ/ydIlkEoicjbVg0GJlINSmGe/aarSAkmd41QYIKHL/m1wLIb4CJI+FKvVrtspBG3MIM7zngKFbFbKyTg8wz34370U+85Fqdmci/mGqG4bQQBQRY7KHgGUogiN6Uz92u02tuRRgslBn2soqCyZ3ErTfV7+5lqa54uw1lQDA6hsOoY3rzAnYEPKyAtLgjdbRhUSJe3PQmOkYpSm1gIqtN+n37V+SMfaP0ROvyYxSiKTYJY6zBRc5ahp7yzFpRVSWLryEmFQRpPqZTaDQnAAEMmBFLp1UmNYxpSpIl6Afqibct9ogXrha+6+9VyDEg52WIHg50nq8677x6gBs4aFTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB8480.namprd11.prod.outlook.com (2603:10b6:510:2fe::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 18:03:06 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 18:03:06 +0000
Message-ID: <7fea79c2-ce58-4238-a4ec-37f3fef5c3d9@intel.com>
Date: Mon, 15 Jul 2024 11:03:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/14] drm/xe/pxp: add a query for PXP status
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
 <20240712212901.2684239-11-daniele.ceraolospurio@intel.com>
 <9da733063a97cdf30473f2f97382eed62eacf251.camel@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <9da733063a97cdf30473f2f97382eed62eacf251.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::20) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: a419db3b-be70-4832-a964-08dca4f860cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnA0VXp2TmloWGMxYzNtb05OSUhOZGJ4YkNzK2pKZ2U2c3M2YTB5dHhKdlZp?=
 =?utf-8?B?clhBWFQzQU5iVXpvc0x3SHNwQlJlMXFtMEUwK0hQSnczdVJCRlNlYkE2YWRw?=
 =?utf-8?B?UzBLREl2WGVncFdaUXphdVRFNGhNRmRadmtaSmpKK2dROG5IQkJJV3lJUWVE?=
 =?utf-8?B?TzBLcG1PN2h3T0dzM1pIYWxhOFJQM1pmK2oyOGxWMW5qOTViaWVGZWxFUHBO?=
 =?utf-8?B?RlB0OUU4VTN5QXpHY25DZnUrZWNQY3pUMm1FYURSR2Q2T1N2QlJ4NCtsc2Jp?=
 =?utf-8?B?UFJMejV5Qm1sRlF3WFZ1MDhuaG5OUnIxbElRUTJyT082MDc5dm93ZlZOR0Rq?=
 =?utf-8?B?QXVKSURHM0tQWXpnYllOM1NzeFBhTkltNmNsUGRlNFE0Rmc0VGdKVUVZWGZs?=
 =?utf-8?B?bmptOGNZVWdueXBWYXU0Y09NR3lHb1Fhb1kyQlZPd0RiYVI0TElkUkxwNTVJ?=
 =?utf-8?B?YTl2U0dvclRVNDJSR2d4R3NPSEJLSUxkaFNBM3hGdlNlbVpCWWVkSmc2UkIv?=
 =?utf-8?B?TGE3Nmh5ZXhNUU9XWEFqTEhTQzA2elkzeGMyYi9abng3THlyRzBVWWxRejZp?=
 =?utf-8?B?OHYwTlhnSDNsSjVpbThUR1E4WnMrM3ZiSC9NcFlTa0FZV2w5Vlg0YWFXK1dj?=
 =?utf-8?B?QjlhREJiMmJ5TDN1ZmRqOHQvbVRJUlVsSUlpak4yVEx0LzNuZGNzUHF5RFJ0?=
 =?utf-8?B?VWl6OHBLTzdsQmVlT2M2ZWFYVWtsN0JhQkd5SklYaWdzTGQwTWt1Nk5tWFRx?=
 =?utf-8?B?dFVFNjFrOHd6cE5ET2ZaSlZDVmlRWXlyb0I1aVp5M3g2WWxqS1NyRmxOczNm?=
 =?utf-8?B?YnpTczBPU3gvOXNDNDJZclVhQUlwVVRVWjl2TWYzdTFlT3FXWEYrS3JHT1E2?=
 =?utf-8?B?Sjc1NEd4alF5TWpkdk9pMDRlc1k2QjExNTdWTDFwbWtTY2Z2Si9wd2NURFlR?=
 =?utf-8?B?YnZKYXdsbXpBZVZ0OVdld2NBbS9GVERZK25CVEdKY3BOYS9HNUFuekJDRWNW?=
 =?utf-8?B?aStnR3lrTEN5NGpHUG82VjhWeEZqY0JPejV0eDQ5VHl2VVFwN1ZVZ1BwTVE3?=
 =?utf-8?B?NHIxVVJ4bTZsZ015Ujc2aHNaMGZtSWt3a29SZ04wUlZ5S3IrMmc0bXF1aCtR?=
 =?utf-8?B?RTNVZEpBbkRqeXIrbUlFdDlXN3lDenk4cXFwNi9xdFdCeWs2enhDNnJtblF6?=
 =?utf-8?B?aWxESU81bHRaOHhFWUExSWt5RjJTYlBKVUQzemxoOUFtdUtQRjVLbTA5Yjhl?=
 =?utf-8?B?Tm5DbUFEcis5L08wcStRZHErS09wTDUrM1JiR0hEUGI4dTNHL3VCanh6dzF3?=
 =?utf-8?B?Nmp6Tk4yeUltcXpKS3V3MUltZU1FZlhnY1NRWjVVaEczRmF6aTNJdzRXR3Nv?=
 =?utf-8?B?RHY0RzhibHpkdkN6dXRITlVNRmNwMitqK2pyZHN0Wi9pR04yckJQZitTZ1Va?=
 =?utf-8?B?RVlLdGF6MkNtS1M2RnZqdVg0Sng5czVPRmxiaFdUTTdpZlQwdUYvcTJLRFdx?=
 =?utf-8?B?WC9vcVZZQ1dyeEJrNTF5QVQ2Qy9oV3pPMVd0MTFXdkxhUXNZUUpJUStTUFJh?=
 =?utf-8?B?YUFzeU5QdXcrdUE4LzZ1WXdmTTRkU0RHcVI3UlVtbkgwVEpXYlEyWVp2VTR2?=
 =?utf-8?B?aG1kTXNMVTIwcm9QY3lRTG40TC9TYmNubTNPZTQyWlY4WWxnS3lzSEV0Y1Jn?=
 =?utf-8?B?eTVLSTdFTDRDdElMQVN5KzZ6L3czcjQzS3QyZ3Yrdk5COXh6QklWSTgwRFVI?=
 =?utf-8?B?cVQyQXBNNCtsTVRFUjlwT0NlTFhFOTJnWk9WRDlyU25tallJYWh3Qnk1Z3hK?=
 =?utf-8?B?UEVRaXNZU1VRcXdmQldaUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVRIcUw1S2dVWkFVV3Zqc1A2OTVkbFJRR0xGN3J1VEt5U042aU9sZnVlcGFq?=
 =?utf-8?B?aW0xV1plZStKK1pncmlPODBEZGVOajRlZmdSNWZQUjlUblFuaXVJb2FEY3FR?=
 =?utf-8?B?d2xoMG1EaUtsOE1qQVZ5ZWF3ZFJGV3dXQmVPeFU0U0Fra2JlZmFGczB0bThu?=
 =?utf-8?B?M2RaTGh2eEkyeWtVMUdXclUyb294aW9QeExHSW5MUEFIQkd6NkVNUloxN1pP?=
 =?utf-8?B?bWhsMDFDY2R0SWxCS3orS2V4OHkzam1qTGowWU81K0tGb1FNM2NpZHM3cDkx?=
 =?utf-8?B?c1VQaXFnYmZ3cm9RV2hhRVpOYi9obVB2aXNDdEU1cHFRdm52cUZiN3JJZDdo?=
 =?utf-8?B?OW1pdnhicjcrMEdSbWdORE9YNWFoUHBnZnVjc3FSQnZEZ3Y5V2lGaXdqaHBn?=
 =?utf-8?B?VnZaRHBSRmRTalNjZjBEMTM2MUVMMzM3TVg1akcwbVRzZmRyemxGaWdEQ1ls?=
 =?utf-8?B?OHVnSncwYkFDdHpnQXBXbG9HZlg5c2IwUmNicGRPbWxUZ2lKWWFwbWREUW93?=
 =?utf-8?B?MHJXNlE1MDhUVHA5RHRNQkFaUnNBS0hlZm9yUmhQckZxeDRwWEJLNW5tQ0Fv?=
 =?utf-8?B?SnlUc1JEVnU5VGRGZW9idHNTVlhFQVVUYUxPL0NoTGRFSVRndnAvL1VTU2pU?=
 =?utf-8?B?V2RGVHZBM1IvVFpNL2o4Sk9zWUNtcG5qL3JJcjRkTmhleVJCVXAxTGVVLzVt?=
 =?utf-8?B?Qzd6N1pOVFE4N0llQ0xtSmI2enZ0MTBWNTBMdytVazYyUmxueGgrRE9jTGhN?=
 =?utf-8?B?bFM1ZjNRSDF5aER0RUVEd3dUcUNvQ1d3RFBya3c4eHBoSlFSYjFkaXR2STBC?=
 =?utf-8?B?NlUvNmpKVzhRbmpwNDBCSFVpMHUvdXdmR1NJYnFCdnRubGZsQ3VPU3gwOXJ4?=
 =?utf-8?B?cm5KbFFVemtXeE0yS0JTNDlvVHRUcC9KTTE5TDBnKzZOc3dUN2NXL3pRRjRK?=
 =?utf-8?B?MXV1amNEU2Jhd2pvVnQrbzd6bE9vZ2VsOGVmNlVIZHJxSTRnb3N1NC9OODd4?=
 =?utf-8?B?b0c4NzNvRXpOY29wN3hUQ1RZSUt3N3AvNTNqNWNEU1B0WXJuWVZBQmVhU1BS?=
 =?utf-8?B?bTN5NExUYWkyejF1MFhDUzNycmJBMmtIL3hXLzhWVUo0OWFBTUpLdy95dkZT?=
 =?utf-8?B?K2NTZjB5Qm11VWdSNG5RQVZhd096NGJyZjEvNFR5ZVc3cmdEWjdwWUR1VXds?=
 =?utf-8?B?Qk1kWFU3SjQxdVh4d1d3NTVLbWtzK1FpdUtzWlNwVFQwMUZXQUxvbjZVZHg3?=
 =?utf-8?B?aXVXZk5hbEpBMk5acmFuMEU0KzVhRkgvaS9oVlVRNXpoUExTeEdXVXlIcUVm?=
 =?utf-8?B?aVlJM1krUnF1SWEyUTRFa055QXA0MkUxS01NdWVVeFlORThOdHhoanFzNTls?=
 =?utf-8?B?R1ZRdXJCRHNzU1ZVTVg2VkMvQXhoK1VGVXlya2srME1UVXdpNFQ2T1ZaMDlo?=
 =?utf-8?B?UEZUODU4VkR6UW5jTjlWQURSQlB1dW15RHo3MzJMdFdzMjJ5Nm5wbFpWT2lF?=
 =?utf-8?B?bjVRbDJyZjI1VWxtTzB5bWlXTStab0dUdlpuMDBrdDl5MFBleE02L2h3eWhS?=
 =?utf-8?B?ZXQ2aW1oQlY0NVBJK28xUk5RVzM3dm1kaGI3WHdDUTZoYnBrNU9hTSs3YlNS?=
 =?utf-8?B?bTZqZGdOUzZPb1BQMUl5bk5Fek1PdXZtZmtwMDExbmlkZ3ZJcFNSQmVBSDdv?=
 =?utf-8?B?OVNCTjRMZW56TlpobmpkbjBwdlRCM2E2NnBvZTJlWU9NY1FTU0RSSXk1T2dC?=
 =?utf-8?B?WWJMTWo1c1dZQ29NL2g2SVEvQVQyczNVbm1jNlpzVlMvUGhwU1kydDdkOWlj?=
 =?utf-8?B?ZzZkQU5hMURUR0RIUVQ3L1o5SEFBcjJVNXI2eUw2NnJ4Z0lnS0h5K1M3dFA0?=
 =?utf-8?B?eFFHcTR2ZU9kSVl3alhGM2R0Q0FyYWhsUnJJYk5JWUVVY2FyQ2pkZzc0K3kz?=
 =?utf-8?B?Y2NjUE91QTlJcW4yNnNKcFR1YU5UUWtuVERoOGFNNitjTzN2TDJCODR6bCti?=
 =?utf-8?B?L0xGSEtVY2Z4SW9lbnJ1d252WXppUkV1KzVEemNXczBGRFJjOFJVSkZYTTJW?=
 =?utf-8?B?NFh3ZlpDWWNLTUxUWHUxUmkyc2J4Y0xTL21TOG1PMVBHL2pCWThBWmFuamxP?=
 =?utf-8?B?cHRVQzlQRmRyZ1FDN01kTDdCVWZOMGp2TmgycGZ2RzdYUTRJbG1QYXFCYmJz?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a419db3b-be70-4832-a964-08dca4f860cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 18:03:06.4465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p17EDf/oGbZ2g1GuY0TvXYtrLUZ5U+mzsOcd+DSpq7Ezjb5TKIsP5WKlB8p9McRPzpSzQOVHAPlBJk+yAKrdmR7OIkIYGyTGcPjvZ9oIkrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8480
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



On 7/15/2024 10:54 AM, Souza, Jose wrote:
> On Fri, 2024-07-12 at 14:28 -0700, Daniele Ceraolo Spurio wrote:
>> PXP prerequisites (SW proxy and HuC auth via GSC) are completed
>> asynchronously from driver load, which means that userspace can start
>> submitting before we're ready to start a PXP session. Therefore, we need
>> a query that userspace can use to check not only if PXP is supported by
>> also to wait until the prerequisites are done.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pxp.c   | 33 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pxp.h   |  1 +
>>   drivers/gpu/drm/xe/xe_query.c | 33 +++++++++++++++++++++++++++++++++
>>   include/uapi/drm/xe_drm.h     | 28 ++++++++++++++++++++++++++++
>>   4 files changed, 95 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>> index e979b47f155a..e39a47aeb050 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>> @@ -60,6 +60,39 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
>>   	return ready;
>>   }
>>   
>> +/**
>> + * xe_pxp_get_readiness_status - check whether PXP is ready for userspace use
>> + * @pxp: the xe_pxp pointer (can be NULL if PXP is disabled)
>> + *
>> + * This function is used for status query from userspace, so the returned value
>> + * follow the uapi (see drm_xe_query_pxp_status)
>> + *
>> + * Returns: 0 if PXP is not ready yet, 1 if it is ready, an errno value if PXP
>> + * is not supported/enabled or if something went wrong in the initialization of
>> + * the prerequisites.
>> + */
>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!xe_pxp_is_enabled(pxp))
>> +		return -ENODEV;
>> +
>> +	/* if the GSC or HuC FW are in an error state, PXP will never work */
>> +	if (xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status) ||
>> +	    xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
>> +		return -EIO;
>> +
>> +	xe_pm_runtime_get(pxp->xe);
>> +
>> +	/* PXP requires both HuC loaded and GSC proxy initialized */
>> +	if (pxp_prerequisites_done(pxp))
>> +		ret = 1;
>> +
>> +	xe_pm_runtime_put(pxp->xe);
>> +	return ret;
>> +}
>> +
>>   static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
>>   {
>>   	struct xe_gt *gt = pxp->gt;
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>> index 8f0a3a514fb8..b2aae4abdd0e 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>> @@ -14,6 +14,7 @@ struct xe_pxp;
>>   
>>   bool xe_pxp_is_supported(const struct xe_device *xe);
>>   bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>>   
>>   int xe_pxp_init(struct xe_device *xe);
>>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 4e01df6b1b7a..5da9f403c2b9 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_guc_hwconfig.h"
>>   #include "xe_macros.h"
>>   #include "xe_mmio.h"
>> +#include "xe_pxp.h"
>>   #include "xe_ttm_vram_mgr.h"
>>   
>>   static const u16 xe_to_user_engine_class[] = {
>> @@ -678,6 +679,37 @@ static int query_oa_units(struct xe_device *xe,
>>   	return ret ? -EFAULT : 0;
>>   }
>>   
>> +static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
>> +{
>> +	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
>> +	size_t size = sizeof(struct drm_xe_query_pxp_status);
>> +	struct drm_xe_query_pxp_status resp;
>> +	int ret;
>> +
>> +	if (query->size == 0) {
>> +		query->size = size;
>> +		return 0;
>> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (copy_from_user(&resp, query_ptr, size))
>> +		return -EFAULT;
>> +
>> +	ret = xe_pxp_get_readiness_status(xe->pxp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	resp.status = ret;
> when status is == 0? does it means that will always succeed? it just matter of time.

no, it just means the init is still in progress. It can still end up in 
an error state if something goes wrong during the init (e.g. GSC proxy 
init failure), although that's unlikely.

> For i915 in some older kernel versions we had to create a gem_context with I915_CONTEXT_PARAM_PROTECTED_CONTENT set to verify for sure if supported or
> not.

This query is enough to confirm. That's true for i915 as well, the query 
was added explicitly to avoid having to create a context just to check 
for PXP.

>
>> +	resp.supported_session_types =
>> +		BIT(DRM_XE_PXP_TYPE_NONE) | BIT(DRM_XE_PXP_TYPE_HWDRM);
> Looks odd to me that you return DRM_XE_PXP_TYPE_NONE as supported...

I just added it in to have all values of the enum represented. I can 
take it out no problem if you think it is clearer that way, I'll just 
add a note in the interface doc that DRM_XE_PXP_TYPE_NONE is always 
supported.

Daniele

>
>> +
>> +	if (copy_to_user(query_ptr, &resp, size))
>> +		 return -EFAULT;
>> +
>> +	return 0;
>> +}
>> +
>>   static int (* const xe_query_funcs[])(struct xe_device *xe,
>>   				      struct drm_xe_device_query *query) = {
>>   	query_engines,
>> @@ -689,6 +721,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>>   	query_engine_cycles,
>>   	query_uc_fw_version,
>>   	query_oa_units,
>> +	query_pxp_status,
>>   };
>>   
>>   int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 631fdc2ed493..746bc16bd220 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -619,6 +619,32 @@ struct drm_xe_query_uc_fw_version {
>>   	__u64 reserved;
>>   };
>>   
>> +/**
>> + * struct drm_xe_query_pxp_status - query if PXP is ready
>> + *
>> + * If PXP is enabled and no fatal error as occurred, the status will be set to
>> + * one of the following values:
>> + * 0: PXP init still in progress
>> + * 1: PXP init complete
>> + *
>> + * The supported session type bitmask is based on the values in
>> + * enum drm_xe_pxp_session_type, including TYPE_NONE.
>> + *
>> + * If PXP is not enabled or something has gone wrong, the query will be failed
>> + * with one of the following error codes:
>> + * -ENODEV: PXP not supported or disabled;
>> + * -EIO: fatal error occurred during init, so PXP will never be enabled;
>> + * -EINVAL: incorrect value provided as part of the query;
>> + * -EFAULT: error copying the memory between kernel and userspace.
>> + */
>> +struct drm_xe_query_pxp_status {
>> +	/** @status: current PXP status */
>> +	__u32 status;
>> +
>> +	/** @supported_session_types: bitmask of supported PXP session types */
>> +	__u32 supported_session_types;
>> +};
>> +
>>   /**
>>    * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>>    * structure to query device information
>> @@ -638,6 +664,7 @@ struct drm_xe_query_uc_fw_version {
>>    *    attributes.
>>    *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>>    *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
>> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>>    *
>>    * If size is set to 0, the driver fills it with the required size for
>>    * the requested type of data to query. If size is equal to the required
>> @@ -690,6 +717,7 @@ struct drm_xe_device_query {
>>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>>   #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>>   #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
>> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
>>   	/** @query: The type of data to query */
>>   	__u32 query;
>>   

