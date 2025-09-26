Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A489CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 16:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CAD10EAAE;
	Fri, 26 Sep 2025 16:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQCLJhw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F4B10EAAE
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758904975; x=1790440975;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/23494G4+WkMqHQwt91BYNjnTU6sbGCDXTBtyMN0tmQ=;
 b=IQCLJhw1I8OpjSsQuBH1rA0eqnCvjDTR9wyGHEcwcxUL8Fuj1eWHcYkl
 gEXTdwoBCjlNP0MhKFfq9ovseL8QERs/w0P8HCmLDCD1SG6jzUhgTiK9w
 da0TU/ihSY3aVitwzbsXjokCJAtgdhd0SuVX3q6/SHorvwZDgHkvWHzpO
 gH3hwBHWuT5G7DAMpc6LtGOi1U0+vn5F04sMJOL13pUozn/DMezXLIB6G
 yBqLfjq95qPxjxEFwJDlslFsYmpiOTuV/OZS8nSgPXJgn1Kpyo1lzSCqK
 Fo7zojpjNmU4OiZArjkw5Fjz/SKSy8h9KhsVR8ND4duQMxUphVlZCJL7G w==;
X-CSE-ConnectionGUID: IXm7CoonSaGVze4IRTfKhw==
X-CSE-MsgGUID: j3iE0UB5Qu25SCsmrYSeig==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="83853834"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="83853834"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:42:54 -0700
X-CSE-ConnectionGUID: 65GLSnixT6Spp0y5owMuyQ==
X-CSE-MsgGUID: m6kkJnBWQAqe9uEVTERHeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177497782"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 09:42:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:42:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 09:42:53 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 09:42:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5/RU1v4YxU5fWny/ijWCO+IFyphFNfesE3k/MV9K5bwE6wurdJ2a1hhkhiC3yUGiOSGNk+iLWQcvdUOqEvCrGAzccpLIxg+kzPRcXtwNSgadEILhoSK+RRtlONs422cW5qfn5R4VRSBe5n0+4MXAZp+dqJQ6zdMOzQPalKvj8D1SE73kEvvtzftM6afFUnibvA1hBMIrIISeg87s7tnTZT7i3/p7aNyz1ph4mgXrA4Y03wBnP8p0NBR42dB8Jwy6GbSAnRI5e/R2bMM9KtZ/Mhu43ozkcnsUPYQ5OW7glM9iRiFIoyUxBz8EQJ8BAxAn9H/kCmcoR16KXzGHAT65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLhl0ZTgH9IR2tAXU5ukYrnt6RakiQe89IeIFThAAC0=;
 b=CWxKxPXVoMTuWmj2Rkm9fuQoVdUdPpQ9rVxIOQYuZAIhCU81rQVuLy2BRkGd7rg6lA7jA9wdiZxB4ixslafkNCymRp+FeaiC9YHudF++ckGynKORS51MnD8IPcv2eNUSnEahHhMr3QDxFTi0t1DVLzpsqi/uTJeRFcy5mgiAxK9f5OYOVi9YWxWW3/j/xaYNQScERxu1QTFG8aq2EecpnM5zFs1lRdXTvRUmEKUqx1XL65yVJe3a4rReZlnXc727kIvS/30EfTh8s+0LEKJdxB58L2JMfdnvEOA1kGS00D3nhuDmK4k3fdKDQOSdKT+TYwq+A3Hpkg9Trjyh4KBh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 16:42:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 16:42:51 +0000
Date: Fri, 26 Sep 2025 11:42:48 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 06/22] drm/xe: Move 'has_flatccs' flag back to
 platform descriptor
Message-ID: <msdiemqxlqjovowfnm4kfl2lqu65jlktrvgoatgoo4ynhen3kb@mrnud7uota5p>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
 <20250925234628.2112163-30-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250925234628.2112163-30-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 357575cd-e466-432f-5de4-08ddfd1bbb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xUIiy02Q4zU/uIfRuSFFUSAjqOuPY8eeNfDB4F3cSMMwOcMqVnZTiG19V12s?=
 =?us-ascii?Q?ZtIroceZUAIMuSrGIsGHPtIX3M1TYCg2wXqqWoGSNUH/wUPL3HRJMnBvHo6H?=
 =?us-ascii?Q?P32QJ24gx7uJuksyWX6leLjIuDuZf/1xon8lEYMGdcztKmpzxKw0lUrSLIMK?=
 =?us-ascii?Q?5ELcQOkl9br8SY/ljkwXNQ4FL+4QCXrfYrH0zsA1EI8tlixIhJgPhf4QJVa6?=
 =?us-ascii?Q?q/ncuUawAbZZldP/Z7Gv52cHuaCuVlEwyeRutG/F0+Vm15iPL7+RQik/hMWu?=
 =?us-ascii?Q?PHYYJPCmMNuN36U6QbYoK/iRbz/QoFhtTrfBJmbPQw89cHTTKK/F9zcJor8D?=
 =?us-ascii?Q?2hy0TiLB9PsgL16CWCPZ6/FfShH+j9f8wV4du+OzL+DENF8KPGRpmf6nH7zM?=
 =?us-ascii?Q?zqvq22hHBEKi+/UdFBuKgyD72Hw/I+X5y8A338Z/X29SUVvZToPwQT8frIX6?=
 =?us-ascii?Q?HXsCMg6F+BmE6tdwN5/tIdypw76/cX77YNTMOftR0ejBzvFL3D20BdnX8YAU?=
 =?us-ascii?Q?qlO9RYgNMNH0bgf6QCn5X/Q+fxq+0w9KSSSEDfp3jpgVlatkpSKb6Azan6XS?=
 =?us-ascii?Q?nTzNo4LAE94vTmfSMan9XUsxQ816wthpw7HYrgzY7IGknRey83ibv4BJOqAU?=
 =?us-ascii?Q?Ch6rpprMKtfctkeR0Lk5DBJ6Ggs0rwizl3g2K2LSsXzyHzGED6ApAiDO3A7t?=
 =?us-ascii?Q?2zvdB71R6ivRsOauN+ly5ufbRcVfq2rvdwwWb3Oo/3tGiWV2b/l2bTjtaacn?=
 =?us-ascii?Q?SBLTrzaRakRud3Xxx6wdJ1qLg5YL64rOYkzccKfFH255SOM0w2DPC0sDgTqf?=
 =?us-ascii?Q?V6sebQXnNR0/YI94/w2M7aoQIl+plk86gA142SLCPbYhIc2t4G2EC4kkOHYE?=
 =?us-ascii?Q?P1hqLkzPKKHa7xiYgKm3tI2699kdEVCxPYsf+l9qt2WBte1MNsxaoc8+JcLQ?=
 =?us-ascii?Q?1GMHraHrQnNDQMaU9fZTY4zrKqTcB2ULZ9pH0P5QV76Eo9pn3cwFkUYfp86I?=
 =?us-ascii?Q?QZsXI5tgy3Oldt9QfMRbTj9wSTUjnMD45agxLuOL4Jm8yyOZAjIqciXQlDva?=
 =?us-ascii?Q?QycDSfnqt0LhuPkkj15j9EBgC8GN50lHMqJ1P0X/IuOSnTLPAzjM1E9qXh7I?=
 =?us-ascii?Q?qIl6//rCqv7re55nOCKIBySU5rTIL5W/ei34kRPBFRWPA9D8TxXdXCTVRMjl?=
 =?us-ascii?Q?Rlx3uzPtt7SlwcZj2V11M9c6g7eZGPdo9ODOTxS+aO04ZB9BXGjjl12iwkxn?=
 =?us-ascii?Q?sRqn3DYIgbQ0440rC5r3UgXJ/JogLv/Sdc8NKvyRmJm308SbX971G9iBEf/a?=
 =?us-ascii?Q?Ik/dyro2I5cetdCQKBvoF/UnAPDYn0A2lwZWcCTS/3r3Q1YjjuO0DEhAZzog?=
 =?us-ascii?Q?R0LfsdQsF02cWkoXWmYwyqjkmnoEOh8Wv7+dCO/bGH2KG5xatWglcOucZQPK?=
 =?us-ascii?Q?juAKGgTfAw81YmFevtfPYoux5PhzTLmn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sDo0mAmMxU/VUxykYHAZLIY8SsbSSTA7VCgnfUYK/ga80H3jJKQ7nnHELYYh?=
 =?us-ascii?Q?L89e3LgCBVRLnu3Bric9+1ujSKPVQYfHh/Gqz7fk9iSVndikgGozjoJbLxM9?=
 =?us-ascii?Q?yr+qIMUSbzB/lbsAFUopjX0jqQH/ZAxS8PTPnFs/1EtD+VhAhc4OIQRxkxxs?=
 =?us-ascii?Q?cn3X5szinVaF3/oTKMl/vpHyIAldMdhqESAQJuJLyfSCE+EITjDDici0N81S?=
 =?us-ascii?Q?gOBsOge9AujfmmTr7Vs1DpXIB5pFZNEn/DTjnTqY8+90wTziCqOdx+6TyzG+?=
 =?us-ascii?Q?kXbeKEh2iUa/53K5zpXuDulsNBfkx0igTrJB+KjugL0vHmNabWuPhv9gp4iU?=
 =?us-ascii?Q?GOPNYaFIw559CWigeVMyjpMbaxTMTDtFCsFxubSVPcG5ZZo5LsWJu9kjpAG1?=
 =?us-ascii?Q?Dy4rqgv4jGazWHPB8I76we+q3b6dbE+elQlktoIgIXTDHpm4s5yBGuavoAmV?=
 =?us-ascii?Q?LolPJiIzCxk/wg2DnX2gv2HoTVEr2t0gav/8WZYphCrYkYioqaeLSCO0HIGt?=
 =?us-ascii?Q?1i7ZhDNl1V7jnLU2KZUe/nVR2urcbYw8plNGkRhrFsBW3unPjZmUAZcpUr94?=
 =?us-ascii?Q?kj1J3Rey2JhQkXf3YjT0dxCPANvOPhjyrk0Q6gdfbpMgkH7mhbE9F1p+SF3C?=
 =?us-ascii?Q?IMZhKod41CTS+rS9n5JbNXU0bE3j3qZA/7AkmfLUOuRxRLs16hn74VFAdccY?=
 =?us-ascii?Q?htHszBuXCd8oIhtpO2+UQ2+gdutbYpkf+Ucl2+Mfd38kED6jYadMeRVK32MD?=
 =?us-ascii?Q?Mvy0+lfTuLf0+GOPPW10VMH0qm8aNiJZsspS43jBmr2nfLObzaxI1cE8krG0?=
 =?us-ascii?Q?2AHaaNpfRAarsmwNpRByIqRXX3VIe/wKZcVyYy5QCEQx0KSQVzq0DnPn+qpg?=
 =?us-ascii?Q?7lWNIduwCw1w1QTgEPpFU5UooI8LQllqui4wQwgcBYV2w62RLw5hRPxTuiQN?=
 =?us-ascii?Q?krhvI2t3q+ikUNIXuBOTe55sdKpgp41Yq38OYuSdQFrpysgXVhLMqaucy5Z6?=
 =?us-ascii?Q?r2fpyvbm2IcXFEOUT5/9mKTGNp5WHLTsOSzyd0KWXOlyh7SyrwcjGmB6aEam?=
 =?us-ascii?Q?ot0s+w2oYCf7IOeavv0MucUVjtGw2yIHNZcXyBbcytdYg2/0lrLAYct0GlEB?=
 =?us-ascii?Q?wATKhYFyfmlTLir+yo9jd703mxJeGJarf1Cl+yDVflJh66z4MKAqk28UDnoS?=
 =?us-ascii?Q?otJ9M5MygdEsGVOpyjhKUvqsjAKXDn2vmMvdLI4Cwr+EknfUzDazj/+Bu3Pu?=
 =?us-ascii?Q?30qFztg4IvOKcR4KXfpn9V14jXfUXeRq9LHGyp4z2dKqlh4d34TsiFoK34NL?=
 =?us-ascii?Q?IfrD4nd0OjnIJfIoQ13UoE2vzsXpiUHW6zrQDectyIFhmJZMLV3FM0zDip7B?=
 =?us-ascii?Q?fFHcgPmAczaDXaB09NZ9vo2/SUr/vn1BSPwZwUQKbTRtaMHq53LLO2bo8kej?=
 =?us-ascii?Q?p0z1VkM7A2XywdvPGva0mob4A8NFBuHcxXpZ1pFTDvTtJUNtF9dVRxMeXlnX?=
 =?us-ascii?Q?a645s9Dja3mm8K5sQw6AUt/pREgB/z7JDfNa7wTdzIsL0T4wV1SdPMaItwpy?=
 =?us-ascii?Q?zUXQdKOgyqxe6ls3jCewYLok/vYSJuX4xceMQFvtsSxyMJGVe2Q443qILU9C?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 357575cd-e466-432f-5de4-08ddfd1bbb94
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 16:42:51.0782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIilKq1gM2NwYDRe2km1RlFxadkBNKMeMbV8Rq4iz4dim6yiS53yyjSddC6o5H68cPmj06gog1d6rKSXQc0xbloZoBqauKfzl8+eAJSuh6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
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

On Thu, Sep 25, 2025 at 04:46:34PM -0700, Matt Roper wrote:
>FlatCCS presence/absence is a flag that should be tracked at the
>platform level rather than the IP level.  FlatCCS affects the
>device-wide memory initialization and reservations so its effects are
>not confined to a single IP block or GT.  This is also a trait that
>should be tied to the platform even if the graphics IP itself is not
>present (e.g., if we disable the primary GT via configfs).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
