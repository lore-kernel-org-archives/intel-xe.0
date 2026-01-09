Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D407D26D6A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 15:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A401110E26D;
	Fri,  9 Jan 2026 15:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JterT58J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8526A10E26D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 15:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767973300; x=1799509300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HZIUQBvnnxvU42p3WWcUS9S8A1sX+WWsHHOK6nskcwI=;
 b=JterT58JjA/DthwtkvW9ob2fsuyKJdFF/VnlMIb4MQn7Hro2gCCXLsKf
 WTilEUFVer6smkRPRtx5gpeXX166cP+ZjbTdGvK/tjsm6PD9Fkp/a6Vr4
 bptCrlOcrkhjLxEpCrGD4i2acRFnqzMmNrvVPwgIRXuGVoq00O+DoaVgL
 i32IcPwJ/q0ay28AszFI2tkV5IkPhsUaOdk2ag1e+oNJW5O6MvPcWrplN
 XEK9idYt7aMLcJgHYvhCQd7mUV9bX2+mppNfHa+5u/DGQnTxJ2uvqEH7P
 fppLjwnlGgMEM/YAKBIXxSixXblNzKVNWlrS40NytJsLKRDmG/z0AimFU Q==;
X-CSE-ConnectionGUID: f4z0Rr9tQNCj4tD+aELiEQ==
X-CSE-MsgGUID: ZwKlmYMFRGWemgMXx7YOHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69287715"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69287715"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:41:39 -0800
X-CSE-ConnectionGUID: rivoWdbTRs6+peK1+onOKg==
X-CSE-MsgGUID: /zK6eD/GQDK/l6kVhtmRKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="207978463"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:41:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 07:41:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 07:41:38 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 07:41:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9Ls8O6Bb9irT4Z42VLcVQM0Vue2zBDlaV/KhVZJcPPtAklLt9N6qbU7TZhj57AWjiwSfsjN910WAgkhf5XOxBIY8j+JwS3i6rJV9Zb2G+6ydmn2tLbxXBiQW7paOWrwEz8yMPydj1AHl5GwbHhKuPZqqC0GO2H+GqO8dMh1PWwMEiLqMUSwKzQ22K9Z+hR4E5347dXpHRQdrMyoAd8BgTA/TXsGipDzCxVw1+mmYwlHgFOJAanBPQ4wu29vDqEAo3RzzSuybZ1vEiiDm+zb4FUdJXH3OMrVBg7kA27sWuW9soU0Idr6CONvyNKovU95/nujyJIZTk7ptTCxD1dV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZIUQBvnnxvU42p3WWcUS9S8A1sX+WWsHHOK6nskcwI=;
 b=p4BujelkbTmQIx13Oa+2pecl7dAXbX1ChPFbqXB/ACt6c1W+3G7Ewc2j9JfTm9Gu0wlBwsdhzO/64GdkZ6GAFHVwc2ssjOBEpfOBY7pHMcM38seHE6qPU/doKUCafrD9CNwebggGVvOj/p/HTEE7i6GkEyNM57P97nMuVcwonxqF0ncjDEY+yMp1BqvvcyiSR/hdZX9VuAoatx6y3L4tzuvE7tC1CrdzO3trKgJa4IL8RN9NUkLDL7Uxd8oFGZ1UEE5OHV3Myd2U9z6Va0Ej4AllQzC3BxdC6fEi5sRRWkvLb3TEI4q45c/00kp5aTkou/EbE9uffgYdK+PEaQVNog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 15:41:35 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 15:41:34 +0000
Message-ID: <edf5340d-cd05-4cd7-8c6a-f0e04b4dd6e3@intel.com>
Date: Fri, 9 Jan 2026 07:41:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/ptl: Define GSC for PTL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
 <20260108011340.2562349-7-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260108011340.2562349-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f4260b-6736-4afa-9ee9-08de4f9591a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGxqeDE5eFRiRGJmd2gwT1VxUjRNRjY1SERuU1hQajdjT0VtRjIvUlNZbU1j?=
 =?utf-8?B?a2EybThKT3V0L3E4K291QlhEbjFjdVVOeW5UUGtSSENxcW9NQzd6YzAvQ3NW?=
 =?utf-8?B?OFN4WFhJSERQZ3A4cW5xdVp1dG0vM1lXY1FuTk9kZU5KQm9mNVNrZFZ1a2Zh?=
 =?utf-8?B?NVN4S1pMYzdUdjFpREk1dFNGOER4enFoTzBTeFRXVFdlTjVCME1vRHB4RXh6?=
 =?utf-8?B?aG44dkJSa0pQS1FGWWlBZVlrOUNBazhnVVBjdGprZUF3THhkSU5KZlJPa002?=
 =?utf-8?B?MFFCNytnb1FvZDlEUXY5RXZnQnRJZEJKbFJUeUF0SHZTblRURkh4dWJ5VFRM?=
 =?utf-8?B?OXBrQXd4ejc2RG9FOXFMbXA4bisyU1Arc3lhcTVXTnZKcnNnaXpOc0kwd0hw?=
 =?utf-8?B?SXl2clBtakJqcENYbVllTnpFM1VLeE01bHV5emZ5Z1dVdE9oTjFwYnR6MjFP?=
 =?utf-8?B?eUVqeUdtRnV5Tm13STlzVTY1UXhkc3A2ZDRRcG1aa1VydERHNVk0aHZuMG9F?=
 =?utf-8?B?bUVoZm56REU2VGZwYW0xbE5qUkR1L1Y2Vm1YcUsyUldmRzJYREhHZnhkN2xv?=
 =?utf-8?B?eG9taGNnQXB2R002S0tMeDg5b3dVd2tpRHc2VFNVTXRza3hFVXB3MnpxOUJ5?=
 =?utf-8?B?NkRHYXJTSTB4b1VMZVlIVGNlM3F6N0xSellmTGthL3FCTnVuSkpJdmozQ3B4?=
 =?utf-8?B?UDZncUhUNFJQZnpMTkFBbGVpTFhJNmxRKzhGT0dobjhySStCaXpHbHV5ak9z?=
 =?utf-8?B?eGkyV2Z4MW9nTnNHOXlEY054WUJLdzk2NTlxZ0gydzB5bENjeUt3dGhGRWZ2?=
 =?utf-8?B?WWJQUHJDbGs4czhLcjI3Q2FWUVYzNFIzTlhFdi96YVFJVW8ybkdCVFJaUnZI?=
 =?utf-8?B?WE1XNjdEcEYzSGMwN0RkaFBEeW9oa2hSelhPaTQrZjVtNzFtbGRkUHBjRjQv?=
 =?utf-8?B?Z1hGb2g2bmVFK2t0bG1hSGZwOWw1UU1JTjYzNXNBWDhLRE14WDlWZmNCT3Y4?=
 =?utf-8?B?TjRRaVlOMGdoY1lkb3JGMHk5UFhnT1d2cmFSWHBIdlkvSG5TMndLbmM5ZXRN?=
 =?utf-8?B?V0lMMG1pUDMycW44UGRaNXl4cElTOFBjaE5wTm1xUm1RQzk1TTlCdkVMTHVk?=
 =?utf-8?B?UjlxSEF6ekdncEp2Q1QwblhvZ1dKWjVFMjZCNnprc0tuVThsd1VZbU85VE9B?=
 =?utf-8?B?RExEM2JGaTZuTVFxT0Z6M3k0cG91bWV2SkRCM0ZZaWdRSEhzazJWdjdwdnhJ?=
 =?utf-8?B?ZkJHaUdieE5wMTVCZzNyOFpJNVRGcm9jWXVWcWhCa3c2aXprVFpSZjV3eGJO?=
 =?utf-8?B?eklJVTZIWGhoVmQvVTdCUGkwN1k4eTBRaEgyWGdZSU9XWWZkTDQ3Y0h1WkE0?=
 =?utf-8?B?dGs4S2NVSWFEbzM3TkM1NzdzeVlBMlNOajNRYUtVdmZtWW92dG9Ga2dzR1Js?=
 =?utf-8?B?VHJrTGc5Zko3RDFnZXJVMjJaS2t5bEtvRjZ3RjBPZWFERUR5R09TbGY4dzVN?=
 =?utf-8?B?SXBTMjdTbVh2cHVNQ1BGclNMZ04xMEdDdmkyWGFJZWY5MWt6VUVTOWt4SGxu?=
 =?utf-8?B?cFR3ZUNrUXlIa1NpQmM0emZORzdVVDN1WWtLWUx4NkdZWkxoS1k4a3JsaHhO?=
 =?utf-8?B?VGJyc3N1L0FWMWQ0LzZsRFlJSU9RNVFVZ21melhET1VabUYxNjlDeE5jKzRQ?=
 =?utf-8?B?dkJ0RnhPbFkyeEpDdnRBRkt5NThJT2JwN2t2UXNPYUNtLzVnTUVveWlrSWdJ?=
 =?utf-8?B?WGxIdEFuNHNNSTVjME5OT3ZGSHBrVTlhekhqbGdMTHRuRVZzK0lGKzUwdHZG?=
 =?utf-8?B?U2NRNU1veERaLzZzWS81ZHJydCtWZHJuYUJvQ09yQUl4Ti9rZFhDRTl4UzUr?=
 =?utf-8?B?Q2p0a0puNWdNSHhIN2s3TW93aHVseTBDS3N2N28yMlNFYmZKcThFWFM3VlNH?=
 =?utf-8?Q?4dTgDx2Ba0Dh2ECDoua3nf+Ytf4fS1eV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTFuTThGdUIzandMdExxTWgxTWhWdkRkRnhHeVo3WGJEMThoRDFDQnorSnRH?=
 =?utf-8?B?QjRDNUZSOHl6ZEsySjVYbFI0NnVDdXNEVDdBS1V2WUlYY1VpL1BzK2g2Ukd3?=
 =?utf-8?B?TFJoYU4ySXBHanZUdkpBdklCUWw2TkUzV0d0Y1lJeDBPbndrc3VsUUVPaEc4?=
 =?utf-8?B?NktERVB1bWRsMHJnVi8vZ1dkZjdhaHAzaGF5WCtwZGhWK1ZLUkl6aUJoNTJJ?=
 =?utf-8?B?RkpVSU4rOGJjclhSaWJkRlZEWVp0UHBDeG04SnJJUHdtNWM3V05Hb2pEMGQx?=
 =?utf-8?B?UlY4L1JRQ0hTaXdicUtOT1p3dmNzTFlNUkpwRVhodXNiaDNqeEJ3US9PZExW?=
 =?utf-8?B?cDVHOWwzRjBBaFNpMk9VelBzc1pIbytwejRPUHpjd0NHdVE3d3pKMWoxOWJq?=
 =?utf-8?B?VnJFekdQRE8xVmFsVnVNcnBueWozVU5kZnZjSGxkMDd1aDNFOE9tY2c1VlZa?=
 =?utf-8?B?TGl0dGpzeWlRTFEzRWhiUzZUNUM3MjVXSWhBTk9sNTRMeTc2aXdYZ1c5eU9I?=
 =?utf-8?B?emNlUUdzTlNmeW91ZEFvaEVHZ0ZkRm45Q2NxcTBjTVg5U2dkdkoxNHBWVEY0?=
 =?utf-8?B?U1UvOGRJdUZnR3liS2xEVjFyMEpGeVZYWmRXMEh4Z2dLSmx2cEZpekZmcWRP?=
 =?utf-8?B?RFhhUEdzWm14dXBFWkVnR1NoODF3NTA5eVF6ZTRlV0ZoVDFRR2NoQnpxdk4r?=
 =?utf-8?B?TFlsdnE5NHVGY1FnTm05ZGtRSmN5NDdqT3hhQTlubjJzNldQNlVRR1RpYlFZ?=
 =?utf-8?B?ZkpUNTJ0cnFjeXIyTWNJM0dacmNFZDNMMTd5Z0VaYlN0Qk5YYkFEL0JSbzNh?=
 =?utf-8?B?R1hoUk5vZmFqMk9mbFhRNnQzRmdvb1F4YXFoWVNjMEhtRVZVTVBYSlVud0FB?=
 =?utf-8?B?cmZSNXEzV0ZxVFp5Z3R6VS8yblQxMEN4VkswcDZCc0VTdk1SS0EzQXhUUzZ2?=
 =?utf-8?B?QS9XVXR0cHlNNTY3SDFqWFZLQWNnR1dLczUySzdrWUg0c2xWY0s0L0tCMnkv?=
 =?utf-8?B?T2FDWExIMGloYWZTRlkvZmFOczR2dmd2N2pma3hxSzg4ZFZ1bjE5ZHVVR1VM?=
 =?utf-8?B?d2xKU1I0TEh3ZUk1OWllRkIwVjI1dFRCbHJRbFgvbmF3QlNQSVlXb3NUMi9G?=
 =?utf-8?B?QkhYdzFJdm5vK2twQ2pIaFdrMXRWNkpGZ2J0ZEJBdkdHTEJQU09tRGlncGcz?=
 =?utf-8?B?bENTeHd5WVRpQTRMNTdRQjgwZlhmYXp5YXVaUlRoYWFZaEk5dUJBNkRaL2FI?=
 =?utf-8?B?VHBZV2NXRSs0elBXM29NZVNEdGNHVExUKzhiMXFmMVF4dkxTMzU2citqbzcx?=
 =?utf-8?B?VFVxVEwzMDVDZ3dTR2dPY3lLSWxXSmc4WE9qcHJYYmlhMFZvUEVjaUFkdDlq?=
 =?utf-8?B?UTBna3ZEZmFkZEcyNWdXSVFSQ0ZkTzlyQWhnekYwUmNmVGhDM1FWakpJMERj?=
 =?utf-8?B?L211a3IxVm5BNWo2RVI1TEs2L2dtaFZoanJodHk1R0VaQ3VXMFhQWHlmU3JN?=
 =?utf-8?B?TjU4WTQwOU9rSkhtNFVyVThGYVA3V3Q3ZnRNR3l4Y2xzWFVZM2RFb2hzdFFv?=
 =?utf-8?B?bFkzV2JOUUV6elI4ZXQySko3QTB2Q2huTGlJTDhUbHhCdUJrVVlabFNnblNj?=
 =?utf-8?B?cHpJSnlad25FTU1zVDMrdjNuUk9tWWNrWjBzMThBa0h5S3JKS0IwclY1bVJF?=
 =?utf-8?B?dVF2M2QzN2NaZGlUWWVqalFUbHZmakVnNW9RWmlXbzdjU1V6MzF3U1gzRURx?=
 =?utf-8?B?UUk4VEsxdlcwWkNzZlpKbGpid1pKZi9Cd29hNHR2NUZjcFpRREVmYUxnUEdr?=
 =?utf-8?B?L1lkQjcwTkRzZHhzT0FGWDdWTXhna1l4UVFMdXpPbFlBS3ZnODlXSXVUblR5?=
 =?utf-8?B?QXppODlMRmozaTFjY2dQRnhKZlUycjRDQUNLNU5QN3NzbkJkMXEvdkIxSUlK?=
 =?utf-8?B?S1B3ay95dUg3RExtWlViYTVleHkyNE1sRjBkU29mejRMWlNRazJLOTNlTGlH?=
 =?utf-8?B?aFVLY3pBTGhTeFM3eFlyRmRWQXIvaGI2UXVoaWorQ1diZ1JBU1A5Tzc0OU55?=
 =?utf-8?B?Rjk3YzhEaDdOcy9VZFkxbW1kMHNZWGNGTkc3WThuOXQxZEhKSHlzNFRvOXZi?=
 =?utf-8?B?K08rdEdXVVpBeVF6QjcvY3NrcFdjek5LNDZzWTM4YUJLbmM5TzZ1S2wzOUJt?=
 =?utf-8?B?WUJZYlRZenRhb0s2YlJTNzNGd3ZjWVdNQy9aa1JBbkduUElaKzhyN3FyMzNJ?=
 =?utf-8?B?S2RFakpEWWdBYUV2ZGpkdWNSdC9OaDUwSjU5Zk9HV2tYKzFBZ0pkdkJoQStF?=
 =?utf-8?B?NXN0UGZIeUQ0QkxaWjF4Z1l2VFk0NDhSMXlqakNiNVE0QS9qZVR2KzJBQWJh?=
 =?utf-8?Q?WOHwONhO80EzYhvI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f4260b-6736-4afa-9ee9-08de4f9591a9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:41:34.8659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyWrM1O9bZTngKOl+JSn5Sr6bApAD/76vE+nbaBIcqgBFZm1Cv0ZeQZIeur1aeBC3JEVDzU25T7TdH9cwlLmiC7e/XjKWJt7UFfzCecJ97c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
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
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
