Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1946CC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 16:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CEA10E0FB;
	Wed, 26 Jun 2024 16:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpG6KN5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A5910E0FB
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719421140; x=1750957140;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4FcoWTQTED9/b3V0vgkaPcUCF6WN3NjhSOhYg1mkv9Y=;
 b=mpG6KN5t7pC+/8TjPehoJAcNROvLSFa8ZwTuQFKU1fKYek03RqLHvFdm
 sywt/7IU4YeSKYiH97FfewW0QOcq1iefZ272J9MbBTPSqYUTYtw0qzGo4
 ypBj9zFvIh4YiQ+claqLVIRxVS0UdqqU9DHgf96c9UGPw+fw4mZYhXfUM
 I/SB3SjHiaWa9bqEUTjaaxVnye7vHOM1RqD11qCwBomkORGuGHj2Ebsv3
 PsQYLqfJrkbWDUijyE++EEYLcMT6Tcq8m/9I821/H4vkFO02Y2XplEle4
 b1IamMUlZbBLKMuja4TftXV/PzrWoTD+CUtgBGUQiI+5a2yyevFmrWCXH A==;
X-CSE-ConnectionGUID: CmAd63OUTOSpthdYcuWUPA==
X-CSE-MsgGUID: sSC7G8BKSdGvBACEyrIu4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="41921811"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="41921811"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:58:59 -0700
X-CSE-ConnectionGUID: 9UeHRXp5TTq2iS9liKQYLw==
X-CSE-MsgGUID: MeyUNDr9QAK8vaSodip0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="43940695"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 09:58:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 09:58:59 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 09:58:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 09:58:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 09:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGUwmnAKxz9yR98IhL25pRBTlxU7LosNAbmMxNgeU6TVTqUissyzonDO6+9iwgRV+qz1F1v044OvRxEfC8+fWfH5PKMO6hxigW9suk5MPu76mO2m6RidNsY6Nxpdme675KZUQ1jv5DAJwTrLe0LZ3/OxiaCNqYgVDUz9p1zTnFj+LHCS6jGruUllXwAMVZ2u39gIox8RgJIrr6eWtg1aNRVxs7eCNPBUmMheewZF0kvRSe5+UCJQJJsKTA/5K0Lz2zdN9rdov1NvvJVa/ohKf4Nyl1/ZJB3DJ3bkAlYL6R4ILaLZTelBN5LXkD65+4TJ1U13Xw5Q3A4mtZxnZMamRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23Vsz3/AdCfLNjDY6UHyjqybipoC3DMQWHrZn3YvWP8=;
 b=csHbnuHOXDtgmi+9gWeKHbMkrBhGTuhMW3yYU12nxlomL9aOjh4chNkl3Fg3WdyqZ6r9DilZ3nx+fUzJcsXILtf8Gm0+8qlwhuW2bddLfCbG35Z+yMwrvjO1zZuxHoaym/dQpX2b0BllMmZw8aVQV/VDzVpHqV5y4lT7pqGTiQIRA+OP9O0JaLnt0jbMohLSUdjo4+8zRDIL0+NwvfqU3UUQyQKIotHf5fCkW2NpnJMy8Wyx4FL6gCBAryItSKE/WxnAtPtpbngc1m7O+y+qGoWk3x6nhgRwU+7ACo4sslnSpVOejD8YsRFhO8e7LjACKPCDuSQMA2/frDpTHMfy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB8024.namprd11.prod.outlook.com (2603:10b6:806:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Wed, 26 Jun
 2024 16:58:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 16:58:56 +0000
Date: Wed, 26 Jun 2024 09:58:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/oa/uapi: Allow preemption to be disabled on
 the stream exec queue
Message-ID: <ZnxIzcDlonfEpLxj@orsosgc001>
References: <20240626021343.1054590-1-ashutosh.dixit@intel.com>
 <20240626021343.1054590-3-ashutosh.dixit@intel.com>
 <ZnuF81Eh7t8AK4KF@orsosgc001>
 <87h6dggmzn.wl-ashutosh.dixit@intel.com>
 <SJ1PR11MB62045AE49B6C38C57CAD313A81D62@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62045AE49B6C38C57CAD313A81D62@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:334::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 6120e042-8d72-4248-893f-08dc9601440a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzFsbVVzb3pMb3FDM0ttRUt6Y2FxWEhLeWd4MythYmpsZ1lJUzFWNHZ2RWRk?=
 =?utf-8?B?N284S3A1dmlldFg0Mi9YOFNRRmFiODdiWkx6TnBOSVFMbmloMDNWZktNaFZv?=
 =?utf-8?B?YUVYNFYzdWVJbUZVUmJ4QndTTmtmSG1GRzFnMkZYNFNlT1lhSXhYeTVOazFR?=
 =?utf-8?B?THN3cXIvS1BZYm5UVkRDNGZCSEV5WjhxUGIvVlJrR09MZGpoNGN0a0V3c0tT?=
 =?utf-8?B?bmg0Z0RaY1drY2ZHVjZzdTBlU01LSDlmN1l6bU9vRE5DQ20wc1VadDZRQjBC?=
 =?utf-8?B?WjNPZFd5Rmdyb1B5aGJ4NG03d1cweWFKTVVxcWp3cTlEaGpZNHllTnZCSXVH?=
 =?utf-8?B?VUgvYkV5SG93S1hHK3BybTFuMFFGSHRGdFpOd3JSWHh0d2h5N0U3bENsdkF4?=
 =?utf-8?B?QWx0cms3WkhLMDRObGxHdDhJQXJIckFLNFAxODl2b0QwODl6VnJ0RU11aVNY?=
 =?utf-8?B?TDVIYWV0cDMzSmZqVU52Nys3RnVXNFRaZTNmSjBSS1dROGZXbnRQb1ZSSGw3?=
 =?utf-8?B?and1bDAzeG5vQWZPNS9iMDRLUm9yQTNWOExYdld1R1pyQzdaMEJyVXY1Q0tz?=
 =?utf-8?B?SXlzRndDdUhrcmhiV3B3N1d5eWJ5aEduY0hLQzc3MlU0TjdhL1oxa1ZGRVVI?=
 =?utf-8?B?eEVYZ1JIbExLTTFqdlRmMW5XcmRtQ2pINUpTeXdrbUI4OTF5ajlWTlpEa3Ev?=
 =?utf-8?B?RjFSNUo1ejh1OVFqYVVKK1pVcGsxL3pSUmp6TDc4cGorODZDYjQ3eW5hUHEr?=
 =?utf-8?B?eHZrUEoweWxuS09kUFgxZ0xOcGgwenh3cStNWjgzRGd4VDZhUExwZ1NBYS9P?=
 =?utf-8?B?SWlUUkR1MXV1K3RKaDJ1VHAvUWdUQnVNMENBejhXUDNYWnFDMExUL1cvdXdi?=
 =?utf-8?B?R0ZpRHRHQ3gvQ3hsOHBOaVB1QUZ4QUJWa29Uam9od2dCY2JmNG5PMmVOTkdO?=
 =?utf-8?B?azUrL2tNdy9iR2dxbzlodkRodE5yMGJGRnRwMm5neGhXeDFLRjdwYWxhK3Jl?=
 =?utf-8?B?SkFmUWZNSjNHK1NBVmxXM2dYdlF3QzR3SVVmK2lYMGZFd0paaU5kQmpMSU9H?=
 =?utf-8?B?RW1VaTFHZGp5UzFNeDRnQXhESGRRM0FNcWRtUEZma21pcVpRcjU1NGNwZGZq?=
 =?utf-8?B?TEM1ZkxsYVpFRm1FcjZsTE50emZwQ2tYUnlYWWVJeVR3aFlJaVZ6VmhxdE04?=
 =?utf-8?B?WExmTWRqRlIzRlVZblFHYzRFMWRqZnJDRm9VVXVPdGFVLytTaWcrQk0zTHpM?=
 =?utf-8?B?N1QxRTlDT1Z5eUpXWDlyd2swcWIyY1d2VVBjZkNjTndydDFNK2gzV2ZoNGp1?=
 =?utf-8?B?UFpKTndwS292SVo5KzFFWGdReWEyTFdFY2JuTjNaazZaYksyeW1qUVZPRGJ4?=
 =?utf-8?B?S3lFY1RHakkrM3RaR3FOTFlhV1djcjAycTZyZndQd0h6VllJbUI0c0YxWWps?=
 =?utf-8?B?TkFwV2FKKytwMmh2OUNxdlptZHY1MkFBMzYyZGJYbXdrcmFxejlORXZYT0Ju?=
 =?utf-8?B?ZUdFL2VFWFpUODhuckJPSHF6aFNwaEZXZy9hOE10U3crSlBiQ0RaamtoUEJM?=
 =?utf-8?B?M3JPVmJPN2F3UW4ycXRmbXdsK2NKelZ0dVh0YUVEUTNxNkw5TEdrWUhzNER1?=
 =?utf-8?B?WmtmV2ZraVFyMkQvTDNJcU1HVEhJYjJVb2R6SXFkdEY1Vm1MRHYzd2pkUlpz?=
 =?utf-8?B?Ylp1eGQ0eEZ4bzgyNDBGa0pJenpFMm14R3ZNTjB4ZTZDeEI4ajdpeUl3cFBn?=
 =?utf-8?Q?befJuPPAOIGN1poGT4KhXHmSSTw6lXvrS1hL7Gg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVhadHEzTGZ1V2ZnVkNrSkhZZWtNaVRzWDlNbnllUlRhR2RuRkUxM1ZDbFVG?=
 =?utf-8?B?OXRkN2R5Q1VMcDVLdGNpYkdBTHNRVE5jUlBkYzN6VlB4enN0U29rU09zNVVV?=
 =?utf-8?B?dHBxWEJYYjdkbXpKM1AyOUJCTzlWbHNCN1JOQjZ3bElHVFNmVWhVcXREQjdM?=
 =?utf-8?B?SW44TjRwWVZWSGVwV3RPNDB0UFUycEZqM0RkdTFvV05UeElOR2N6bXNCOGQz?=
 =?utf-8?B?SHZ2bUdNR0N3a1E4UDFoTzk4QU11S2pqTzBNMmZuTFZTbVJJaVFsR0JHZFZD?=
 =?utf-8?B?QXVWZEdaWGV4T3A1Y1hVN2krdTFJckg3djJQaXU1UkI4cHp0a3N4NTVDZXhz?=
 =?utf-8?B?Q1E3Z1N3QjNoaU5GRUduSjR2cUQ1dWwzQXhWSzlkQnExMy8rMmFBY0pKSTVu?=
 =?utf-8?B?S05hcnVwd2JIMFVFYVhDK2hjUG1Jb0ZieXpiUTNvK0tIQStHUHRhVGRab2Jn?=
 =?utf-8?B?eDFZQVpTTGs1OFJFUXJEVzMrYmowNXF2WEFmOURMSGdmR2hMcnFmaEl2anho?=
 =?utf-8?B?aVM1YVYyaUV4dGwxTkVNOUJwK1IrYmVBaVlNT21HZC91d0hwSDM3WmkrZVhk?=
 =?utf-8?B?Tk9ocmVraGxnaFdWUnJnMkRGdDlQOWlINlh2Q1AyN0lGMS9zWDRhTGRpSDc0?=
 =?utf-8?B?akZmUWVDR2Y0bjNhUXVhS3hzUG1WOG1vTnFIWm1QMnlubkpmMzJGNHZrRERB?=
 =?utf-8?B?K3pyVm4zL3BGSVpGMWduRll4QmIrMW1zeTh2RDF2TllPbXlYbGM3YTNpTHlq?=
 =?utf-8?B?dG5lcDRzYWd3R2JXcWRuekFkVWtkVU9vZUJmRVBDK092ZUZYVSt1cWZDS2VK?=
 =?utf-8?B?MVBiVFlkTmN2empyYkFTVEplSHJzNFpvNkZ0dzZoV3Nqb25DQ3dMVHJCWU5u?=
 =?utf-8?B?RklSRFRXaUs3SnBMN3RGemRTaDlFdGppZW91UjZQWW84M0lwSEFRdmV1Y3JO?=
 =?utf-8?B?UzROL0swbHBnamJWcHRVMGdRY3NySG11V0hnQm9MNlB3UVVOUFhjRGY5c1dC?=
 =?utf-8?B?TDdJaHBMOTd3bFJEaEhnWHpnWDlYQUtzRHhKaFpoK01HbmVBc2NrT0RDYVVR?=
 =?utf-8?B?T2FzeHhwSzdhVmdUT1BITGZqaEVPR1NTb2tkTHArSTlIS2o0RWw3RnFpck8w?=
 =?utf-8?B?ZnlCeGJ4eHVScEF2MGd5b21LS2p6cDI4ZDJqSW00RzExMlFIejM1cTBDd3Ax?=
 =?utf-8?B?aDVMbW9sRTFpR0dCU2lEUVdvZEVMZU5keG9CSEtBZE1aTVl3NUtLM1RFTmor?=
 =?utf-8?B?VEppOUNCaEppenIzZUNZcGF3NWwxS25DNVBKN1VDWndYNmNZVjI0cG1ucU1Y?=
 =?utf-8?B?YVBtMEJtWVhYeGo0blYrMyt1alFBajViRitna01XeVJ0TERiRXpXN0ZhWnBX?=
 =?utf-8?B?d2VWcHdsS1Jua3c0bnhJdzF5cG13Y3JiTitFd0gwY1RiamlZckpxNXFRL2VX?=
 =?utf-8?B?MHVQOW1VQU1WSkpmdnR4KzBpR2FmQ0VHekRJRCtVaHlaWDZ1a2ROZ01GekJw?=
 =?utf-8?B?d1NaRG1oYTZYM2VIeXQ2OUJvNCtRTVoyZUlYRjlmdjh2NGRqSUFIRzg2ZTBD?=
 =?utf-8?B?TXhoRDBKeHhaVmY0NDRERlJoUFZYRFJOY1l5T2tqdVpidGJmN2VvdGEyVHho?=
 =?utf-8?B?VU1xQkVNdTZ1dk95TGh0N0ZSRk5TR05ZTFY3NlBZNCttK1pzdWRHMWMzU0pF?=
 =?utf-8?B?YXo4d01MaVc0TFRMWkwyS2huZU9QRFowVW4zUGRiSm5NdndCblNmaDRrM0No?=
 =?utf-8?B?WmVSUzFYNk9yT0VrTWtUcXZlTSs5c2tHd0xkQWRzYk43TGhIbHZmekpOMjRI?=
 =?utf-8?B?OGwra0pITXA1WnJPM0h3UERCMTRtUkNpNE4rYW1idmZwUUJVaWl0K2ZubTVh?=
 =?utf-8?B?bXJ1bkxQbVp2ejNWYkE3Snd6Z2FwWmdOTEZZMkJ5OVJNZWM4RWc1dEZsVGpX?=
 =?utf-8?B?TzRyQUgySjE0NHg3bkI2dW1IZm1jQjR2cUREbGxpOUZ2Y3RCNHFZK01xa21V?=
 =?utf-8?B?QzZrakpadlR3OUlzbEFMeUNhUmtSZkMrcUpCT2Yya29VNC9FNmN0VEtZWkdJ?=
 =?utf-8?B?TUNKTkJyMDd2SXJkd01PR21tM2VSQ3Yxc29VMVR6RXpjNVd3WUN3UmlBM0Jy?=
 =?utf-8?B?RnhLRnlhRzZDTjhQcXRVbnZic0o0TEROWHE3WkVnaVNDejJBSGlPeFlXdjZJ?=
 =?utf-8?Q?f3VWRc+BId5RE3BtcdYS1Y0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6120e042-8d72-4248-893f-08dc9601440a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 16:58:56.2120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZBZ22TFvv9M8M2lEyLko6TYz5SN5CCcJAkh8/IRhQqBpi5xKKge++Y0LXMsUuPyNACNJdaCcIO74rNjwk45AeDWbrns8FOqoFclUU0HAyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8024
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

On Wed, Jun 26, 2024 at 06:54:30AM -0700, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
>> Sent: Wednesday, June 26, 2024 1:22 PM
>> To: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Brost, Matthew
>> <matthew.brost@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Subject: Re: [PATCH 2/2] drm/xe/oa/uapi: Allow preemption to be disabled on
>> the stream exec queue
>>
>> On Tue, 25 Jun 2024 20:07:31 -0700, Umesh Nerlige Ramappa wrote:
>> >
>>
>> Hi Umesh (and also Matt),
>>
>> > On Tue, Jun 25, 2024 at 07:13:43PM -0700, Ashutosh Dixit wrote:
>> > > Mesa VK_KHR_performance_query use case requires preemption and
>> > > timeslicing to be disabled for the stream exec queue. Implement this
>> > > functionality here.
>> > >
>> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > > ---
>> > > drivers/gpu/drm/xe/xe_oa.c       | 70
>> +++++++++++++++++++++++++++++++-
>> > > drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
>> > > include/uapi/drm/xe_drm.h        |  6 +++
>> > > 3 files changed, 78 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> > > index a68659fd5386..1147035af039 100644
>> > > --- a/drivers/gpu/drm/xe/xe_oa.c
>> > > +++ b/drivers/gpu/drm/xe/xe_oa.c
>> > > @@ -80,6 +80,7 @@ struct xe_oa_open_param {
>> > >	int engine_instance;
>> > >	struct xe_exec_queue *exec_q;
>> > >	struct xe_hw_engine *hwe;
>> > > +	bool no_preempt;
>> > > };
>> > >
>> > > struct xe_oa_config_bo {
>> > > @@ -1013,11 +1014,55 @@ static void xe_oa_stream_disable(struct
>> xe_oa_stream *stream)
>> > >		hrtimer_cancel(&stream->poll_check_timer);
>> > > }
>> > >
>> > > +static int xe_oa_enable_preempt_timeslice(struct xe_oa_stream
>> > > +*stream) {
>> > > +	struct xe_exec_queue *q = stream->exec_q;
>> > > +	int ret1, ret2;
>> > > +
>> > > +	/* Best effort recovery: try to revert both to original, irrespective of
>> error */
>> > > +	ret1 = q->ops->set_timeslice(q, stream->hwe->eclass-
>> >sched_props.timeslice_us);
>> > > +	ret2 = q->ops->set_preempt_timeout(q, stream->hwe->eclass-
>> >sched_props.preempt_timeout_us);
>> > > +	if (ret1 || ret2)
>> > > +		goto err;
>> > > +	return 0;
>> > > +err:
>> > > +	drm_dbg(&stream->oa->xe->drm, "%s failed %d\n", __func__, ret1 ?:
>> > > +ret2);
>> >
>> > Maybe print both rets or something that allows us to know which one
>> failed.
>> >
>> > drm_dbg(&stream->oa->xe->drm, "%s failed ret1 = %d, ret2 = %d\n",
>> > __func__, ret1, ret2);
>>
>> Sure.
>
>I think its better to handle each return value with dbg message in its own branch with custom message, or append existing dbg message with some readble string based on return value. For example,
>drm_dbg(&stream->oa->xe->drm, "set %s failed ret= %d\n", __func__, ret1? "timesliec":"preemt", ret1?:ret2);
>
>>
>> >
>> > > +	return ret1 ?: ret2;
>> > > +}
>> > > +
>> > > +static int xe_oa_disable_preempt_timeslice(struct xe_oa_stream
>> > > +*stream) {
>> > > +	struct xe_exec_queue *q = stream->exec_q;
>> > > +	int ret;
>> > > +
>> > > +	/* Setting values to 0 will disable timeslice and preempt_timeout */
>> > > +	ret = q->ops->set_timeslice(q, 0);
>> > > +	if (ret)
>> > > +		goto err;
>> > > +
>> > > +	ret = q->ops->set_preempt_timeout(q, 0);
>> > > +	if (ret)
>> > > +		goto err;
>> > > +
>> > > +	return 0;
>> > > +err:
>> > > +	xe_oa_enable_preempt_timeslice(stream);
>> > > +	drm_dbg(&stream->oa->xe->drm, "%s failed %d\n", __func__, ret);
>> > > +	return ret;
>> >
>> > 1) I think the same parameters are also exposed via sysfs and they may
>> > be applied at the engine or class level by the user. I believe context
>> > level granularity is only available to KMD.
>>
>> Correct.
>
>Yes, context level granularity is with KMD only during context creation.
>
>>
>> > Hence, for the duration of the OA use case (from open to close of the
>> > stream fd), how do you make sure that someone else is not undoing what
>> > you did here?  I don't see anyone calling these hooks though. The only
>> > place where these params are applied to the context are when the
>> > context is registered (likely when user creates the queue). Better to
>> > have someone from GuC team or Matt confirm that this is okay as is.
>>
>> Correct, this implemenation is assuming that at present there are no other
>> callers of set_timeslice() and set_preempt_timeout() ops (except when the
>> exec queue is created, which is prior to what is happening here). So the
>> question of "someone else undoing what is done here" only arises if there
>> were other callers. And also, as you observed, exec queue properties are not
>> directly modified via sysfs, sysfs only modifies the engine class attributes. So
>> IMO we are good here till other callers of those ops appear and I think it is
>> better to handle those scenarios at that time?
>>
>> > 2) The other aspect I worry about is synchronization between sysfs
>> > modifying the underlying scheduling params and OA trying to modify
>> > them at the some other time. The set hooks themselves don't use any
>> > locks and I think it is because these params are modified in select
>> > places where concurrency may not be an issue. With OA, we may have to
>> > do some sync OR at least rule out potential concurrency issues. Again,
>> > we should understand when these params may be applied outside of OA.
>>
>> Actually, I agree, this is good point and there is a concurrency issue. But it is
>> not specific to OA. The issue already exists when an exec queue is created
>> (sysfs is written to, concurrently with __xe_exec_queue_alloc). So rightfully
>> some locking should be introduced to handle this. We can decide if we want
>> to do this before merging this patch, or do it later since it is a pre-existing
>> issue (it would need to be done in all places where concurrent read/write's of
>> sysfs written values are happening).
>>
>> @Brost, Matthew any comments? Also Cc: @@Upadhyay, Tejas.
>
>What we set through user level is context specific setting and what sysfs sets is engine class specific, both are different. However KMD takes first engine class specific timeout setting and then on top of that user extension properties are applied, so I think no sync up issue here.

If you have ruled out these cases for this implementation, then this is 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>Thanks,
>Tejas
>>
>> Thanks.
>> --
>> Ashutosh
>>
>>
>> >
>> > Thanks,
>> > Umesh
>> >
>> > > +}
>> > > +
>> > > static int xe_oa_enable_locked(struct xe_oa_stream *stream)  {
>> > >	if (stream->enabled)
>> > >		return 0;
>> > >
>> > > +	if (stream->no_preempt) {
>> > > +		int ret = xe_oa_disable_preempt_timeslice(stream);
>> > > +
>> > > +		if (ret)
>> > > +			return ret;
>> > > +	}
>> > > +
>> > >	xe_oa_stream_enable(stream);
>> > >
>> > >	stream->enabled = true;
>> > > @@ -1026,13 +1071,18 @@ static int xe_oa_enable_locked(struct
>> > >xe_oa_stream *stream)
>> > >
>> > > static int xe_oa_disable_locked(struct xe_oa_stream *stream) {
>> > > +	int ret = 0;
>> > > +
>> > >	if (!stream->enabled)
>> > >		return 0;
>> > >
>> > >	xe_oa_stream_disable(stream);
>> > >
>> > > +	if (stream->no_preempt)
>> > > +		ret = xe_oa_enable_preempt_timeslice(stream);
>> > > +
>> > >	stream->enabled = false;
>> > > -	return 0;
>> > > +	return ret;
>> > > }
>> > >
>> > > static long xe_oa_config_locked(struct xe_oa_stream *stream, u64
>> > >arg)  @@ -1307,6 +1357,7 @@ static int xe_oa_stream_init(struct
>> xe_oa_stream *stream,
>> > >	stream->sample = param->sample;
>> > >	stream->periodic = param->period_exponent > 0;
>> > >	stream->period_exponent = param->period_exponent;
>> > > +	stream->no_preempt = param->no_preempt;
>> > >
>> > >	/*
>> > >	 * For Xe2+, when overrun mode is enabled, there are no partial
>> > >reports at the end  @@ -1651,6 +1702,13 @@ static int
>> xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
>> > >	return 0;
>> > > }
>> > >
>> > > +static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
>> > > +				struct xe_oa_open_param *param) {
>> > > +	param->no_preempt = value;
>> > > +	return 0;
>> > > +}
>> > > +
>> > > typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
>> > >				     struct xe_oa_open_param *param);  static
>> const
>> > >xe_oa_set_property_fn xe_oa_set_property_funcs[] = {  @@ -1662,6
>> > >+1720,7 @@ static const xe_oa_set_property_fn
>> xe_oa_set_property_funcs[] = {
>> > >	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
>> > >	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] =
>> xe_oa_set_prop_exec_queue_id,
>> > >	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] =
>> > >xe_oa_set_prop_engine_instance,
>> > > +	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
>> > > };
>> > >
>> > > static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64
>> > >extension,  @@ -1766,6 +1825,15 @@ int xe_oa_stream_open_ioctl(struct
>> drm_device *dev, u64 data, struct drm_file *f
>> > >	if (param.exec_q && !param.sample)
>> > >		privileged_op = false;
>> > >
>> > > +	if (param.no_preempt) {
>> > > +		if (!param.exec_q) {
>> > > +			drm_dbg(&oa->xe->drm, "Preemption disable
>> without exec_q!\n");
>> > > +			ret = -EINVAL;
>> > > +			goto err_exec_q;
>> > > +		}
>> > > +		privileged_op = true;
>> > > +	}
>> > > +
>> > >	if (privileged_op && xe_perf_stream_paranoid &&
>> !perfmon_capable()) {
>> > >		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe
>> perf stream\n");
>> > >		ret = -EACCES;
>> > > diff --git a/drivers/gpu/drm/xe/xe_oa_types.h
>> > >b/drivers/gpu/drm/xe/xe_oa_types.h
>> > > index 706d45577dae..540c3ec53a6d 100644
>> > > --- a/drivers/gpu/drm/xe/xe_oa_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_oa_types.h
>> > > @@ -235,5 +235,8 @@ struct xe_oa_stream {
>> > >
>> > >	/** @oa_status: temporary storage for oa_status register value */
>> > >	u32 oa_status;
>> > > +
>> > > +	/** @no_preempt: Whether preemption and timeslicing is disabled
>> for stream exec_q */
>> > > +	u32 no_preempt;
>> > > };
>> > > #endif
>> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > > index b410553faa9b..12eaa8532b5c 100644
>> > > --- a/include/uapi/drm/xe_drm.h
>> > > +++ b/include/uapi/drm/xe_drm.h
>> > > @@ -1611,6 +1611,12 @@ enum drm_xe_oa_property_id {
>> > >	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will
>> default to 0.
>> > >	 */
>> > >	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
>> > > +
>> > > +	/**
>> > > +	 * @DRM_XE_OA_PROPERTY_NO_PREEMPT: Allow preemption and
>> timeslicing
>> > > +	 * to be disabled for the stream exec queue.
>> > > +	 */
>> > > +	DRM_XE_OA_PROPERTY_NO_PREEMPT,
>> > > };
>> > >
>> > > /**
>> > > --
>> > > 2.41.0
>> > >
