Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1A6C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 22:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57BF10E140;
	Fri, 14 Jun 2024 22:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abvy/lXF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30B210E2B9
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 22:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718404878; x=1749940878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kOK6VLl7zoEwTflaxa2QMF4/HoXTrkkO2UjDahf2eZI=;
 b=abvy/lXFrwb78SuMIVFOWTxPjK92ltQjDy3CkmpnMkQV35uW0N3Q8yOp
 3rHwcNggMMHEtCkveMJ+z9KOfvIF2kJhHjmdrFrwJ9VhI+624gELvO8jl
 cOJIIiiPrvcXedJ9TiVUBBWnPmK97qfPva4vDKC5ACTOoPCWMi6VeY6/A
 NXOZkkrWCpqZmlNde64pV8XaveAG0O0WKq2RmqKq+8nEyf6gV5vm+SzZC
 dm4VsTveP/1lFOWVvkQttnkKlxyYMa5XgspqH5SJkFcBIKp4JV7VQHI7e
 Odt+YyIux6PKj6YpwrxOTy9rmZjTj3uF4t+y/d23dmcKs3zslWKuSl9cw Q==;
X-CSE-ConnectionGUID: xqzzJwHmSmisX/RHSvv38w==
X-CSE-MsgGUID: mCuw65aURfuBC1t4U9LXpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15149499"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="15149499"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 15:41:16 -0700
X-CSE-ConnectionGUID: U0cOVK+wTuiwM+8x7Pg9yQ==
X-CSE-MsgGUID: IpNEdgSWTTSR/PfsAQaFTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="40787145"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 15:41:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 15:41:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 15:41:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 15:41:15 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 15:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5Ga2DbkYANueGkwRtefdsnqDwLfkc8sWqGKaw22w1QZrGiqJ9iRp1ClpxX3jZoZqhFklaobqJvfuhV/cxI1M2ePHvfKDeJZbE7uCTqRu65mE/r7o+BmnkWxcuaeTJ1J9syOZRv7dJjqhr3Rb8TddD70m+H2rlnsIPrXCpBT1iIpdIrR7ec3r6Tq27s88yR9wK0Te/SfhNpGD3+xaVzeJ6V1cY7ejmXi2YavUjcB7OP1DQ/e4Pb27wuTuPErlzV1gyEa+82RhoCGljC22xnVBa+fSO6G78A9qVh7qZsjyE3uhqEuKqzsk/auLYUWpwS4yGcp9EvWEC0QWIm2I8803A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9wsdODGim6lX+YdnMPXBMGPJ86SjniL3NXMoYAJR/w=;
 b=BcsyDjwF/VRIoXDzVnQK+msszFF4EkvRhcf2Qss2tW0VItjfIuVwkZjVfGsySYvfla2ezBTysRPR15u7TifrIuBg7gcPFpzvzXAK22nsaw955nLgfN91PXZN35O2fBl6iAwaFHS1ZJdKPdNkN8t2CWuUylwDc8YjZPJUCdOXiBvbB/VDy94jVziO/5KKFaUqiZAquslpc6FOCHhOMlwReJku99WCthWbqMCT0MyuZOwNld+9dh4scjSMlg6vJjkWB63oePOZSJkTHXlqDXkmK1pQaEcj6zoJp4saqjyzmUY3vG4vuGz/h4n/Ew2cC560LygjiwYdg0kjs5X/MaurXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA1PR11MB6145.namprd11.prod.outlook.com (2603:10b6:208:3ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 22:41:07 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%6]) with mapi id 15.20.7677.026; Fri, 14 Jun 2024
 22:41:07 +0000
Message-ID: <a7f48feb-0c0d-43f9-9b27-9d0b3535176c@intel.com>
Date: Fri, 14 Jun 2024 15:40:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/lnl: Apply Wa_22019338487
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240610185231.1451157-1-vinay.belgaumkar@intel.com>
 <ZmdehmvY7EyLl0GF@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZmdehmvY7EyLl0GF@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::47) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA1PR11MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e51952-049b-413a-de24-08dc8cc30904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWV3YlVpcTAyZk16SUJ2eU5NdUdtQnBBaldHMjRnb2dQTFFzSitnN1NBc2VX?=
 =?utf-8?B?MXMxSTJLRFo0S2FUeUU3WEZaVGJaM2xUYi9SNkNwNmVpZXVtWmFvYVBydXRq?=
 =?utf-8?B?TEMwM1lkSkp2OXh6SEg3WTRBU2VwY0VSeDZtc2NwSWNnMEZIUFhsN3dFNS84?=
 =?utf-8?B?NUJZWG5kRHZ0RE9XcFV6dmpQMVFwTExZR2pHYTBvZ0xGV2JCNGhPYTVjSVEv?=
 =?utf-8?B?TU9yYUdQQ2Mzb0pPeVVhaVp1dU1ZOS80NVd3N1p4d3hqeCttQlIwa3BkTTNs?=
 =?utf-8?B?QjRVRDFYYkdLZkhkRWhiMk13RFRKMDRqYitvWExabHl5dFZBR3dBdGM1MUtW?=
 =?utf-8?B?T2pKNjIrb0lqaGpsVC9oaFRDRDlwdmlWbW1LTHVRdGZzazFpOXFPaVovRGdu?=
 =?utf-8?B?RkhBMmkxUUdzVnZVbGVyYW8zUm42bkxGQm9vSzB2M0x0TzQ3ZzFwT2VONjNO?=
 =?utf-8?B?TW4xSFNzZnRGVm1BMnFrT1VpMUQvc3FZYTBQdU1mRHk3YkZSVXJaQ2pXbXFt?=
 =?utf-8?B?NlVjL1NGcVg2b2ZiSXA1NTF0a1Y1ZVVHdzFSOERZV3hILzlmSFhJb0ppZ0x4?=
 =?utf-8?B?Y3k0c2J5UHQ3RDdkTmRGSm9jb1AwWjlnb0g5SG5pSVJvdE03MDFzVFFCc1k5?=
 =?utf-8?B?ZUJCTTduckJjVTJLVVFYN3NEUmE4YnF5QzZSR0NiL2t5a0RDelN4ZlI2Z0hw?=
 =?utf-8?B?TGhrUzJ6RW02ZFNPb1B0dnlFU1p6ZUVUbkdZTFd0VXM1elIzNkdFcTRiM2Zn?=
 =?utf-8?B?dVJkUllyZGNTZVdJbUdRRUhKWUZQaTUxNEkwNXd3Y3grUFc2c2dLTVNwUWNO?=
 =?utf-8?B?T0t4T3dMd1haQkQya01IYXc3VXVveWkzbUluRnVBN1pNSTY4NlQrR3AzK2lk?=
 =?utf-8?B?bHB6dVl0V2cwOWxCcEpkbERvbjRlSzdwTHpCTFV5bzVtOGJBR1JJblFHVUtP?=
 =?utf-8?B?a0ZHV2dYMFhpOG9sWkV4ZnZJaVFTV1llTHJ1LzE4ZDN0SS9IUlR5UVEzdTBp?=
 =?utf-8?B?UlhZeTRSTktVUWg1NXA0ekV6VjA4Y0UyK1JpYVM1Y1paNWNXTjNqaENTU0NY?=
 =?utf-8?B?d0Z2dzNTR0xRRzk3bzlzME9hSDRrVzRSWjgwbTBwdFN1WHhIdmx4WnhYemVW?=
 =?utf-8?B?eVNGRStZaFhFclVJOFpLemhuMzZXWCtRVzBNaWNhSTA5TzIvRTU3eEFlMVhx?=
 =?utf-8?B?M3ZrT09rejlQNFBxcStOQWZuRzllU2k2N2lSWUhKNWpoZ2ZvTzMva1BQZFBy?=
 =?utf-8?B?dUNkUjZjTVd1TXFkcEV2NnBYYVhXbGlQV1h3VXQ5eWFHc21nd0dKWEVCU1Rh?=
 =?utf-8?B?VHhmMXVsYU1MWERJaHBNTUtXUE5jUEY4UW5xS1dUbTZkNk9NWmhYRTA1bDJ0?=
 =?utf-8?B?bk9CZTNzUDh5OFVQbHhVZmh6THBDcTRBT3ZYMVBTZFR3Zk9Dc1FVc2tXWTBh?=
 =?utf-8?B?VHBya25QemFCMytQWm54ZDZuaUZuMTRYcDNpK25VRTFhZnljTmZjSlc3Njh5?=
 =?utf-8?B?MW5CMnBTTjJ3VVZpYmsvY1NyRWRjcXJxdHhUckpKbUhBRG42d2NDU3l1aS9x?=
 =?utf-8?B?NXh2N1RGQ09Od3lYRHlhU0hzTndFR1ZLdVdWTUVNSlIyZkdzQlVPRE9xUWtY?=
 =?utf-8?B?YlNMN1pTV3ZkZjBuY1R6b1l4V2dybGwrQ2VIYXlzRG1xbUw2eFh4VmJwTVRj?=
 =?utf-8?B?UHlLNlptNnBoczRnM1dEdlovQzN6Z25VRzU1M1gxZUNEVndwdlFmM200U282?=
 =?utf-8?Q?nA8KIb1Dc7uyOiLOE5HM9rFlX1vMG1uQBJA2luP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDlQRVQzRTBnR2VibmRNcVRmMVRwbC9zSUtpbG5sWGhQZ2RyRnBVbmRzbXlq?=
 =?utf-8?B?cTYxeVdGOWo5bHZULzVzbU0zSWpsdUxKMnZtSWRtMlNTUGZCME9zM0J5WEI1?=
 =?utf-8?B?aDNWTWF2Q3dYYkJhRVJMSmt0ZnM5SHpRTVhSd29yc292djM5OEVSc0F3cEU0?=
 =?utf-8?B?TXhZMTZpR05sOTlhb1VkTG9GTm1zQk8yNWFyUENZWmprc1g2WktwWFE2M1Rm?=
 =?utf-8?B?MldRUkk0d1ljeGlVQjVsdWs2ZzdVbkhwVnZHZVVzdDhRVXc2ZmpqSVR6V2hJ?=
 =?utf-8?B?d1YxRTFxczNVSHIyM1FnTzE2YzF4SFhRdlJhU25mTitjNnRtZSt1cTBILzVM?=
 =?utf-8?B?K2I3QVQ4NmdyK0gzc3VYeDRINE43ZnR1dmZsYWlzbVorMkN3UXRQeStneGhI?=
 =?utf-8?B?TXVIS1BZYmtEeDNVQUZ3SzFxVXJ6UHMxYzN6UEx1N0V1OWFlQUJQUUVqSDl4?=
 =?utf-8?B?N3R4MHYybndtRTBiUi8vK3VsZzJCUFhiLy9PZ0NoNDhOc0xOczlDTE1CRHpH?=
 =?utf-8?B?L0pRa3FGdFBHaGhBV3IwNkkvVVZxWDFhWktybHdrcjJTWXlEa3FjTC9xRzNv?=
 =?utf-8?B?TlpRQTZRVWQzMkN3V0JJSzhKV3pqVWpMNW9nNTJIMUtVMVlYckFBSGVSOUIr?=
 =?utf-8?B?Tk11SDBPcmFwQ252anE4WHhlRGgvMmJuNmlESkphK3hQTE5XVG5nNzM5U0p3?=
 =?utf-8?B?REFhQ0h6WEJ3bE1ON005Q3hScFV6QldNZmlJbXpCR01GcVh0ejdJRXloYUJ3?=
 =?utf-8?B?aXM3TXRZbGNUMjNhTjh3R01jYTZmdmh1dU51SHcvRWNiYldteTNhWENZeTJ5?=
 =?utf-8?B?M3I2NEkvSnBPcEVJdHd4WEZrZWNKSS9EWEpKV0lCQTFqaDlCNWZPOGNKQWtF?=
 =?utf-8?B?RzJlYlVKMUdzWnJJSnAxK3I4Z1JuRnBhenI1dmFDZnU1dGFzcDdaYTk3S01u?=
 =?utf-8?B?S2d1UzlhV0k1cmlIRjY4VEdJQk1yYkVWU2VnVFI3UjgxbjVmVW16QmpyZWRr?=
 =?utf-8?B?cHRpeWlkRE4wM1h2citLQVoxMkU4VlNKMDErUDZzV0FlaFNVVlFPQWg3a3Jh?=
 =?utf-8?B?Z09wWjFqM0UrZGhybUtybEsrOHlNNmZ3OXZvK0ZUbkIwVG9NTDd5NklwRDA5?=
 =?utf-8?B?Y0tWOFFmOFk4K1VvQjdjVU1pR28xREJFRGRsenl1OSsvbzM1UHRCUElPbFla?=
 =?utf-8?B?VXFoc0xRY2tLdDQzNGtzdmYraHJMc05qM1NuM2M1d2FmaHlSRVBObDFFZ1U5?=
 =?utf-8?B?czlFcEpnUG1sRW5QalR5bktOYlBZUGhCUlhsWHo2QU43b1BwOTBIUW1oRzlI?=
 =?utf-8?B?aVUrbTZnVyt3OGxXTktVUzQ0K3ZnSVpZN1dWOGlOQVRDVlNKVTkzRGhEVGRs?=
 =?utf-8?B?OFpJbHZXaEpVTFp6eUtKMnAyRXk5VmZqUXhENGxDaUcyZkFURmIreWhZckxK?=
 =?utf-8?B?em5PeUJWaExzMll0aFFITVhSdStpOVBlM0MzSTlrOUlmY3hLUmd5Zmx0SUVY?=
 =?utf-8?B?WDZYUWpCdzhsa1ZLZ1Q0UGpzbE9RRFk4WHFzUkorUWtTYlVUTGRrOEhHUUhq?=
 =?utf-8?B?Qkg5VkVoczZkZmJtcXZBZStPeGlxZ1orajhHRUhaWm1lK1RvK2lYWGRoSTNu?=
 =?utf-8?B?WlQvdWhZeDdsOEZLSS96WkgzOTFHY2xJTlg0d1JlRUk1SDdUN1Bza1QzVDZU?=
 =?utf-8?B?a1daSjcvL0NublBZVGl3U1gzR1Q5enYzb0NiV1BWc0luRmVzanBlQnlzWXY1?=
 =?utf-8?B?Z0c2cE41WFMra0FyaEpIOFczOC9Sa1g0TGhSYjNNeFh6U3A1bWFNTkR3UjBn?=
 =?utf-8?B?QkY5ajY4RDF2Z3o5ei9BT0E0dkFzYUk2NFkzTFlUOUF2N05MU1FXTTA0YWdR?=
 =?utf-8?B?MDRuT2d0UUdTTmFXQ1ZtbG96YnNiSXF1cVVpNWhSSG1kSFBLRWNqN0NqMzVU?=
 =?utf-8?B?dWpFMkRtellQVzRtdGdUZkF5dkU2UEVYK1N1c0lkQ2FOaE83M0V6aGY2cTNJ?=
 =?utf-8?B?dHZHTUVPL1c4L0lKbWxBbHdpd1EwbTZhOFFhNE1zNWQ1OWd4MXk3cVFVMzF4?=
 =?utf-8?B?ejdyNE1EeVdHY243aktlckR4N3dIeUE2aTVEUGc3RE9nQkRiMmdtUjZoNit6?=
 =?utf-8?B?azFBQnJoa1ZWYjFFdFNaNlRjS2gxWTVPT0k0MEh6T1RQRTRqS2ZpZS8zMnFm?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e51952-049b-413a-de24-08dc8cc30904
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 22:41:07.0685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Zp0ir6/pVOwyypbqUjbN4AuReI8Sjue3iSkpAC6KN0Xw8MkWxX74Hsa3EOLH0a2AI9K6WrRWwGztCiZfxyzGav/WhZvoDy0w8cMXmYqje0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6145
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


On 6/10/2024 1:13 PM, Rodrigo Vivi wrote:
> On Mon, Jun 10, 2024 at 11:52:31AM -0700, Vinay Belgaumkar wrote:
>> This WA requires us to limit media GT frequency requests to a certain
>> cap value during driver load. Freq limits are restored after load
>> completes, so perf will not be affected during normal operations.
>>
>> During normal driver operation, this WA requires dummy writes to media
>> offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
>> of the LMEM writes originating from Gunit.
>>
>> During driver unload(before FLR), the WA requires that we set requested
>> frequency to the cap value again.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  2 +
>>   drivers/gpu/drm/xe/xe_device.c       | 10 ++++
>>   drivers/gpu/drm/xe/xe_ggtt.c         | 19 ++++++
>>   drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
>>   drivers/gpu/drm/xe/xe_gsc.c          |  4 ++
>>   drivers/gpu/drm/xe/xe_gt.c           |  2 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 87 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_pc.h       |  4 ++
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>>   10 files changed, 134 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 478acc94a71c..ab282070fedf 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -24,9 +24,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>   	$(call cmd,wa_oob)
>>   
>>   uses_generated_oob := \
>> +	$(obj)/xe_ggtt.o \
>>   	$(obj)/xe_gsc.o \
>>   	$(obj)/xe_guc.o \
>>   	$(obj)/xe_guc_ads.o \
>> +	$(obj)/xe_guc_pc.o \
>>   	$(obj)/xe_migrate.o \
>>   	$(obj)/xe_ring_ops.o \
>>   	$(obj)/xe_vm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 94dbfe5cf19c..6450cccb1771 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -37,6 +37,7 @@
>>   #include "xe_gt_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_guc.h"
>> +#include "xe_guc_pc.h"
> does it make sense to introduce this dependency at the device level?
> or perhaps this should be part of the gt_idle which then, if using
> guc it calls there?
Ok, will add a wrapper in xe_gt.c instead.
>
>>   #include "xe_hwmon.h"
>>   #include "xe_irq.h"
>>   #include "xe_memirq.h"
>> @@ -50,6 +51,7 @@
>>   #include "xe_tile.h"
>>   #include "xe_ttm_stolen_mgr.h"
>>   #include "xe_ttm_sys_mgr.h"
>> +#include "xe_uc_fw.h"
>>   #include "xe_vm.h"
>>   #include "xe_vram.h"
>>   #include "xe_wait_user_fence.h"
>> @@ -668,6 +670,12 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_hwmon_register(xe);
>>   
>> +	/* Wa_22019338487: Restore GT/Media freq now if GSC is not being loaded. */
>> +	for_each_gt(gt, xe, id) {
>> +		if (!xe_uc_fw_is_available(&gt->uc.gsc.fw))
>> +			xe_guc_pc_wa_22019338487_end(&gt->uc.guc.pc);
>> +	}
> please move this to a function inside guc_pc...
> perhaps calling the function
> xe_guc_pc_sanitize_freq()
>
> But please keep the probe cleaning calling one component that makes sense.
>
> hmm... perhaps instead of guc_pc or gt_idle we should use uc_fw component,
> since we check uc_fw gsc availability to then call for the guc_pc sanitize?
> But anyway, please do not call the workaround names in the function. Let's
> define a generic flow in which the workaround is the underneath static call,
> but not the exported one.
ok.
>
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>   
>>   err_fini_display:
>> @@ -701,6 +709,8 @@ void xe_device_remove(struct xe_device *xe)
>>   	struct xe_gt *gt;
>>   	u8 id;
>>   
>> +	xe_guc_pc_wa_22019338487_fini(xe);
> end? fini? what's the difference?
> Perhaps this should be a registration with devm or drmm instead of this
> direct call here?
end was supposed to be after driver loads and fini is for driver unload. 
Anyways, can do the fini part in the devm for xe_guc_pc.
>
> and again, please not workaround name in the function name.
> Make a generic flow in which w/a is underneath, not the ultimate
> exported call.
ok.
>
>> +
>>   	xe_device_remove_display(xe);
>>   
>>   	xe_display_fini(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 8ff91fd1b7c8..58d177be724a 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/intel/i915_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_gtt_defs.h"
>> @@ -23,8 +24,10 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_map.h"
>> +#include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>> +#include "xe_wa.h"
>>   #include "xe_wopcm.h"
>>   
>>   static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>> @@ -69,12 +72,28 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>>   	return ggms ? SZ_1M << ggms : 0;
>>   }
>>   
>> +static void apply_wa_22019338487(struct xe_ggtt *ggtt)
> For the record:
> for the static non exported functions it is okay to have the workaround name,
> But please, prefer to highlight what it is doing instead of why the fn
> exists... something like ggtt_update_access_counter
>
>> +{
>> +	/*
>> +	 * 22019338487: GMD_ID is a RO register, a dummy write forces gunit
> Please wa_22019338487:
>
>> +	 * to wait for completion of prior GTT writes before letting this through.
>> +	 */
>> +	if (XE_WA(ggtt->tile->media_gt, 22019338487)) {
>> +		if (++ggtt->update_count > 63) {
>> +			xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
>> +			ggtt->update_count = 0;
>> +		}
>> +	}
>> +}
>> +
>>   void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>>   {
>>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
>>   	xe_tile_assert(ggtt->tile, addr < ggtt->size);
>> +	lockdep_assert_held(&ggtt->lock);
> it looks like the assert should be in the above function, not here...
ok.
>
>>   
>>   	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>> +	apply_wa_22019338487(ggtt);
>>   }
>>   
>>   static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> index d8c584d9a8c3..89b721205d2d 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> @@ -34,6 +34,8 @@ struct xe_ggtt {
>>   	const struct xe_ggtt_pt_ops *pt_ops;
>>   
>>   	struct drm_mm mm;
>> +
>> +	unsigned int update_count;
> access_count?
>
> perhaps we should increase it regardless the w/a and then print it on debugfs?
> and then for the wa itself we just use a mod % 64 == 0 to apply the w/a?
> but no strong opinion on this...
The only issue I see is if we increment regardless, there is a chance 
that the modulo condition will not be met.
>
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index 80a61934decc..9cd154bf75b7 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_huc.h"
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>> @@ -342,6 +343,7 @@ static void gsc_work(struct work_struct *work)
>>   	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>   	struct xe_gt *gt = gsc_to_gt(gsc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>   	u32 actions;
>>   	int ret;
>>   
>> @@ -370,6 +372,8 @@ static void gsc_work(struct work_struct *work)
>>   	if (actions & GSC_ACTION_SW_PROXY)
>>   		xe_gsc_proxy_request_handler(gsc);
>>   
>> +	xe_guc_pc_wa_22019338487_end(pc);
>> +
>>   out:
>>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>   	xe_pm_runtime_put(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 57d84751e160..1315b184220a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -816,6 +816,8 @@ int xe_gt_resume(struct xe_gt *gt)
>>   
>>   	xe_gt_idle_enable_pg(gt);
>>   
>> +	xe_guc_pc_wa_22019338487_end(&gt->uc.guc.pc);
>> +
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>   	xe_gt_dbg(gt, "resumed\n");
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 666a37106bc5..7d8aa68e60b7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/delay.h>
>>   
>>   #include <drm/drm_managed.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "abi/guc_actions_slpc_abi.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -24,6 +25,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode.h"
>> +#include "xe_wa.h"
>>   
>>   #define MCHBAR_MIRROR_BASE_SNB	0x140000
>>   
>> @@ -41,6 +43,8 @@
>>   #define GT_FREQUENCY_MULTIPLIER	50
>>   #define GT_FREQUENCY_SCALER	3
>>   
>> +#define LNL_MERT_FREQ_CAP	800
>> +
>>   /**
>>    * DOC: GuC Power Conservation (PC)
>>    *
>> @@ -673,6 +677,14 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>>   		tgl_init_fused_rp_values(pc);
>>   }
>>   
>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
> do we really need to export this?
> if so, please add doc.
ok.
>
>> +{
>> +	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>> +		return LNL_MERT_FREQ_CAP;
>> +	else
>> +		return 0;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>>    * frequency to allow faster GuC load times
>> @@ -684,7 +696,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>>   
>>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>   	pc_init_fused_rp_values(pc);
>> -	pc_set_cur_freq(pc, pc->rp0_freq);
>> +
>> +	if (XE_WA(gt, 22019338487))
>> +		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rp0_freq));
> with this we are setting 0 to cur freq!
That will not happen, but this does look convoluted, will change.
>
>> +	else
>> +		pc_set_cur_freq(pc, pc->rp0_freq);
>>   }
>>   
>>   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>> @@ -740,6 +756,71 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> +static int pc_wa_22019338487_start(struct xe_guc_pc *pc)
>> +{
>> +	int ret = 0;
>> +
>> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
>> +		/*
>> +		 * Get updated min/max and stash them.
>> +		 */
>> +		ret = xe_guc_pc_get_min_freq(pc, &pc->pre_wa_min_freq);
>> +		if (!ret)
>> +			ret = xe_guc_pc_get_max_freq(pc, &pc->pre_wa_max_freq);
>> +		if (ret)
>> +			return ret;
>> +
>> +		/*
>> +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>> +		 */
>> +		mutex_lock(&pc->freq_lock);
>> +
>> +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, xe_guc_pc_mert_freq_cap(pc)));
>> +		if (!ret)
>> +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, xe_guc_pc_mert_freq_cap(pc)));
>> +
>> +		mutex_unlock(&pc->freq_lock);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int restore_pre_wa_freq(struct xe_guc_pc *pc)
>> +{
>> +	int ret = 0;
>> +
>> +	mutex_lock(&pc->freq_lock);
>> +	ret = pc_set_max_freq(pc, pc->pre_wa_max_freq);
>> +	if (!ret)
>> +		pc_set_min_freq(pc, pc->pre_wa_min_freq);
>> +
>> +	mutex_unlock(&pc->freq_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +int xe_guc_pc_wa_22019338487_end(struct xe_guc_pc *pc)
> doc to every exported functions please. Besides avoiding the wa in the name itself as ditto.
ok.
>
>> +{
>> +	if (XE_WA(pc_to_gt(pc), 22019338487))
>> +		return restore_pre_wa_freq(pc);
>> +	else
>> +		return 0;
>> +}
>> +
>> +void xe_guc_pc_wa_22019338487_fini(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	struct xe_guc_pc *pc;
>> +	u8 id;
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		pc = &gt->uc.guc.pc;
>> +		/* Set requested freq to mert_freq_cap before unload */
>> +		if (XE_WA(gt, 22019338487))
>> +			pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rpe_freq));
>> +	}
>> +}
>> +
>>   /**
>>    * xe_guc_pc_gucrc_disable - Disable GuC RC
>>    * @pc: Xe_GuC_PC instance
>> @@ -854,6 +935,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	if (ret)
>>   		goto out;
>>   
>> +	ret = pc_wa_22019338487_start(pc);
>> +	if (ret)
>> +		goto out;
>> +
>>   	if (xe->info.platform == XE_PVC) {
>>   		xe_guc_pc_gucrc_disable(pc);
>>   		ret = 0;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 532cac985a6d..760324ecdbf8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include <linux/types.h>
>>   
>> +struct xe_device;
>>   struct xe_guc_pc;
>>   
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>> @@ -29,5 +30,8 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>   void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
>> +int xe_guc_pc_wa_22019338487_end(struct xe_guc_pc *pc);
>> +void xe_guc_pc_wa_22019338487_fini(struct xe_device *xe);
>>   
>>   #endif /* _XE_GUC_PC_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 2afd0dbc3542..721f673b1628 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -25,6 +25,10 @@ struct xe_guc_pc {
>>   	u32 user_requested_min;
>>   	/** @user_requested_max: Stash the maximum requested freq by user */
>>   	u32 user_requested_max;
>> +	/** @pre_wa_min_freq: Stash the minimum freq before applying WA */
>> +	u32 pre_wa_min_freq;
>> +	/** @pre_wa_max_freq: Stash the maximum freq before applying WA */
>> +	u32 pre_wa_max_freq;
> do we really need this?
> can't we simply return to a regular point where we had put already?
> if we really need this, also please avoid 'wa' in the name.
> Use a generic name for stash_prev_min stash_prev_max, or something like that...

It is kind of hard to set a restore point without stashing the freq. 
Another option is to init the frequencies only after driver load, but 
that seems messy.

Thanks for the review,

Vinay.

>
>>   	/** @freq_lock: Let's protect the frequencies */
>>   	struct mutex freq_lock;
>>   	/** @freq_ready: Only handle freq changes, if they are really ready */
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 12fe88796a49..a6b897030fde 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -27,3 +27,4 @@
>>   16022287689	GRAPHICS_VERSION(2001)
>>   		GRAPHICS_VERSION(2004)
>>   13011645652	GRAPHICS_VERSION(2004)
>> +22019338487	MEDIA_VERSION(2000)
>> -- 
>> 2.38.1
>>
