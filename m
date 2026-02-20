Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EFDC5CFEE
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 22:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E3110E00C;
	Fri, 20 Feb 2026 22:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDeAL5Ny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7410D10E00C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 22:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771626856; x=1803162856;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GBmYGvbX1uFm7luPuzbc/fVwWC810TvNOtDLFmrQ7iA=;
 b=KDeAL5NyR8z8g02xFsfOQJK1bVtxOa+ARoUcLzYPGo5DnoGpiNS2Gj6E
 rRxqSAKgwWK7IzbyWGKcguME67/gNl/etr7Wd7hYQskDjQai1qJ/xclSc
 3f6ptqwZAfQ38BKaj+lZ91Ui4gU+i3hCaZBj9lSnPFJtp11JxpfO6OL2H
 wXbG9+AEjzApOXVt9wEQctV4rqhP9UmfTkqt9KWNcGAa+Wj3bkknyXR5T
 RptCkeR5q3Y69T2mC64jyj6BpoRJzSvOfeEzoyxJgi16xBQdW5DgTeQoy
 GCMEFXVGwfUji1HH7fXAkwPO+DM1xFhCrMr2JtupjKGnGWJTKHbXbJ1qX w==;
X-CSE-ConnectionGUID: ohYvQwfPT+ygepQCr2PEng==
X-CSE-MsgGUID: YZeD7cuwS1+kr+NfvBrwMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="98185216"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="98185216"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 14:34:15 -0800
X-CSE-ConnectionGUID: YmEFkksVTeGOnbMDuDlDLA==
X-CSE-MsgGUID: NQjZlN3IRVSnaz8oBi/A+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="218663331"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 14:34:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 14:33:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 14:33:43 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 14:33:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkgkTkp1tDjCJeANjy9E3lKqUpWwczW7TpvzgLOBq5qxk2znGUs4SDDc7WJCKHKsDcHE92sfCEaIJgQM9RdBWI7P5rSXJu80ZEUs7NTtd5mQ1mWXaWSVzjPm2sIRr77Vccv2AFVqarJulVKGGBfNyWGs0qYlApQugUZGVuA6Vz5QdA6ucrK4hUrmTmwxEn7mUprcsvJPgwumsV3YFKRPVIPP6EDiBpB+kc2ZrbO6CVJCasfHp+jDKcmM8nafy7x58f63EOMs/KmqNPHPxLPna8Zjh6+YIDOL4k0EwhuTi9AjS8O7MFOUxsjsI4Gyi1YJq5/Fiyw5+R9PwCrzQzVVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKTz71uYrMa6hpws9KG+OYhumTfWk5CnJbfFuSWdV8s=;
 b=XKwjlkJvLdiT9z0K3jzP87+LGd4HFG+4ws05ZOosyQCGX23mVa35MhWwglmU2RacJJB4fkfOlx0nb/Oc718N2AEoPPTaOE6sYVnd/Iz8/95C2/idV/Pv/+X/wS7MDgzTxTBsHVxtsfwRn2Q64YVHsfWW8SwirjlNNMDg9P67fPQrQgVJtjYx+qzHwUp91Fdvb+JnxA/HO6EBCE6Km3AMWoQPC549J2RTc+IRPX5vWavJhKEctknUb/dLelhPm/Kxiogx+/zeyYc6d7XfP+GmNrA1+B3V9oAksA5EEH1VFtMzB5woTxiBMacsawzfzYrBI69emN/g9RH5mIIHGugJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8143.namprd11.prod.outlook.com (2603:10b6:610:193::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 22:33:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 22:33:14 +0000
Date: Fri, 20 Feb 2026 14:33:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC 3/7] drm/xe/svm: Clear CPU_AUTORESET_ACTIVE on first GPU
 fault
Message-ID: <aZjhKPaPbR4l1C63@lstrano-desk.jf.intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
 <20260219091312.796749-4-arvind.yadav@intel.com>
 <aZjAMO2aGh8cHbYg@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZjAMO2aGh8cHbYg@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:303:b5::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8620db-8648-4e12-5ee6-08de70d00954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUVDMFQvQWZTdHJXcVZSYVpFSDZWVVRER2VtSkVHZ1N5WTlSU2llUWNZZ1Mv?=
 =?utf-8?B?d1k4bHhlcWcvd1hyUzhGV3lucFYvV1p1WVViWTJ4b0JFYUphMkFJTzJzeUhO?=
 =?utf-8?B?SDdNTzNvczlVMjh4OVZNM2l0QjVQSlF4NUtyZ2pjNEQrZHNsSlJYZk5rYkhM?=
 =?utf-8?B?TTdma3FXS2Uzbi8wSm5KZUpleUtxUklPRWRkbGovNWpsMFczVEdvd2ZTckRr?=
 =?utf-8?B?R25QNytiZnN2a0dTMUJLdDZXQkpCS2xYNTJhZXJSUCt3SkpPblJ2TnBhWWdN?=
 =?utf-8?B?ZWg0eGZkblNCUVZzMGZJV0h2eUE3N28zbEJrVkFCb25aaW4rU2wvV29zL0ZS?=
 =?utf-8?B?Yi93eTRwck5GYkMvWGZwOUw1VkZMNGxLeDhkUlFnNG1pdGVWMnlKWlh0S1pj?=
 =?utf-8?B?OVhMUXZCTHhIVVFHZjB6cVBiUjBvQkl3TnpNOEhqdmlPb25PeUlJV1JjL2RO?=
 =?utf-8?B?TTNWbnliMUVGUlVWbHJHNlA3Zm55M3RRV1pXMHYwanFBMjlrUExZQWZIY2dP?=
 =?utf-8?B?TDN2UkpaYlZkd0VrRUxucGVHVHJyNWFBYm5LR3hqWlVIRGN3RDR2dlQ5VHhD?=
 =?utf-8?B?UmtqdzZ3ZFY3SVk0RGg1R21Cc1NZaHAwdjEyMUlIbXlwRVo3Y0VxMm02YXNw?=
 =?utf-8?B?aWw4ZW0wQk5BR2hQMU5FZjlJRkxYWVlpOXZ0eGZhTGlsM1loV1ZSZUl2NG1O?=
 =?utf-8?B?RUJrMGpndUxzTVd0SDJBRGU4b3o4VlJ3UkVaRG9HcnI1SnB1OXZUNFR6NHYv?=
 =?utf-8?B?Q1FrUU53SlNuMnR2SnplTXBIeHV4SXlKNUF4cEVDamxsbVdKdnM5blVlRE5z?=
 =?utf-8?B?R0psMEtSbzV3blpPNnlFNkozQXJBZmN6eDNkNHZWd0VSMFNPWnIyYVhGQjYx?=
 =?utf-8?B?Yk1rVEhxUDJLNFFWK2tyOHNQeE52TjNYalFXVStSS1lacmRIT3BUWmZTT2E1?=
 =?utf-8?B?cFRjK0hXL2xWQlZxMjFOOWp6RGZ6NU1Dc0NrZkJMREcrb0gyeFR3RHpNVlF3?=
 =?utf-8?B?UWFZd1ptWFFBL1htcEVVYVNhNVJ4U1E5QUdVc05JeTFaaWlWUzRpazJaU0tB?=
 =?utf-8?B?M212NjczT3JvSmd2QlZzOGtJNEFlb0E4d2kxQXBRMUFMRDc4bG1FSW9TOXFp?=
 =?utf-8?B?Q1c0UGlUZWVEWkhXb29uNm9vdjBGUlFXalpIUXNIdFJUa0gxeEs0R3Q4TjRh?=
 =?utf-8?B?akZiQmwxN3Ivc1JQbWprUHhXSEtEUDlSRy9RSHJURjZhSENXSStYOXJWSGVw?=
 =?utf-8?B?YmtBZTF4NUxyK1NlLy93UjNFaTU0bVlBUEMvNEx3ZDVEai9CWDlGRnFKUmti?=
 =?utf-8?B?WHZkN3FTTno5MjM1YjExOHJJajhUL1RYRmY4bzBZcmpVMGZ0S1drU0tmWVYx?=
 =?utf-8?B?YmdaWm91NkFqSVI3RDZYMWhGQ2F1Z2h1d1Q1bmhtOE01R3Izd2QzRVJWaE91?=
 =?utf-8?B?bU1QVmprUmJsYWdtNXFTaUhRMXBqWklkU1hia2FjNHF4NmM0cHB3ZWxtYXph?=
 =?utf-8?B?S01hQUJpcSsreUFoZ2QyYUE1c0ZRYnZ1YVRVTXZNTzk5MFM2MWQwQlYwU3dr?=
 =?utf-8?B?UFRYYk1tdDNnVDNaT1Q5T0tQZUxFUTM1Nk5sV3lVNjhaOGxvREJ4WWJiOTBE?=
 =?utf-8?B?b1ZrenUzS0pwMWptR0dDQmdRdXdHRnFSRk5VVlRJdHE2ZE1jRkxiWEJWeGZt?=
 =?utf-8?B?bDRTa3pKV3FSZGlZc2ZyR0Uxc25NeVFnYWxDNTBZdEtWZ0p1Qzg0aFIrcEsy?=
 =?utf-8?B?TmNHMFg1c2JUalR2Wm9oUzk1OXdZYmJ1d29oRzZqSStvZU5WUXNqaUhoa24r?=
 =?utf-8?B?cWthbnVPM1lnNDdHbzk3S3lWamJheGJRQ2k3VnFxU3A1b0IwMWc2b0RCWTBv?=
 =?utf-8?B?Tmw4UGtHbGRDWjZGdXJnek5halh5WHhPYnRQbVdDdW5rSlR2clFySWd4RWh1?=
 =?utf-8?B?d0Fvb0ZMa05KNkFkaFg1WWtwR202d3lkYmxrNHpPa2w5Smo4SW15T25Db3lq?=
 =?utf-8?B?Njl4NHV1V3N5YnpjemMzYmNjcm9RVjFHN0tTZ05KNnBrRHFXUFNTMkcvTE1z?=
 =?utf-8?Q?fW10X4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTN5SldiTnZMMjZoYmFUMUtycG0zcE1DTmtWYnE2VEJJdURpYlhWU3EzaWpM?=
 =?utf-8?B?a1NxUVRIaS81YUs1UmlHcnl1Nzc5S0lSOXp4ZnVhVzd4eE9YS0JKaUZHUzly?=
 =?utf-8?B?OVJHcVpMdHFBNlI3VWJqQ2FHc0NpNkZqMzgvM3orMkUzdEpSQmJRdERyNk9J?=
 =?utf-8?B?RWc0WEpOb2lGNFdRV2FtYml2TW1zTEwzUldkbm8zelluOHR1NnNZZUZ4QnQy?=
 =?utf-8?B?STkyM2VsRnFESGp5dElkWm5NYlpVandnVG1DcmVvSEFzRndXU0lpbVlPbnpj?=
 =?utf-8?B?d2dBMk4zWEd6YWluN3FKbDhtU3Ntam1LbTFld3llc3Y2S0JlUnNhdlZaZE1D?=
 =?utf-8?B?dlNQeWVOQjVOSVhzTWlrbEw4L0hCR3RXS3BJTEtldnlObjBNeWNPdUVWeGx4?=
 =?utf-8?B?RkxRS1JjY2tpZWplb2NTaEtlSkx2S09MTEUwMFZNcTUzMS9ZMW81V0R2M09O?=
 =?utf-8?B?Vkx5OUtvQVRiWVpKaUJZS09KamR1bHR2My9DSWRtT1ZrQ3pHTFZmaGpyVnJX?=
 =?utf-8?B?bERMaDA1dVF6K3B4UFBub0NJU01NWVZuN014MHZjTlNMaWlqcHVESHNaTG1E?=
 =?utf-8?B?dEVScFNSVHAwU2pnSHdScjZLeTNvVmJaeU1RaitzMFIvN0FkaG0rRU0xbm5u?=
 =?utf-8?B?cFZ6Y0tZY2MxajFXL1BrZmdOeXY5K2JwKzZIWUROalV0Q3NKVTFVMGlkcEx2?=
 =?utf-8?B?c3IrcDc0eG92dFpQeDdMMUlRZGNWZmM5bTRQV0R5L1F6R2lOVXlZcFpVMDhh?=
 =?utf-8?B?dzhXY0toSGR3ck1rT1g1dGFGRFdXem9RNllSUkxQTkhMZ2hEU0I5eEpnM0xI?=
 =?utf-8?B?dGRUQXNmOFFpejdYVnF0ekNDcE5jWEVOZkhmUnFPMGVlZGY1QWJybXhyR3Fi?=
 =?utf-8?B?OHBiNW1TMFVua0JyZHBpZkxSbGY4TnhDc1I1R0wvK3V5RHJkamdlNXRqYjRh?=
 =?utf-8?B?VDBzbThZRDVHdjkvSlYrcjZYd05PMjhDSEJWdnp3UklpRDh4bjNrU0NpNzdC?=
 =?utf-8?B?eVlqSmttVXMxQ0dQS28yRGJrRUYrNnAzRVVFVFpkb0ZZb2hHZWVVUkZhYmp1?=
 =?utf-8?B?Rlk2QmpRb1VQV1A5OGt6MkZYTmw3U3pINmlqRURSY2pXdWQyb2lKT0RkczRB?=
 =?utf-8?B?a25oNlhBVEFHcFhrdWpSVndjaTdSSkZOUFFUZ0VZV2oyRHByVUt4cUpDVHc1?=
 =?utf-8?B?M0JKWEl2OUQ3ZURxNGRLbm1TakFXejV2SXFNWmJmZ1IzL3ZscjYwS1pjT0Z6?=
 =?utf-8?B?cTR5a3h1aE1jVzdMU1dwLzdpSktIcVhvbG5aQ3JWSVRHV0tpZVRIODVVb1pa?=
 =?utf-8?B?UStZdWlKbXk0dDlxYmNmeHZnenFsaWZlNThKdDlMcmppaW5tUUI3Qi9POG55?=
 =?utf-8?B?U0NJdUR5citMR1BvcGlMSVRMS3pkOVBlOHV0aGZxL2dwejZQaERaSWRVWnVZ?=
 =?utf-8?B?Tks5eEllNGIwTFM0dWlDbWpqVVJ5R1BHTEVSU0J1QmVmek9XSWtjTzNSaFZN?=
 =?utf-8?B?RDJtbk5NNHJTTkcxYUtSMDJhOUVUcVoxMkNER1lsQUxHRnZodVBublVTNTRh?=
 =?utf-8?B?dnQzcHBVZHVEL3J5TWdJZWwrcXdlcXRrekZ4cnVveVhDQ2lWNzhWZW8rTElz?=
 =?utf-8?B?V1YrRXBXVHV2V0FhZjhCaGJra01sV1dpMGpub0ZEcTZJT0dlb084V01sR3Qv?=
 =?utf-8?B?WDVSZXNrMXIyaUdEV1Y0QXY2VHVyWUo5enBoMUhhUXRCdE5xUGNGS2lUdkZz?=
 =?utf-8?B?QVlsM1M5WHBaQTZvaWE4YXJoN0s4alVpM285QkIxYjg4NndGdEdzZUcvWC9L?=
 =?utf-8?B?M0ZpeUJWL2FiN2ZPNG5FVlRCMkZPSnErSjhkeVZ1b21oMm5XbW1nRDBoV1Ar?=
 =?utf-8?B?bnNKYW53Nk9vS28zc3AzOFVyTjYwNkpKVnpIODZLUlpvU0pWTXlNN29HM1d2?=
 =?utf-8?B?dFlSQ0MyWlRFall3aThqTWU0dmo5SDdrLzVKQnlFSThHLzU5MTN4RXl2bEQ0?=
 =?utf-8?B?RTJDYlJXeWNENlVLTEk4Mk8rcWRxbThyd0FTSXhLdkJFbjlMdzcvZFk2NXR3?=
 =?utf-8?B?L0xMTG5mREtBeTNBRHFwU0ZEdE9oSTBKZDJORDg5dG12cG1Pczd0dWc3bjFL?=
 =?utf-8?B?MVQzUkM0OEU5UFhLZk40dTNoZXM3SVRkdEcrMjE3cjJYMzVxOS9zTGJ6WVRJ?=
 =?utf-8?B?eitVRmQvczJ5M0xPalBsT2VlYnNRK3BqejRISUtwVnlBM1paR0x2Vm5xVEpN?=
 =?utf-8?B?WjY1WlhIZExIZ3UxVFk4ZTlRTDBCNXdPWENWc044V3FWRXEzUWVrNHNEWGVY?=
 =?utf-8?B?RitFaFRCTjh3VThuaDQyU0taNGlDdmRlendMdS81T2ZPTzIvN002Z0NLejBH?=
 =?utf-8?Q?e0z4Y85VOdBqdchU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8620db-8648-4e12-5ee6-08de70d00954
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 22:33:14.6634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7ITR+9mQyWu3O3iMY4/eYZ5iWmoGuWpCDQC3ZlaXqG9hz7QrP/ZDhGHhM7Zce4zLvhbUQM6YVjdm4ZHiKkKAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8143
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

On Fri, Feb 20, 2026 at 12:12:32PM -0800, Matthew Brost wrote:
> On Thu, Feb 19, 2026 at 02:43:08PM +0530, Arvind Yadav wrote:
> > Clear XE_VMA_CPU_AUTORESET_ACTIVE before installing GPU PTEs for CPU
> > address mirror VMAs.
> > 
> > This marks the one-way transition from CPU-only to GPU-touched so munmap
> > handling can switch from the MADVISE autoreset notifier to the existing
> > SVM notifier.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.c | 10 ++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h  | 11 +++++++++++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index cda3bf7e2418..b9dbbb245779 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1209,6 +1209,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  	lockdep_assert_held_write(&vm->lock);
> >  	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> >  
> > +	/* Invariant: CPU_AUTORESET_ACTIVE cleared before reaching here. */
> > +	WARN_ON_ONCE(xe_vma_has_cpu_autoreset_active(vma));
> > +
> >  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
> >  
> >  retry:
> > @@ -1360,6 +1363,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  			    bool atomic)
> >  {
> >  	int need_vram, ret;
> > +
> > +	lockdep_assert_held_write(&vm->lock);
> > +
> > +	/* Transition CPU-only -> GPU-touched before installing PTEs. */
> > +	if (xe_vma_has_cpu_autoreset_active(vma))
> > +		xe_vma_gpu_touch(vma);
> 
> I don’t think this will work going forward. I plan on making the fault
> handler run under vm->lock in read mode [1], and VMA state will only be
> allowed to be modified under the lockdep constraints in [2], which are
> vm->lock in write mode or vm->lock in read mode plus the garbage
> collector lock. Maybe this is fine for now, and we can rework it once
> [1] and [2] land—most likely by taking the garbage collector mutex
> introduced in [1] before touching this VMA’s flags.
> 
> Another issue is what happens if we don’t want to taint the VMA unless
> we actually fault in a range. It is valid to not find a range to fault
> in if this is a prefetch, as that fault just gets suppressed on the
> device. So at a minimum, this needs to be moved to where the function
> returns zero (i.e., by the out label).
> 
> [1] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/08fa2b95800583e804a91caf477f9c30b3440a33#33e7d2d9323cd529c8d587d9d3801e353439d783_181_179
> [2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svn-perf-6-15-2025/-/commit/08fa2b95800583e804a91caf477f9c30b3440a33#71bf077daec46f3ebd785235e8ecc786681aff99_1112_1128
> 
> 
> > +
> >  retry:
> >  	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> >  	if (need_vram < 0)
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 7bf400f068ce..3dc549550c91 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -423,4 +423,15 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
> >  	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
> >  
> >  void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
> > +
> > +/**
> > + * xe_vma_gpu_touch() - Mark VMA as GPU-touched
> > + * @vma: VMA to mark
> > + *
> > + * Clear XE_VMA_CPU_AUTORESET_ACTIVE. Must be done before first GPU PTE install.
> > + */
> > +static inline void xe_vma_gpu_touch(struct xe_vma *vma)
> > +{
> > +	vma->gpuva.flags &= ~XE_VMA_CPU_AUTORESET_ACTIVE;
> 
> Thinking out loud — not strictly related to your series, but I think we
> should route all accesses to vma->gpuva.flags through helpers with
> lockdep annotations to prove we aren’t violating the rules I mentioned
> above (right now this would just require vm->lock in write mode).
> 

Actually I looked at this and exec IOCTLs can set some of the
vma->gpuva.flags in vm->lock read mode only, so we basically don't have
any rules for vma->gpuva.flags and it all happens to work by chance. So
at minimum here let's define some clear rules /w lockdep for
XE_VMA_CPU_AUTORESET_ACTIVE, if that needs to be moved out
vma->gpuva.flags for now that would be my preference as we shouldn't
make the usage of vma->gpuva.flags worse.

Matt

> Perhaps when I post [1] and [2], I can clean all of that up, or if you
> want to transition all access to vma->gpuva.flags to helpers (e.g.,
> xe_vma_write_flags(vma, mask), xe_vma_read_flags(vma, mask),
> xe_vma_clear_flags(vma, mask)), I wouldn’t complain.
> 
> Matt
> 
> > +}
> >  #endif
> > -- 
> > 2.43.0
> > 
