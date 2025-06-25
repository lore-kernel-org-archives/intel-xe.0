Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36049C7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 13:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E861A10E21F;
	Wed, 25 Jun 2025 13:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFfElkqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9588C10E21F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750858440; x=1782394440;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6gUAF8NV2DzUACuIjBkMfCXThDgydxhX5zmwKX/zADk=;
 b=kFfElkqBZ2P/Lp1vucbI0SDsT9E5p9uvUKUCU9y1f8/POUxcGuWq6lhl
 cPWAgtsoDa14kVWTnFRtImTLnVv4wbym+iJFXqT74VOxH1S0iUU5Ze+++
 cbRCOvsIg3aBoo8Ki5qmKKU0jXllywDhRyZdmkeYtEaSNyxoBYhIqVpeY
 lwoDscLXMXf/OxvJAJmPv8BY/i3IUbV0B3LRA2wx909Wu+FMh0jnbfYyl
 mVyKdqR2miDfp3UraVdk7rKJDgp/AsQk/QmsyCwMDR5KZ4uw5Vjy3sKAR
 VFop+tAgSl+7APiN840TNpWL9vmeeD8zp4ViavnI4ImQQqhvlI4fYyeHG A==;
X-CSE-ConnectionGUID: 0VFrU865S3epzPojDlc4yg==
X-CSE-MsgGUID: MtwsizscSGKFXpZqAaBG6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56912965"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="56912965"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 06:34:00 -0700
X-CSE-ConnectionGUID: gVjPbjQtSWOzRLvDtpCGbg==
X-CSE-MsgGUID: GFIl57M5SI2gq/CffEf3+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="175868065"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 06:34:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 06:33:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 06:33:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 06:33:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmSvEaL5nJ4w9jR/z0kEdTtl5lJZETyKVC7Pwe9neL/CIiq5mMIUHI8jh7d/iEXaWyE60VfEIMbf/kMhbR49c6GDK3PKR9AedoxxEXVOzwd3K3J1xT/8Yv5G65eDF0jbO2ZQGnBbLftG/Um8l3TYlL51asHEwa22mHofxL6A6AO6A2yq+T9fLzcBCDwtKpp1bkB4IPRKoiGyhg3KbY78OUBoFeXc7VnBg37HIRpY29Y8LZB6cuUorSFKDAL0eTVPD+ilmCqrrhlbZncLgO9VIYdhe9swDsi3IP/5cwFaKU9Nuo5Q+0dl8GOdyFL77wBilCUVEYXKeSAI7v5SQqhn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OOdoeLIKZvlULFVlHp5mDHIXTExvFYsgWR+E7zroLc=;
 b=Ra/Oj4/pFbm0KyFNKeh4qLg59c8mlrlz+iVDHrrFiK4cxVp8o6jipx6HitvarSf0irtiUzyso0WER+sjtfNYp9I+N/AgRLiw4ZUUFuV0+7yAqFC1X1zs5Pr0+Hm5hJlEEmwL/4A5DnZaZe68SPDMXWXST7zDw8+QS7lvKgW1DeTnXiCCH0Fj3Yh7rVWZrlUocQkUC4wgA3Ag+fbewI4VDu6cYJKCmPrW4rVP52w+tKeHocKUan6vk/yWylRVxeVg4iTrWg5ObGLOhcMjeJH5CwFSfqdWZ42gS+2d5ZKwTSSGhMPvPiwrItvliNpRnkEyR7AcVGPtiXreOfyd3T2ftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 13:33:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 13:33:54 +0000
Date: Wed, 25 Jun 2025 06:35:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY
Message-ID: <aFv7JXtt9vCZREWK@lstrano-desk.jf.intel.com>
References: <20250623064036.785908-1-nitin.r.gote@intel.com>
 <aFnufaHVIGrdyLFr@lstrano-desk.jf.intel.com>
 <IA3PR11MB8987A6919D85D9073B3A0698D07BA@IA3PR11MB8987.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <IA3PR11MB8987A6919D85D9073B3A0698D07BA@IA3PR11MB8987.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 578ea00f-d0ef-4601-a957-08ddb3ecedad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHF4dytveGJ5T2RmeFB0MTBGQUJUa3pKb3BNRUxJbTdWbUl6R1p2LzlXRHgz?=
 =?utf-8?B?LzBndUppSGJWRGFsVHFPVmljMXArdkR0b3R6OWppRHFaMHJ1dHpQZkdLdncx?=
 =?utf-8?B?L2RWRW9oQkhBYkRkOGpackJQUXJMMjRzbjl6MkZXVWRNbmV0UmFFckYxVzJT?=
 =?utf-8?B?S0JqcktPS3VuTnl2ekxISjdBZ3lPVG1aTjVLbWdLRnNtU3o5V3kvV3RTVmwv?=
 =?utf-8?B?blRFbTFmMlF5cU11bFY0NUxZVGtjWExIMGZvYkFxOWRuM0RLaHZEUVJScG03?=
 =?utf-8?B?aFlQdjIyNGkrQklnS1VkVE1kdHZPQTY2eThpSHJiU2dKNG5mZUVEd3hvUkxB?=
 =?utf-8?B?ODZMQUJubEdnb3J4YURxU3h1VFVEUTIvSnRDY0tLcUc3S3B3M0dTTngwTnk5?=
 =?utf-8?B?b2FHa3RyQm9jeEQ4dll0Lytndmhidnpsc3BhRS9tZllmWHVaOS8xc0d3ejA4?=
 =?utf-8?B?VGpTWDNBQ09SS0N6R2E1WUxnTnpnZXBNeThVVmE2b05XMUc3N1AyLzJqWVo1?=
 =?utf-8?B?VS9GcktBeUNXbUxZUEljVmdicE5lSndrMFZoNnVnR05sQ1dEV2ZWdGd4RDhl?=
 =?utf-8?B?UXFMRktBTnJreHQ0RWxKK0IyNUZNV05sa0FQQTJ4ZVNsb2ZVTkVDV0J4Ymdl?=
 =?utf-8?B?R0tNMUkvQVBtOGVoYmtNUVY2TUxsOGZqam9XTlo4dTBZL245ei9MRTNsSkx0?=
 =?utf-8?B?Sncya21aTUFuaUNhTHZNOFZnQzJ6a2h5b2ZOMnluTzNMcG5DTFJNdFhpYjQ3?=
 =?utf-8?B?SW15aXRPbFZEVm04dTJ5eEs0RytwcjFJTmhCSU1yZUZhS0lwTTB4d1dyUDNK?=
 =?utf-8?B?am43Rnc1cEVmdkFQdnVoemVLeGphTWNsT0JRY0REVU1UWW5ncXU2czR0WDFS?=
 =?utf-8?B?Ym5FUm9SUzFmUkEva3ljMU5uSFUxZHJDWnRjaHpjaXNXVGxkUEpRTGtYWFEr?=
 =?utf-8?B?MVNOR3VocE5UWlNPZ28xVGFDMS9Zck5QeUFrV2UxTVVFa1Y1aXBQZlZ0Y3VW?=
 =?utf-8?B?TlhCc25QVlF6TWN5Umg4b3hhY0RtVUpOdkxYOFY4blFQZVBUWkV4clkrWUlq?=
 =?utf-8?B?TXVwV0UxQzQyQXFTbjJTNE5ZbDZ2clBXMk5FTURwM3BhWksrNUdjMmxGWk03?=
 =?utf-8?B?cEZHa3MwMmtnakdNRXJKWUQ4VHNWNFVxT2hibENaTzNSMll0UHdvOHVTSFNZ?=
 =?utf-8?B?dzNzdTNnczhpT0NPZXlVUGcxd0QwdHlrTXFYM3pMdlo1RjNMUDFRVWVabFBy?=
 =?utf-8?B?Vy9Zald6c3VseEhKQ0xwanEvT0plRVZxTzR0MGl1dzB5dWxCZVJDaTRNc2k3?=
 =?utf-8?B?OWhKY3YrU3FGTG9pTUIxSi96OENadWlXK1loUmR6RU5JUlpTRHVuY0ZaN25L?=
 =?utf-8?B?TER3MWI3NHhSZHIwdU9nbUJOZ044d0Zvb2toUjcyTitqUkZvRmpTS0NHRFlR?=
 =?utf-8?B?bnViWGhScUdMNnMyOFRBSkc3ckpKQlA2VjZDZjNsTTFEazBJSUw5WDFVdUx3?=
 =?utf-8?B?TlhzbHlUeElxMG5GRGphSXFZb0RSN0pYVEF6VCs4ZXdTVXVYekFhRVAwQzY5?=
 =?utf-8?B?WE9RVFRKWEd2Y3MyQjlLdDRHOURDU0gydkkzc2s3cXc4V1RSdlkrbFdtUHlR?=
 =?utf-8?B?ekU2RlhyZ1I3cVp0ZWxUaGluVDJYZlZGeFVHZ0pqMFpIU2pRV3pHcmhKVXVw?=
 =?utf-8?B?NUpjK0xXNFZsVktJUCtOZlFXNGZZb0U3WGw5S0tLcEMyNnplZGN5T2RXVGx3?=
 =?utf-8?B?alhXb2lhSjVxbmIzdTJCM1JZRHFLMDlNc054V0ZGa05wdEZMWkY0MFByYUtt?=
 =?utf-8?B?NCt5U05QWVFnYmtBRU13TWROSUNkK3h5dytaRVRmY1RNZzYzTWtFaGY4RzVH?=
 =?utf-8?B?dURmakh0cUx4Ymx4MzBXMHkwakQzaWVsaUxPQ2J1RVFTWVo4ZStFMFoxdnJJ?=
 =?utf-8?Q?TsMJbGgzjew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXJOcFMzKzRMMW5vK3cySHA1OVNFVTUxOU94UmFhYktmZUd3N3gzditDSUtw?=
 =?utf-8?B?bnp2OXdSTmlCL0swcTd4b0F0OFRqc0hYL0lsbm05TnAreVhnb0JmUldPTTI1?=
 =?utf-8?B?QUl4UVpZYUFhc0tPU28xOTE4bi9IRmw2U1JncGtWOHpUTEw1NjF0RjYyazVH?=
 =?utf-8?B?TFhzWlNvQkNTWlBJbkU2ekhZRnMxQmNaOFZMOXFNTDZoWDdnckJYL2lZdEs3?=
 =?utf-8?B?dzhhZE5VNjhUMDdlRTZvNFZEZjNsR2hLYmRmWDVEZlB3K2k2MnZkMlJhSmtC?=
 =?utf-8?B?N0tYR3pYZzdWVjNmbDZ1TWE2T3dmMkJ1WCswV2xwaHY5bnNCMjJwUXZsanJB?=
 =?utf-8?B?d2lxV1g5TUpvdW90MjJZU3JKS2piSkdKRzFKQmFleGI0d3ZLbFljN0JJZEhT?=
 =?utf-8?B?eGIvenAzaUJRa0dkM2tMTTVoM3I5SG5TbFRjbE9IaWpiK3VrZTlWdUx6SWc3?=
 =?utf-8?B?dHdha2ZHSE4ya3dlRFRFSkdGVVQ5N0tDNjBhcmg5QVV5dTMyK3ZpWU52dTEx?=
 =?utf-8?B?dnFzRlJwWUx6YlovZkZCQTd0cWhhV0swNjhCQU5XWThDNDdERVRRc1NsMmlP?=
 =?utf-8?B?MHRKUWowSUU2LzlKc282T0x0Z2xKa2lleGFaZGt6cG1ZWjFzQ3huNDVmNTRN?=
 =?utf-8?B?d1RHNjhyazlONnlzMnc0V0RJcjZLeVNhZFdjNVdGd1JmOVJNc0NwMTBwbGtF?=
 =?utf-8?B?ZHp6RzRDdWtVSE1tQWZWbHVRZWlObVJZdXlpSzZSSjU3Q0dYaWVkUHh5SnY0?=
 =?utf-8?B?Znl5STJaZ2VFT2RsNm1ocXJXL2ZHOVRVUmhhMTFUY1BHR2VQYUtPekJXYXgz?=
 =?utf-8?B?WlVjS01YTVJmZUJCalpyT0NiTnlPMU9oUHd3M1l6dmdlS1l1ank3NkNTYjBE?=
 =?utf-8?B?SGZIWm96bEkvVWVXWS91YVNHZEI1VXNXVmdtUWJFZW8zUHg3UStGeHN4QkF6?=
 =?utf-8?B?Ry9yZ3dNN1FkaSsxaFlKazJId0dpdmR6cVBIZVJBNmExUWljRE1rSHFJRFdk?=
 =?utf-8?B?RFp3MzMzZkYrUTc1YXZiaGt3Rldla3ZlSEdvd3NhSk1VK0pZZHVqaFlvZlZT?=
 =?utf-8?B?cWQ3d3RYN2dVSFAwV1lEVkNvUVZRVnU0Q2NMQVRhS0RIMTNYcURWSTJEcG9q?=
 =?utf-8?B?V1hrMlpUMmhmLzRpWUNmQXY3Ykk2T1BOSEJTcHM3eGQ3S1dQVEpFQVhMb2hn?=
 =?utf-8?B?NFUxaW11amx6ajBUUnhpNm9SMm1LVjlOY3YzckllVms2WDZBK1pDMW5JNWsy?=
 =?utf-8?B?U3hYMlg0b3FidmxCM1FGMnUvUFZKUlhEMUdCV1FSazBJaDFxd3Z6djV2dHVy?=
 =?utf-8?B?QkUwNGtxbHF0ZGhRTmEvdkQ0cW5LWm5MVWliV3UzeU9pODZmSS9odjB0NFBB?=
 =?utf-8?B?SmtLaXpxQ2M3ZjA4dTBvbm11cVNaN0lvUDJ3V0lhRm1lY2JRUEVpOVgrV2I2?=
 =?utf-8?B?K2NPZGl4ZVR5aThQZzBsZlZOejhzeDR2SVFFTEhLdnlSNkpRWTcyZkVhNGhx?=
 =?utf-8?B?SUhMTG85ai9nYVJzWFhHTmJudUpKKzUybHBhWC9Cald5WTJ2WkhkeGNwMmo2?=
 =?utf-8?B?cjRTVDU2UEVhLzdJdlQzZWVFaHhNTGlzOHNyRGsrYlgrTE14bi9YQ1FVZ3JN?=
 =?utf-8?B?ZEswSkxwaHNwZFJudW1EQmN3RHBjSldVckJkQ08rZHJRa1pkK3BEdEU4KzZB?=
 =?utf-8?B?K1lUWUFaMFJVSFhTR2IwQ0d6TzU2UzlwZUhLNnZUOUtSamV4TmtDV0Q4TnpW?=
 =?utf-8?B?UWlKN2k3TFpiVzBrSk5rNHhjWm1OT3JXUEYraFdTcGJJNGJGam0yN01ENjhH?=
 =?utf-8?B?ME5pakE2eUhMenZuYmpnR2lwQU9RaTVKVGNWWGorQkJpM2xrcjJQSGQwT09i?=
 =?utf-8?B?a29sdVJrajUzK2JQT3h4ZlpZai8wYlFyU0IxeGo4Z0ZMdVZBNnEvTGVjOXpa?=
 =?utf-8?B?Z1d1eXZsRXdBbXFSb2cxa0ZQUTZQRlRoUFdMeVhyNzJKQmpOMUJxRkROQVlr?=
 =?utf-8?B?TXJkRFRDWTVwN3FycTQwQUtuaEZ0YllaYWgwdDEwUDRIWkIyWUFxS2RZM2dR?=
 =?utf-8?B?dzkrNFRKVGRWL1FteDNxSS9QNUVaMWU5dVNSYUU4NzJaN296a0cyQktYZndw?=
 =?utf-8?B?ZkVkd3lsbndDcGJweEE0emlmSUpMbCtESUZ5UFNpZVlKcnBpZHd5VUZyQ0p2?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 578ea00f-d0ef-4601-a957-08ddb3ecedad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 13:33:53.9464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hScjn6kvRAT1uxkHv9B63bLVqjiDt2QvkS/KclUoUKGJf/lzy0CA1jE4V8g4sYMDWAhTd1OjxIaVL+78dof3NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
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

On Wed, Jun 25, 2025 at 03:23:29AM -0600, Gote, Nitin R wrote:
> Hi Matthew,
> > 
> > On Mon, Jun 23, 2025 at 12:10:36PM +0530, Nitin Gote wrote:
> > > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY device query
> > flag
> > > which indicates whether a device supports DIS_NULL_QUERY (Disable null
> > 
> > s/DIS_NULL_QUERY/DISABLE_NULL_QUERY
> 
> The DIS_NULL_QUERY naming convention is followed as per Bspec 57496.
> 

The bspec has nothing to do with uAPI naming. uAPI should be as clear as
possible. Leave the register as DIS_NULL_QUERY but change the uAPI.

> > 
> > > anyhit shader query mechanism). The intent is for UMDs to use this
> > > query and opt-in DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag to disable null
> > > query mechanism for anyhit shader by setting DIS_NULL_QUERY bit of
> > > RT_CTRL register for Xe2 IP.
> > >
> > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
> > >  drivers/gpu/drm/xe/xe_query.c      | 3 ++-
> > >  include/uapi/drm/xe_drm.h          | 8 ++++++++
> > >  3 files changed, 19 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index fee22358cc09..519f36db7cd0 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -26,6 +26,8 @@
> > >  #include "xe_trace.h"
> > >  #include "xe_vm.h"
> > >  #include "xe_pxp.h"
> > > +#include "xe_gt_mcr.h"
> > > +#include "regs/xe_gt_regs.h"
> > >
> > >  enum xe_exec_queue_sched_prop {
> > >  	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
> > > @@ -693,6 +695,13 @@ int xe_exec_queue_create_ioctl(struct drm_device
> > *dev, void *data,
> > >  		}
> > >  	}
> > >
> > > +	if (((GRAPHICS_VER(xe) >= 20) && (GRAPHICS_VER(xe) < 30)) &&
> > > +	    (args->flags & DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY) &&
> > > +	    (eci[0].engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> > > +	    eci[0].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)) {
> > > +		xe_gt_mcr_multicast_write(q->gt, RT_CTRL, DIS_NULL_QUERY);
> > > +	}
> > 
> > You will hit an error before you get here because of the if statement above (not
> > shown in the diff) that sanitizes args->flags.
> > 
> 
> Yes. Agree with you. I will add it.
> 
> > You don’t need {} here.
> > 
> Thanks, I will remove it.
> 
> > Also, a register write implies this would affect the entire GT, not just the exec
> > queue flagged with “disable NULL query.” Is that really the intent? It doesn’t
> > seem correct to me, but honestly, I’m not entirely sure what this patch is trying to
> > do. If the intent is for this to be per-exec queue, then I think this needs to be
> > implemented as some ring instructions in the LRC WA BB.
> > 
> 
> Here, the intention is that for the already released platforms Xe2, 
> we need to add an opt-in flag via uapi to disable null query for anyhit shader.
> So that userspace can use this flag to disable anyhit shader query mechanism, and I think
> that it is not possible in the LRC WA BB. And to me, this placement looks ok as this setting is 
> effective post xe_exec call.
> 

Way can't you write a WA BB program that sets this?
xe_gt_mcr_multicast_write function seemly could be implemented in a WA
BB - the mcr_lock function indicates these registers are shared with
firmware, no different than WA BB.

The way you have it written it is a global (e.g., all user processes)
change which once is set is never cleared. You might as well just this
write at driver load and be done with it the way you it written.

Field a 2nd opinion here if you like, but this looks very incorrect to
me unless I'm completely missing something.

Matt

> > > +
> > >  	q->xef = xe_file_get(xef);
> > >
> > >  	/* user id alloc must always be last in ioctl to prevent UAF */ diff
> > > --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > > index e8e1743dcb1e..c5002b8c9ac0 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struct
> > drm_xe_device_query *query)
> > >  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > >
> > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> > >  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > -			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> > > +			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY
> > |
> > > +
> > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY);
> > >  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> > >  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K :
> > SZ_4K;
> > >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits; diff
> > > --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > > 8e8bbdec8c5c..a5bfba121360 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
> > >   *      has low latency hint support
> > >   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is
> > set if the
> > >   *      device has CPU address mirroring support
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY - Flag is set if
> > the
> > > + *      device has null query support for anyhit shader.
> > >   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> > alignment
> > >   *    required by this device, typically SZ_4K or SZ_64K
> > >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> > > address @@ -415,6 +417,7 @@ struct drm_xe_query_config {
> > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 <<
> > 1)
> > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > 	(1 << 2)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DIS_NULL_QUERY	(1 <<
> > 3)
> > >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > @@ -1271,6 +1274,11 @@ struct drm_xe_exec_queue_create {
> > >  	__u32 vm_id;
> > >
> > >  #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
> > > +	/*
> > > +	 * DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY flag is
> > > +	 * use to disable null query check for Anyhit shader
> > > +	 */
> > > +#define DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY	(1 << 1)
> > 
> > We should add proper kernel-doc for this flag.
> > 
> > It looks like we’re also missing proper kernel-doc for
> > DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. While you’re at it, could you add
> > that as well?
> > 
> Sure. I will add kernel-doc for both macros.
> 
> > Matt
> > 
> > >  	/** @flags: flags to use for this exec queue */
> > >  	__u32 flags;
> > >
> > > --
> > > 2.25.1
> > >
