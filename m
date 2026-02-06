Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B7FEE6B4C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 19:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D9910E0BE;
	Fri,  6 Feb 2026 19:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWDC3+Al";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A105010E0BE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770405776; x=1801941776;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gDODFjPL3a/5B+Z54qyV6le44tnQWwm+2/bKlgGELH0=;
 b=TWDC3+AlxXtS6FL8iNoiUxT6rZ5zB07u85qoX1M8OghmpPXfYLhkDIc4
 7bR/pr99YtZIZIIkPCx79oO6/BzZDycKlI9xs+7zTbPdXbpHPBn56E8Uz
 RCJdHvB7V9LRREE7UQSqkeetiJif45nVoMnA2bR47G9XAxxYfU2q92Lvz
 KBVZLJhcDu9YsGn3xXGNx2YWBacMwuL4hhLXaPc2gfMNIuMwP/EmRCaq+
 xkL+sY7d1jVv+Oobw+L8tRAjDG07iqAulRoV0874fFh4uCKdseO+y3IrI
 JtHd8aJViFZp3Bpn8LRXwDiTgceQGdV0Kk+RrgNgffWiyd+/jbQlf/uFo Q==;
X-CSE-ConnectionGUID: ybaYMq6eQMmymV6pSl+Ysw==
X-CSE-MsgGUID: jDh0mIdEQ3mchUIN4pIjEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71519908"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="71519908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 11:22:56 -0800
X-CSE-ConnectionGUID: R47ckFf8SvmsJm1691K4OA==
X-CSE-MsgGUID: TdsNO76xSpql7jvUzweppw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="210263695"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 11:22:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 11:22:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 11:22:54 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 11:22:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5TiSkP1rcaHhlM9brkqm325uXsCuqWUjMKky/ESwVxHR1SailL3LKLvDUdyOOfljqLrNM0NgqG+GhJTrEJ0c90cyJXZ6iLhHSlbPEurVOUPKQvOVcMi5ck7O5YS5h2OONM9FOcVbipOGIHl3KeyVUmyhCWFlMlbbrSHxdjcuihkFa8Ob310NDXlN4CHg3IgQcsDWgIwLcKpFPjQfgpQJffkC6pl9jlxF8QQ907UgzZlTJXHSmZxRJ2KTixdWE5vXzNZjj/EjRugzzg1rHA8GqfJAHFdja+aoQRuo+LGBpdoBd0G0rz7EyHyBqCZZkxc8ek+D2rNCtijX+AfYyu0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDODFjPL3a/5B+Z54qyV6le44tnQWwm+2/bKlgGELH0=;
 b=OFU3lbDge+lj/xCjW7UB5Px+K0rjeeIq7wzj0rM/JsCxvGUBpSz78tNASXBZeTQ+OXc/DYwLkYY9O9jx4fhXUa9LUotQ7oURvn1Y1Yk8GwaMKqntRrBALMdfdNtasQ6G3eNSF2MiljEI75UdcnZt8uENLUy1ra2IeMXYzBXgq3wLTtqP8D8J9EGddNTCZlhMRX9nXzVWiMnk+/W5ysLGcWJ1IbAZTmF2K6cGZdnesF8Cv+ElGKBQTyryshTB8ppUTppTcbHv6bwdYJyNq4FdhUAXUfEuZEZppy3mz1SdL1VxYdUTZ5I/gy/tXP8F8G4SeZNptWfRZ0I8X8cYJyfJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 19:22:52 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 19:22:52 +0000
Message-ID: <305535b0-b988-4dd4-be85-22f88565a04d@intel.com>
Date: Fri, 6 Feb 2026 11:22:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Revert "drm/xe/xe3p_xpc: Enable Indirect Ring
 State for xe3p_xpc"
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
 <20260130210120.2682085-7-julia.filipchuk@intel.com>
 <b1ef6434-add7-47db-9c16-9de738e99c73@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <b1ef6434-add7-47db-9c16-9de738e99c73@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:303:2a::6) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|CH3PR11MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f822b1-959f-404a-11a4-08de65b51f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHk2U3RONjhMNVlUUjdtdnRHMDJPWkk3UFFJU1NyeXdtTjhDSzdHbzJPUzBk?=
 =?utf-8?B?eHVjYjZpdnE4dUU4OWZHVUFTU2UySWxFWlNjTTVRbDFuQVZYVzhRTUNiL2Jm?=
 =?utf-8?B?ZTBiN1FhNnFBU0xxTjlsOEZIN0Q1cW1CNE5VTU1xRG5aSmcwOHF1S29zbmt2?=
 =?utf-8?B?aWxlRG01OW9jVHM3UGxHcEZMYnJxRXRQd3Q2OVl3ZXdDaXZOT3J4L1B6VWo5?=
 =?utf-8?B?cGxMaWM0U3pkYldaK015RklnK3hZNEVGWE11RTVlZ0VFNk1uZFp4Uk5kaUJx?=
 =?utf-8?B?aG5WSmJLbFNOeGZVYlZqYzFEc3YwMUJtZFZDV3laMy9LRlg1VzFmRU9raktz?=
 =?utf-8?B?TG1NalNEcTRoUE5tZzdWMVdUb2FNTWxMaXA3RHpCcldMdW95K1c2THZNSGJC?=
 =?utf-8?B?VDVMWEJZeVBiWmNaSkZYMzhmdUtZSlpZUjN3bUVlVmpzK3JLM3FzOUpudDhD?=
 =?utf-8?B?eVJrd1RpR20vWHpNUS9lV1RNQ1VoMElWanRBUXJSY0E3SU1seFNnQmd4S2Fu?=
 =?utf-8?B?Mm9GdXRUMjFFV1JDb2RTL2xzRnVTWk5VZEUyTXlVQ1pOZkZQNGUzdmNpQ2Vs?=
 =?utf-8?B?TXRKVVBKRDlZc1NubFN6aXZIZklmRjFsVUVzQkFYa04vTjRCSmVvZTJVU1FB?=
 =?utf-8?B?SXZuaXh3STJVSjFGcTBwYWVPcVBiZ3F1aVBBV0x6dHZOUmRuTjlDR0tLUGQx?=
 =?utf-8?B?TnhPc21CUThmd1kwM0pCWmdkTHJnMDljZHc1TXhNSFVkTERFWDQvcmZzYS9Q?=
 =?utf-8?B?SVc0Uk9KQzUzWThHWHNwNFZLcFlHdEJiNjJLeUFYTGxiL3d6RFJtbEdEdkxM?=
 =?utf-8?B?OC9UZ09nRTR3cEZuMm1pQ0N6NlNpbkQxQUVGeTdDa0lyZk9lTCs2d3g0NkFJ?=
 =?utf-8?B?MGZSOWpyY1daejBFa2RYeWxmdFJYS0VGRTdHekZwSzdYdFVsc3BEMThaT0Vh?=
 =?utf-8?B?b252ZmxCQWlyZkFCQkhVU0NMRzV2N2tZdTJrN2FoeHBPZVl0U3FiSFF5RURl?=
 =?utf-8?B?cGpscUFLMXY1RjJjbXd1K0dzZWxPbFo2Qno5VUpUaERjMHYvc3k3eldHaTBq?=
 =?utf-8?B?MnBLMmd5YmliZWhzTUpRNEsxMm1aTEMwckhoTUwzMUMzcmJPWTUxTHA3cVpP?=
 =?utf-8?B?a0hkWmJ3cWF2RC80dnhhYThHYS9vUCtNNS9mWEhkMVJwZFhmcWx2NmxVN21y?=
 =?utf-8?B?eVI1d3QwcUFvTUk5WVNuc2N1aHdwaEd5eGRndE5jRjZQaVl1dnNQbjNyTXk1?=
 =?utf-8?B?Q050QWova0MyVGtjcWVnOWJTNnR3bWh0aDkvaGxRRCtBQnNjWGpPNGt6dmxK?=
 =?utf-8?B?b3oycndpZERMSjFwYnNKSTRpNG51Vm9rZ0R0UzdSR0RyYjEzQkp3TDVsSEdk?=
 =?utf-8?B?c09RZXVYalgzNDZna3BjTjRUaEhYOFFnd1ZKV2dLRWpFK3QyRDR6MjRjLzlG?=
 =?utf-8?B?YUM0ZlFtWTlxcUxXVmltSCt0T0h5azlsQlhpZ2FHd0lJdnVpUEhoYXN1THZt?=
 =?utf-8?B?eEhGVGtIckhxcFFIcDVYb3NmWGR5YTh6T1oxU05qZVNZcm4rMFVrR1htOEs0?=
 =?utf-8?B?MFI2RmFiWllBUDdvYjFHMTR5dloxSFA1L1NVcDM2MXNSaktKYWFOQzNTMjFn?=
 =?utf-8?B?djBIcjkrZ0JweEorWE9WL0JQdnFvL2VLRTFsdE40RDZtV2FucFpsSThtcjBM?=
 =?utf-8?B?bDJPRmhJK2pzQVZSUHR1TDhYUHJVNVhBMkw0M3JnVzZoa0xpZ1BsU3FXaUNQ?=
 =?utf-8?B?NjFSUHZBaFJvNXp4MkI5c3oyL0dZZVFqS1lVZ3ZSMnJoRDBIUk43YTlwL0dC?=
 =?utf-8?B?VW9LQ1M3SGtrL1pQcEhKN1pjL1NUQTJ6UWlpOEVwQUF0MlZsdFI4WnhMVTdW?=
 =?utf-8?B?Yzg5RFJOUy8wdTE1Z3pIY005UHovS3lvWjhudG14Ty9EMG9jUElZcHZrTVRi?=
 =?utf-8?B?TlAyLytNWHZDVnNuMUVpQXRCTnpHeS9rUmt0UGRWZ0NLb1I0MHBCMmNqSG5U?=
 =?utf-8?B?T0l4dmpxUDNaVU9TdERJV1czRmN2ZWhJM2dhSXFkQkUxeW9NNHIveFdETmRl?=
 =?utf-8?B?ZUFkRURIZjZMdXpoR01XWjdGRlBVNjkxZXY4eitpOWxKUU9JbldyempoUUFP?=
 =?utf-8?Q?Krpo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk13cVZGdm43SkxBZjl1MXVOdUJ1Ny9VMFpYTmJqdndQUHh5dkQ3WC8yemVt?=
 =?utf-8?B?dkxiR1V4a2dmOHEwUTV5bXdRK2M3bjdhbUFlREVxTVREYUNJSVR5ZXB0S0hB?=
 =?utf-8?B?aGVIVEpNb3dwQk5oSnByTVoxQ3F6TDBxdHdjd1AyMnpZTG44WDVRcUR5bmov?=
 =?utf-8?B?RG5JYXNoNmZiLzErdUZpSHQ3a2hMb00zNlRhTmFXbmlmNGRKVzByUTh6MGZY?=
 =?utf-8?B?UUJ6QmtRVXYrM2RNcjdhNFBhVkYzSlJ1RWtqRThVUGE0ZnJ0NWtENVh5RFpS?=
 =?utf-8?B?ME43YVlnaG5SU2d1UEJQMzdEaHJ0azlob0wzc3hyRWlUNlRsZERJcTl1V2Jy?=
 =?utf-8?B?emdQeWU0YUJNZnJZRkc3OWl3c3RXSE9MVTRsSllDYVlNS3J2ck5TL0ticlFI?=
 =?utf-8?B?VWt1UURnUUxqaFhqY2djNzZpTFJMVnVzUjJUZlQrSE1teE4zZ0YvNWVZUFFR?=
 =?utf-8?B?NDViZ1FGZHZ6elAxTDFsTVBqOHV3bEtkZ0hPWmZkbDBDbkRaOUVMc0o2dTNk?=
 =?utf-8?B?TWI5SjJpRFhRMDlRYUxodVJKWU5VWUJpZitZZHo2YVFzQ3NRUVplRjliK0hR?=
 =?utf-8?B?UzNIV1lYenNXUTFTNnJPWDR0OXY0V2xIaXJ3ampVVkhGTVRkZ1JMdXZYbHBl?=
 =?utf-8?B?V2cwNm41by9RUWtuNHpUTkZTTGx4eTJFazdaOHN6dURsZ1Zzc3RFMytHa3R1?=
 =?utf-8?B?dlZMNGFxQkNrTGVWakxqL1pCeVZwNXNMVnlTYWxucG15Q1BWWEpVRmRocEhz?=
 =?utf-8?B?cmw0YllUb2svTkhSVVZjWG5PR0dFOHBIYitBY1p2bkV2U2VSOVZGOHZFV2No?=
 =?utf-8?B?VE00eXpBcDZxQjh5MXltOVJTcER5ZnpRVmZDTjJoY2M2T0pYMFRYUExuaXNo?=
 =?utf-8?B?MGdGcWFJWUc0dUJ2NjBITmpqU3ZTQXd4T24zYlF2YWNBRTJodzl3YnlXME9E?=
 =?utf-8?B?YndGZ081eittVWR1WXVaRFpoYXVnNjZ0bzdWTmF4NEsvbkdsL2xPRTBOK1pm?=
 =?utf-8?B?N2FXMXB0SnBVQjdxV09sUVB0Z1I3MmViNmtKYUpxd2ZrdUFiU0QvMVdXZkdT?=
 =?utf-8?B?VmJrbWl1M0ppaHpreGZHZHBWR0E4eURyRTF1bloyK0FkdzFLMFlHemVPVjl1?=
 =?utf-8?B?TzkxZTB1RHJMdytTcmtIN1lSLzRHaDlFTjhJbmtpTzMzUSt4RGdab0hBMDJy?=
 =?utf-8?B?NVJzSlFrbHdVMXR6eElvV1ZCcEpTbHlJVkg0Y0o2RHVNbnhsM3ltRUJZRWRZ?=
 =?utf-8?B?bHdoMFpDcFJ2enZlU201ZURjUzdQT3hLWmorUTB6RHo5bC8ybWdwYlRzckNT?=
 =?utf-8?B?a2VlS1BkaU5Oenp1bWMweGQxVU9ldEVDcG1QU3JZaVd5YVNUdzRvZWhOTk9j?=
 =?utf-8?B?UXUvc0pUUGtIV1IzT2QxL3kwWXpjMzUyK1lSY3NmYmVKWTJCT21PSUhnVnkw?=
 =?utf-8?B?eGtybjdKa2ZqWStwMWVNaU1ESWpNNzBYNVRSWkFSSVlTYmVSY1FxbFg0bjhw?=
 =?utf-8?B?T0J3YUFKeW9mb0VzUGdoWHdqa1FpQnVPeGM2V25oeUVhZXErT0MrYmNrRmVI?=
 =?utf-8?B?dVVLM2ZPUHkyUDd0aUhBVmoydC9WdDJyQy9PaFljR0p1L1ViQi9Ybzl5L2VX?=
 =?utf-8?B?ZmdwKzRTMzBlMFRlcEZkQ2dIQXplSWp0OTN0Q0FCcWkwNU1xUGZIa1FjbWNp?=
 =?utf-8?B?L1FlNGlZTlp1c3FrbEFyU083Ym16ek50NFNSa3RKNmNjNllIdSswY3NTVlNU?=
 =?utf-8?B?VFI3TDZmbS9CMDJ6VVY3YTF0czFmMDRIeHN4QURXVkN3MEl3ODVZQnlleGxB?=
 =?utf-8?B?a2xMMTVpQ2FMdm1PWEVmcEFoZGtBaUVjQ0FqaUFOeDYrMnNVNnVyNU13MTly?=
 =?utf-8?B?eDVDK0VoR05wbDc2RS82bzJBWlU2REdUVGh2aXJaakFUTVcxS2lKaEwxV2dK?=
 =?utf-8?B?NTlJdXEyaStFZkJVZHJnRnpOWEI4S2VGMG10QkpibEJka0NtQ2xxaG5jeXVo?=
 =?utf-8?B?YXU4bFgvV1QvRWVkTHVRcHFDaFhDbE84SDg1NXRkanFxVnBLcWpiaDh0RjlF?=
 =?utf-8?B?V1pjbEtPRVJQTERyODNnMS9xRjdnT3lRWDdOMDVtVEtqTGNSVlJDNHVDZmZ0?=
 =?utf-8?B?bTdyNXBKay82UThHMnF1NVNubFZnNWtBQmpLZ0Z0N1VTbEdKUlUxRVhUaWpz?=
 =?utf-8?B?SWx0TU9IVmxDZ3U4Q3RDdkZockcrZGFRWDNlbWVPWkc1NXF6NFg4MWxRM3Ur?=
 =?utf-8?B?WW9CbjhoMGNPSm5ERWRxM1BqZ25mQTJlQnB6TFE2cXlwSE8zL2FORVNMYlY0?=
 =?utf-8?B?R0Y0MnllTFFxSko2Y3ExMHFIRnRLS0JVaVpET1ord01vR2M3Z3F3VXdOeHVV?=
 =?utf-8?Q?9mjGTQSK81FjVWNo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f822b1-959f-404a-11a4-08de65b51f0c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 19:22:51.9797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuI78MdSZHq7UrOHE72rBWtzhwy5vpDl91zU/Ggp+e7+JqLNuqVmu8jM6alL5e3m+SeIxyUSShW2gJBEN+tHCM1VB3dErqtwtEmWCdLzxaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8773
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

On 2/2/2026 5:03 PM, Daniele Ceraolo Spurio wrote:
> This needs an explanation on why this revert is occurring. Also, This patch and
> the next one should be swapped, otherwise if a bisect ends up on this patch the
> feature will be disabled.

Will add explanations. Great note on the corrected order for proper bisect
functionality!
