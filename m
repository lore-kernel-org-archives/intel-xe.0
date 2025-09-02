Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5B5CA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 22:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8915710E055;
	Tue,  2 Sep 2025 22:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2jTFXBW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D57F10E055
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 22:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756851740; x=1788387740;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4GYdiHdL2AfUa47Z6SUh5e078nThSIP4WGqDXlWbyvs=;
 b=G2jTFXBW9kcd85PvXBxvYvDk1hM6esBpQa/OAS4cfc9FyFFJD3vWXLAV
 Uv2eUXBbMTki7/lnzTzKJY9Qcl0lE7qZK+rcgo8d9RuCAj5dYt9iuVdhm
 St6f9oruTAI94Y67NgQ0l5V6WtfkjH+Vb20FNA3E3QTmHqJ28a9uqqp+U
 rZWjR79/x3Cka+ns1DP/ORWsx4DCN04Tnir5mgAb7Zp+FQjL7aRj+pla6
 Zs53SWHmAo3JUREJiWuRQIHao+pd2PKVuCaRBpwEQm4NK0yGgWFnKCeXd
 RdzhMgoxuENh7t1/z7EhuJobAJPVLfgLGDyMMtfhDjNhtLVs1nOC54Dcd w==;
X-CSE-ConnectionGUID: rLXTWUzyS6S0cN8PYzTf4w==
X-CSE-MsgGUID: wgPtMlscTF+0/hGF9fJ/jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58365418"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58365418"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 15:22:20 -0700
X-CSE-ConnectionGUID: +QD8IE0qQZ6yTs24UwCXWw==
X-CSE-MsgGUID: SCBtanW/TCiNhiKBdAz4ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171561252"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 15:22:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 15:22:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 15:22:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 15:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kigeRdjuJJZ1aEjINwzpJxG5p/VwRBscH2c0MxCZlEYRDrneEjidQpDYUiOWKSLJLuIEzLkFYaUF19E9/7+14z+kV//U5vPkkLH0WPe4hu2VG7o5htSQZJYlB48/IuZRV9QJ5DagXwvKoIEiwsk5j/621QNAHUb6XDNTQi1UEdol6eQOP1456hoZSyXrx7J1qrLzmtU7yFFUEzuiOvzDrR4s63+57/tW8HbEC/c5pQZeDhnZcBY2hlRqGMuLpg9wLdo/gmln1dAQyJVOIGIHtL8UomvzxFp/8i3JUfG1gMLPJGnmDkxBXI/Q6jX1kIhC+Ue6eaaUU5HOc++gPaE2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ux8ywg6WZ4PHuj57qZaFGA9N7NTJOLixlF+kdLW8Frw=;
 b=PQq+6v/3pC2/ukCtAkNCD1qrxARNwyLrBmCZtbLYBn/ZaF/717cz6PCcmzzeqWEqGUJ8IQGt6WhMReL1OBClkfXLqwVfcc1YlkPLuRbd4pumGLweruZtb/Gc9ICgnEPyE+BytS5LfZuey4lnXtOBB+X9W0zGipHTW8s8g6fUiyZVW7pwojc7+DcGw8mmQyhvzzZW0dEcTcxfKOps54PH58MiQVPdQQA2RpsF8mMIzgMbXoNCWK+L3SFnKsbwgVan6mwfEEHZOR0sJbG0w1/04si/Hkl4fnRqeaH7C9vatTTVP4y0GscqYreeFTpr75nZlBTX0iO3zR6M8jTsG1cWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SJ2PR11MB8348.namprd11.prod.outlook.com (2603:10b6:a03:53a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 22:22:09 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 22:22:09 +0000
Message-ID: <74b1ada9-04ff-41d5-b0bc-45c28341d8f4@intel.com>
Date: Tue, 2 Sep 2025 15:22:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Set upper limit of H2G retries over CTB
To: <intel-xe@lists.freedesktop.org>
References: <20250902124850.5040-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20250902124850.5040-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0030.namprd16.prod.outlook.com (2603:10b6:907::43)
 To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SJ2PR11MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: ad77b5a7-2bc9-4fbf-0737-08ddea6f284a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWdML1E5SkNXSkFlVjZlVWVhOUhZKzJGUWFqWjhpbVNlUVRTeTBiVHEzazZw?=
 =?utf-8?B?bkNtendLWENBRFBOVGtTNDJ3OFRDOW9XU2hyK2RmUVBYbHg2U3NpRWhVZ1NH?=
 =?utf-8?B?Ym5Fc0J1SlFUSVlRcWhWY241VVVtNnJ2aXZ6blhWN050NzRRZ0hwUjVyRk1T?=
 =?utf-8?B?alQrdXVPUFduVU1vVGg2STBsZTVFQ25kUWovamdITGUyK2loUFNzcmErSURz?=
 =?utf-8?B?ajBZNFpGUXNBRlhTekhrcEpjR0VESWVjTmRkUURSTnNLdVA3cTVaQ3hDWjVu?=
 =?utf-8?B?S2dWOHc5bjhsSHVkNEhUVEJkQmRoYk5mdS9uVk1mUDVKNkxkc0hQSHlpeTZ1?=
 =?utf-8?B?WkVOZTlPRjB1RVEvZUtTREoxYUVZSmNyWjBpOTBsYnFwaW02MFZzWlh5d3R5?=
 =?utf-8?B?alZsYWg5c0JaRFdDNUZFQWtINEp4THRIVUdGVzJITVZvOG13SDczZUJKdHFS?=
 =?utf-8?B?QVUrbGNxQ1F3UE1zL3RMN2tkb2xwUXk3YXpvWDR6V0pEUWZ4U2NxSitNb1J2?=
 =?utf-8?B?dW5nQzc5OUhpRGtJNzlORHJhZy9qdHdUSzFlQ1VZSUdmNnAzd0djSlNUQkNW?=
 =?utf-8?B?VGlDSjlnYWZPaXdSZ0VLMjdrcFJ1Z1J6NitheXhzbjdYTzlYOWczOE1HVmlZ?=
 =?utf-8?B?S2swbUxOdFhWeVNmM2svaDBqeVpleGZQdEdUVVAxWWxtOG52clRlZldySy9j?=
 =?utf-8?B?Z2t1Y2Eyay8rV2lpVi92eEk5TjdsOUNxR2RRZ3h2aldESVh5OVJJWkxuZ1JV?=
 =?utf-8?B?L3B5Qnk1b2xLZmxCRFJoWWVvUjNSUWp5b214ZFIwNmM5M0tVejF1Y1k3OEFu?=
 =?utf-8?B?U1gyQ3RyTDVJKzl6TXBPeE9NRE5QS1lDU2VmZXJMMkJnbVEwc2MrYXg5dmZ5?=
 =?utf-8?B?bUlkbEx2andPUU1XU2NxZEkzcDUvd2tMZTYxcHdTTjlDZzlGTVZhTnlvamdC?=
 =?utf-8?B?blJtTXRMMWJ0TC9ObTZkUXBmcmpFYVNpYWMwTzdwWjh0RHRycWQvbjdKb0J5?=
 =?utf-8?B?cVdBUmZyMG9NcVdxQXNoNHJvSjk2bzFwVWdLSEU3Zit0NFZtRitLa21BK2Iw?=
 =?utf-8?B?S1hGcVdQSmcrZ1YwWnhvZE9NTVJCa2lqSjhEMVkrenpIV1RSdTNBV2hXb0Jw?=
 =?utf-8?B?QzRBVnMwd1JtVVFGMXp3OStMaWxNUlplVjRlM0FUaUh3M0k4Ri96UlpMY01K?=
 =?utf-8?B?YjRuK0EwbXMyNWIrNzlaYVBZV2RzYlFBSDRxMms5Tng2MDlkS1RJY1Y2Qm1z?=
 =?utf-8?B?K3ZWVzJ5WEdVbldxbERoM1ZpNmplV2RmZ0NrNU4rSzl2Z3FUa2Fsb1BHQ3Ay?=
 =?utf-8?B?RWlwTGgwVmpvSllaWG01bmdBM3AyVmNJRzF0UVdPVklnOUJhM2o1dU9RSytJ?=
 =?utf-8?B?WGx1NldBTEVZemEwMStXOUkzazYyd3RrZDZscHhhZis0UmFDYXdpR2xkS0Q1?=
 =?utf-8?B?Q3ZENlJOeDVuZ0NXV0N4cXRKS0lmY0RIWTlLNUJnamxDTHZZK3FzdGN1T1dw?=
 =?utf-8?B?S1IxRmlxbHQzV1pEazdKWkZaR0NBaGNPTE9lWGg5a1dlQzFKbWx0QmFJNWtv?=
 =?utf-8?B?SG9qY1d6ZEhRdDlidHUwWHJPNnNyYmF0N2Z2ZEdhczltcktBZDMzNnZUTTV2?=
 =?utf-8?B?Q2wxd1lWUmI1NitncGphZzZQSkluQ2JLenc0WlQzY3lZeTJZQWdZUUNHVTAx?=
 =?utf-8?B?RVM1ZGErWGtZUUZmU1BOcWxkNVBTQVgvMzJMaVI0Tk1PRW96TnJrazJkSkFK?=
 =?utf-8?B?TzcwWjZEKzF4MmxtK1R0YlF2cUljSkNtMStDQkp1TEdaU2Y0MWtuVm1MYWgx?=
 =?utf-8?B?Wnh2Umk4OVAybXBhRFhicW5yYzAvQXdLaVRCdHhmRlY1OFE4U1RkWEc1OEtO?=
 =?utf-8?B?TkhVTEZ6eXQwYU80UVF2amRMUEgrVnp4d1l2OG5zMHZSN1RPRHorSjcrNElD?=
 =?utf-8?Q?LJhYb83/aGs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmVoQlVUQ0orWmVxUS9oblZWRW5NMTlEMVZjelJoU0pnTmtvSjNpd0NhUnZH?=
 =?utf-8?B?K2tXQ1pyc2ZGNXRLQzFKaXBmUnRjMTRxYmQ3dkMvdkl6UTFQNmZ2OXp0MlQx?=
 =?utf-8?B?NENNWUduYmJveWZkUUU3MDJCR3lFaGRweEdsL21Od1h5MnptVURpNy9XYXlR?=
 =?utf-8?B?ZHBrNDBjUTRZMkFVd1ZQOWdYLzJ6VVhmemN6TlZ2Nm55a0N3NVVTSGwzVjRJ?=
 =?utf-8?B?S2Fyd2lWaXFYMjh2ZDhhQzI2Z1ZQMExPY2U5MjlzUFNoR3o3dU5EVFpDcjFR?=
 =?utf-8?B?eWtPcXYzUDBoZE1YbDMxc1FjYzBGRVNVaUZhd3RFZWNkUllMaEpVWk8xMkU4?=
 =?utf-8?B?Um5SVDFUYWVyVjc2bDU5K095cCsvWHp1TGlhTGhFSmVxWTdIZDB0TWVxK2Ez?=
 =?utf-8?B?UFlHU1pwLzhvQklHZFJHcWVMdGxNaGpGcURHdCtFZ1RFeTU1OEgvZklEWSs3?=
 =?utf-8?B?ek83YS80VlVOcXlVaUNpZW44a21zMlVVSmo4UVcyL29aVVpiWVJkTzlDZUQx?=
 =?utf-8?B?Wi9ZYnBDc2pxTFFYUUhJNHJUNUJhRGJ1NTVrNWhxWmVDbmlVYVNqalp0TkFK?=
 =?utf-8?B?Y1NDbjVVeFVHeGtDYXg2QngwK092WXpHUnVHeS8raHZRMG1hVHB6RkZBZXlv?=
 =?utf-8?B?Q0wrUXRUR0hmQThxK1p3MitHMldQVHEza20vQmxaL0JXRCtaSWVzQ3NoV1ZH?=
 =?utf-8?B?T0ZvK1o4MVpaUkNRSWdQemVHblY5aDhvYmtKUk1rdXVlZHU4ZXNCTU56SCts?=
 =?utf-8?B?YnMraGFXM2g0dThUQ05KN0R5V2pGczZzajdjTzh6enViZWplYW04TktJSGRS?=
 =?utf-8?B?NmpjLy9VWk9YeTd1eENwclZMUiszU290aE80NDdDZ2cwZXN5blNnb0s3bW1J?=
 =?utf-8?B?T2FSQzVTdkJ6cWs1eTIzZzJjWTFYVzlBaHkwOVpNclo2bmFDQU9IZWg2YVNJ?=
 =?utf-8?B?aXdteUFYTWF1S01RTk0wMmpnazVHN0hiRXNBeHh3eHNDNlNFQmZxNlMvWmJZ?=
 =?utf-8?B?MkJWS3RTMi9oaUJ0Q3JMaGRVUFo1Q1hLb2dMK3lEWFdITzVBVjJZNHZkYjRT?=
 =?utf-8?B?SnpYclpxR1BXR00zdThBenowa2Evb25lRGxLanlwdGFmQlN2UXRQZVdxczdy?=
 =?utf-8?B?STh6bTFpVXpsUlhSLzQwWC9lKzdGRmJSNCszVzd4YVRMemw3WUVCcmloeUI3?=
 =?utf-8?B?dmpPQ0tsSGpncmtZL0lkeVV3Z1FMeFovMmZWMjU0T1MxMWtMZXZ4VWxHM0ln?=
 =?utf-8?B?TEUwL0pkVjRzYlhWUnAzSytwaUh4ZUFRTjRka09QTUZNNzJBWVYyR3pHbFFR?=
 =?utf-8?B?ZnNCU21SWHZMS3VBRHZ1MjJOWHZwWWN1Z1hFU2hYNGJtY0s1Q3VSYkhZMTZF?=
 =?utf-8?B?U0tCalBZb1RzYWZoT3JoejV0M295R21PL084QTJkUlJ1aHV4NGdtYXpjeG5l?=
 =?utf-8?B?ckxlTjdHTGhaZkZ5UHpFZTlIOUx6Q3ZabHhDQUdQV0g4bmF1eUdxWGJac1NO?=
 =?utf-8?B?NW1XYUFCS3BjYVVZL2dkMlQrcFBXUFdrSENadVZRZzNiQnpEZC9Xc2RrVCty?=
 =?utf-8?B?Zkd1VC9nVUNUVzJRR2lWK1N1UUNLTTkvcHBra3hBUEFuZXBaMVlOOFQ2VzZj?=
 =?utf-8?B?K29YYThjbklNRmNDQUxqeDdUUFE5eVdnOHJ0aTRyK0xsMlMzbFZvcUlqSkhl?=
 =?utf-8?B?Zmg3V2NXaDczU1krNUllVzFhcFVoN2NpTS9rckY4MjluYmhMYlh6Z3lFa1dw?=
 =?utf-8?B?alBkMTRqYWVXdVZLUldRUHFiajc5bmw5MEFEMENGalZtdG1TbjBCVGNyYmdl?=
 =?utf-8?B?SmVndFZaMlJoSE5XVlV1NGg4Qmc5K0dQSU4zdEI2WmZsR25nTENDT2xsdVpI?=
 =?utf-8?B?bHpDWUpXbEdaNGJXKzZZMXVIb3BNSTQvdmRHOHV5Mk84VUZDQ041WkNuaUUz?=
 =?utf-8?B?dENVRUV5NWxVZXVnYW0wOUlHUFU1ZW90WGlRaGNWWXRzbHNNMERhYm5OT0hr?=
 =?utf-8?B?TjR2Smk5aFhtUVQ1NUFjWVVwMkp1b0lCc1VZRHN5K0g4TEhXQzZrR29SVEZK?=
 =?utf-8?B?d21sMjM2c3ZLaXovcGNGcHorWWZuSWhTVEg1TDBPdGlRNmR3VUhwR2RKN1Iv?=
 =?utf-8?B?THhDQkhwTFI4RTlpejZpSVpnNFpLVHRvSUFOMmlacnllYyt6STJQVXlkQ09v?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad77b5a7-2bc9-4fbf-0737-08ddea6f284a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 22:22:09.6637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzcQslQOXq3blRzaFUcA4kJ7U8NyRJES/oowgtGzPxXWf6breRT/FxDUweQbmMXzVDJwc8GMnXBS4HkWS41zaFfnmtTQQ80pUgRGTOPfleI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8348
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


LGTM

Total time sleeping goes up-to ~25 seconds. Could be reasonable to limit to 50
retry attempts to limit total time to only ~6 seconds.

100/2*(100+1)*5/1k = 25.25s
50/2*(50+1)*5/1k = 6.375s

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

On 9/2/2025 5:48 AM, Michal Wajdeczko wrote:
> The GuC communication protocol allows GuC to send NO_RESPONSE_RETRY
> reply message to indicate that due to some interim condition it can
> not handle incoming H2G request and the host shall resend it.
> 
> But in some cases, due to errors, this unsatisfied condition might
> be final and this could lead to endless retries as it was recently
> seen on the CI:
> 
>  [drm] GT0: PF: VF1 FLR didn't finish in 5000 ms (-ETIMEDOUT)
>  [drm] GT0: PF: VF1 resource sanitizing failed (-ETIMEDOUT)
>  [drm] GT0: PF: VF1 FLR failed!
>  [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
>  [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
>  [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
>  [drm:guc_ct_send_recv [xe]] GT0: H2G action 0x5503 retrying: reason 0x0
> 
> To avoid such dangerous loops allow only limited number of retries
> (for now 100) and add some delays to slow down the rate of resending
> this repeated request.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e431ff73227c..9738888531e8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1079,11 +1079,15 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  	return true;
>  }
>  
> +#define GUC_SEND_RETRY_LIMIT	100
> +#define GUC_SEND_RETRY_MSLEEP	5
> +
>  static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			    u32 *response_buffer, bool no_fail)
>  {
>  	struct xe_gt *gt = ct_to_gt(ct);
>  	struct g2h_fence g2h_fence;
> +	unsigned int retries = 0;
>  	int ret = 0;
>  
>  	/*
> @@ -1148,6 +1152,12 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  		xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
>  			  action[0], g2h_fence.reason);
>  		mutex_unlock(&ct->lock);
> +		if (++retries > GUC_SEND_RETRY_LIMIT) {
> +			xe_gt_err(gt, "H2G action %#x reached retry limit=%u, aborting\n",
> +				  action[0], GUC_SEND_RETRY_LIMIT);
> +			return -ELOOP;
> +		}
> +		msleep(GUC_SEND_RETRY_MSLEEP * retries);
>  		goto retry;
>  	}
>  	if (g2h_fence.fail) {

