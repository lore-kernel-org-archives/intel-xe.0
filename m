Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89A3C624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6375B10E667;
	Mon, 31 Aug 2026 06:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lj8hJIyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDDA10E667
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159347; x=1819695347;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=48cwpu7BXcsd5Of04Va1ioZIHeYr6eiclGKRXRsx7Yk=;
 b=Lj8hJIyhyrJgPAl9lcJLIpKKmpyzhEpSXpA9z6clnD5Czvcj+YFR2uLG
 LGIDTVvn6gZStI3szDH61xj5DOCTj/wXe3OLwnCwQemYhoEXX0FQR3rAD
 +gav3/wazAHwt6rVi7XlLfH8/d67Fx/8BWuOGg7KrvGjOiKuUpSwNJJQb
 i8aH9DkX9gyGt4tcnqJdl1WAjdpRpL31QEmqRy8oYbYxZx2Rh/UuhIPN1
 UxeVPVp4qWVk1WZMIzh+jGdXGqgM1/kXAipV6ikQXnNjD0u+wBozeKocs
 WOA0ygwnC1Isu/6I4CJVtai7OVltgqvwi3mlMs7ukhYQi8Is7l0kykIx+ A==;
X-CSE-ConnectionGUID: wretfn0jTpiKvAdAO5S83Q==
X-CSE-MsgGUID: xjxN0E52SRmlNDriPNtkwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="114093970"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="114093970"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:55:46 -0700
X-CSE-ConnectionGUID: IIjHK7qoSje3Kbthe3nbQw==
X-CSE-MsgGUID: NVuHmq6cTySUyFUExtdtXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="262579345"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:55:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:55:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 23:55:46 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:55:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtCcWHCz9mqek3sa5fyN9mjz/j9UndHFIblS/XtIeeXGeQYgkF6fEEUv/4S7LprNlbW0zL1Rflnsd7N+Vm8mAH5YxKIbGthbxfwDP+5H9RmecbShdnxoTnvoERDvC6fYL/CSXx5Uufcw/gu9eYWkdHhENkHLzUaCqoWgdbdH+/7DrJk0R2T84BhlkvSavu4DSvY1KkpMB/o+hYnBDKPXO0XVhSvStXk5u0Lv9i68LQ4kmQJae7xNMkjOybBTNZKy/cVpXVaySCBHwRBDYo5AqJHpIDSi0lgA4P24uxAOLUb2mb98mjF+84Dri0V97qV+wQ7jPgdhDX002nKooJZZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVsW2rDqNKhb+GwqheZKZSrVMQUrF5S2DK37iVwU8mc=;
 b=yPJ9+1s1owwrPb4Y364KNzhTbB2rP5BnqzrAKfG5l8sxJCsZuLIyOKwclWyfnaa3Vw5Zeu2uWgr9PM5EVn8wwdsJmLQqwacXnIu5yGl+q3+qsg7CzkjxuEuxrNxgJxwN9bfwJAZP35dLm1Xs2R6fok7drYLcvtRiRNu4fX3RGC+EyBVfd/3yht+2uUGJybQw5s+Wwrj6+9ynHWnUtJ7NEmQpkXAZQB65xYYMMbqJA+bLtn4XxlmoMhmTItdVduFYkqLnTEw7IaLxii/Q2zlUtPrDhOxSuxJQc6vd/7fV9H/MLLLzIXdomfBAmuoSlC1/155yY47DLYi9KIpcIZl9IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB6076.namprd11.prod.outlook.com
 (2603:10b6:208:3d4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:55:39 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:55:39 +0000
Message-ID: <94118752-a7b1-4693-856b-547a4f407452@intel.com>
Date: Mon, 31 Aug 2026 12:25:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V19 13/15] drm/xe: Expose bad VRAM pages via debugfs
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20260831064942.315720-17-tejas.upadhyay@intel.com>
 <20260831064942.315720-30-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260831064942.315720-30-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: c1436e07-a805-486e-17c8-08df072cdda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: Zc8cFG6Siy5YStpE2WV8aN6kwsYHZZ+2e8yyr23l9a8NcSmdenledlljrr4ZJ1SRbGOh703XEOW4Bja0Wm6YSueauQ/0P6PBkkYG99LLEgBLsdRqQBZWPQbsUyIegGWsgRhvuiujIS6myL7I1c91Ozhg9CN+VYxLaII4YDRKk9/cvOimyEWFGnmskjU5T163C15NneRTLvPFaa4XrXKA30SIwMVzAn2QwrX9Fwt7av4B8nmLuOuuhtqlBQzJvoWmkj5iyxzE1xcSeLn8ja1FlYBwpUttKNi/pwq9D3C/sYKx9QyM3q796Blw87oLc7Ax/Kgr94MfkfV0IqPq9uammA5pM5SgPssnXRJCRBWluY3BLC0CXN8lICNIsTmC4VsbJuXC2EEidwu0XRpqznjwgfojEg81zd+/6onA2lfHTPdGaNoIdpnVC/8Uu5m5YdpuxUgHrihbdlFRiRDPsLEls8i7HLkdnTnNdOwe1VU1YvYq9OzYWrhmRqveWFp3I+JNz2sSLS98JRm2Fnc/bqtjIEBJRggKV1GKHICGGd83eMk27Vgboc8oTF5d+a4Ti7dHfz01dtPInmMp6sYNQwofkvUY8cRkLuewsKuT0rd1ajyJJYlhOmerKquqrmRKUXE+1dDW67osCeEYF4AgygvV8oKIZNMfoD+CgMt5OjHaWsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjI5bTArRmplL1lIYlJSaUZXaCtJR2xzQ3VZd3hjNksxSUJYV3piVDdlRU94?=
 =?utf-8?B?S05tQXJKcThNYzM1VVh0VU00c2xRMWJXZkVHU1E5Mk92YVZTQ3JsUEpRQlp4?=
 =?utf-8?B?dEswaXJwNnR4UncrOERNT0tHeWlaSm81WU0yM043d0JMeFZ4SGwwRkRUWjh6?=
 =?utf-8?B?aHRDTnNVMlRmb1E4WGxUT0NVd1VhOXBrNUV6YXFKR294SXhlR0ppRTlsN2Vi?=
 =?utf-8?B?czBTV29Cb2cvMVJNb2cxcFAxV2pjT3NYME5ic3p0bFdCTjNFODVhS2V0ZlJX?=
 =?utf-8?B?aksrUFFzZUNFbWJiNWI2dmdQNnZPdm1YbEduMnQ4c0JkaDhMV2FkKy9YM01a?=
 =?utf-8?B?V05ycEZXYWE3WE1Kb1FtQXMrUi91Qi84V01OUWhkSSt1ZkJJejJhc3JkZVhl?=
 =?utf-8?B?OXBMTktpaGdoby9taTZySWhIR0g1bzdFOEt2MjBHNmlLaWNDTlloeEY2dzVq?=
 =?utf-8?B?dGZwYU1oUkJVUkpIZ2dOcDhHZ1k4S0RhaldMVTBiNXhVR21GdU5MdGVRa0hj?=
 =?utf-8?B?bVc2MjY1b2cyME9JVm5iTkRFbVNtZk52c2VCUi9IREVNVVdQUnJRTUJMT29O?=
 =?utf-8?B?TXJEemxzbFhPaERiSVJrUTRTUFQrWW9Xc2JzMHUyQjM1ZE5oWWRkTDlOeE9M?=
 =?utf-8?B?R0IwbGhZY0IyU1VHbmtJNU9pNjZ3aktERDhWYTV4NElRdklpc1R5RHBQR251?=
 =?utf-8?B?akRtRVRKZS92dkhUMGNBdFB6RHVOb3dUdVNwWmcweWNTVEpMSmMxVTBvakpC?=
 =?utf-8?B?NXhidkY2SEEvU0hETEJoUWh6RVM0TktzejNiYThkS3VKcXJoRllTei9yUDhj?=
 =?utf-8?B?R0dUcjdSN2J6STFBN2ZlR2ZXaFZsSGV2MmxiNFc5NmxXQWlpWWJlaWo1NDFz?=
 =?utf-8?B?T0pFTUQ5dC9xcm92OXRpVFVVNWlneW1ka3RwbXJxVWk0MitxR2xFNmN0SFM5?=
 =?utf-8?B?SlNIZkkxZ1I1QXNwV3NaQjc0bDQrQ1hIaHczVkhBVTFqYWs2dzdiRHZlQjRH?=
 =?utf-8?B?cGc5VVhUZFpQSm1vZmtQL0h0SHJBbVhUS3BsTzRsNU5oN1BMYkxINUNKd2xZ?=
 =?utf-8?B?SzZsV2hFL29KdkhXSDdUUCt5VUtORXFwZXYzMDNITTlCTFN2aFZXakptRHRK?=
 =?utf-8?B?emRxQzBpZ0FxZEg5QjBVY3lDZnBPb2xPTXM4N2J2cngrdmN2RjdudmtveWdl?=
 =?utf-8?B?NjVrblQ0QUdITFZMVm5wRDFuZ05PZ2Jtd3grbVhnZkRhZlFMMUorV25wbncw?=
 =?utf-8?B?bkJyNlI1OVNtbk9UcW1SRkVsS0w0YnA2dWMyUFNac1FYdXRtM1RHN0szNXZY?=
 =?utf-8?B?SUFQcTU1YWFlTkE3YWc4UnlKd0FKR09JNjEwbVVBcWZGMTU0N0FsR2FYYTUr?=
 =?utf-8?B?N0tadHlVZUN1a0hvN3UrL1I0cTRIN3dSS3R3SzQrQmZqUnJJWXZ1blAwZ1kv?=
 =?utf-8?B?V3dlRkdFQTJkR2dabi9rZHdtZWc3RmFPUkp6NmxhcWt5UW85SmRFcW5lZ1pw?=
 =?utf-8?B?RzhCNUExWlRQNlZIN3hDNDcvKzJ0ZGpEQVBNbUt0TmJMd3JoV09iWnRRanNH?=
 =?utf-8?B?bG5GOFZDRWhpZjNwMTEyeGx3VVZQbXRsK2NsNWZYcFI1ZG1hNXFYYkRaQWh2?=
 =?utf-8?B?eWV6QTM4dXcwL0N5VzVZVzZHWUV2OHUwUnFHZUQwUGs4ZlBFNys0R1pvV0l0?=
 =?utf-8?B?LzE2OTJVTEVSZERkVnU0VXhZeGhCVnlhYmdwK20rV3p6VEM2SHowWHlpUXgx?=
 =?utf-8?B?T3N4QTdYS1A0NEtkZVFMdmxrL09yN2JCcTFWeXVEeXlpL05PbXllcjkzR3c3?=
 =?utf-8?B?Ky8xRzZZaVZoTWhwMGhDWDJOQm4zS2ZpODMrU0I3NGdvaTBCOGd5T256eUlE?=
 =?utf-8?B?eHp2MlUwWkdGTkx1c3k0cVhMV1lPMms3YmtJTnNtTlVHN2tEaGFGbzRQNmZK?=
 =?utf-8?B?Y2szQlNWV3VEdE4rdm1Sa0pXVUdNNHoyR3hyUXZXRlU5cnJQNm53NzVoMWFu?=
 =?utf-8?B?SndRREttSE1GZW4veWtlT3ptcWQvd25KQnBCVzVTY3M5Z3J1a2hDMlY2NXBj?=
 =?utf-8?B?UllsaFNZWEdQSkpJZmU5OThDK2Erc2w5dGVaTWdOc1c0QWlaOURvamhoejR3?=
 =?utf-8?B?NjVvUXFlcGFiUmVONVUzWHhqcjRnNkFIWHNWNGwwdWZNUUFVVHhsc0cvRUZW?=
 =?utf-8?B?djNCbzJRazZxKzJGME1mNzlsRzV3UXB0cGoxblNBUWNmaXU1Z1hzM21CaFpp?=
 =?utf-8?B?a2NzajQrUm9ZcXUxbUxPelZHOFNMV2duZVFxZHhtOGYvSS9xckk0cGR3akNV?=
 =?utf-8?B?OFZ2VnNsTWIyWnJKYkNVUVpOVFBtMmlzSk1VclQ3UCs0K2RENVVlcC9xN2dU?=
 =?utf-8?Q?Lq9RIf0GyNmrnfSs=3D?=
X-Exchange-RoutingPolicyChecked: CVSL0G9g52X3OcUu9JkGvvoPEub08xDMXflzenPViZVHr9WPfh1VcbYzdsHI6FVi4QF1CiiDli8H4nyhYzs5kQpd5II25lhoa+Bt3KlT/dWlyus4AtHhbnOYDRzuWdVcideMNnuLx0pNz0T0nSWUAdmdLPQe0XYQh40Uk+i176kiePC6z3Loh3wgfgIa9vlOHZM1TjniLqvcOJLEqPx4W63+D31GfY9/kCbWVSj3epml49zeqLvX86OK0ZVeCsIrBG4UkbXBXEjFZ7JlOZMJpSInEYbn7kjOqXffQKvu0Gv12Tocv7+2No91hqCCPdnWwmTpWZUVL9ynY/VS4qT5mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1436e07-a805-486e-17c8-08df072cdda8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:55:38.9746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Whqe+bfPPElObtGlRy3nvf1kyM/FFd/Cu1rJUNukvWDtMDbjR4vfhxVT1fyDUf9gFoJVCFv+msE3mur9iUnpwxzbgUdlpc3mhOghuzpyYVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
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



On 31-08-2026 12:19, Tejas Upadhyay wrote:
> Add a debugfs file "vram_bad_pages" that shows offlined and queued
> VRAM pages across all tiles. Each entry displays the page frame number,
> GPU page size, and status flag (R=reserved, P=pending, F=failed).
> 
> example,
> cat /sys/kernel/debug/dri/0/vram_bad_pages
> 
> max_pages: 10000
> 0x0000000000000000 : 0x0000000000001000 : R
> 0x0000000000001234 : 0x0000000000001000 : P
> 0x0000000000080000 : 0x0000000000001000 : R   ← tile 1 addr
> 
> v2(Sashikoi/Michal/Himal):
> -Remove block iteration, use offline and queue list only
> -Move platform check inside api
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c            |  3 ++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 59 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  2 +
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
>   4 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 28135f84e286..cb24e001b142 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -32,6 +32,7 @@
>   #include "xe_sriov_vf.h"
>   #include "xe_step.h"
>   #include "xe_tile_debugfs.h"
> +#include "xe_ttm_vram_mgr.h"
>   #include "xe_vsec.h"
>   #include "xe_wa.h"
>   
> @@ -773,6 +774,8 @@ void xe_debugfs_register(struct xe_device *xe)
>   	if (man)
>   		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
>   
> +	xe_ttm_vram_debugfs_init(xe, root);
> +
>   	for_each_tile(tile, xe, tile_id)
>   		xe_tile_debugfs_register(tile);
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 286c866f1d58..456ea78a31e2 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/cgroup_dmem.h>
> +#include <linux/debugfs.h>
>   
>   #include <drm/drm_managed.h>
>   #include <drm/drm_drv.h>
> @@ -845,3 +846,61 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
>   }
>   EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> +
> +static int vram_bad_pages_show(struct seq_file *m, void *unused)
> +{
> +	struct xe_device *xe = m->private;
> +	struct xe_ttm_vram_offline_resource *pos;
> +	struct ttm_resource_manager *man;
> +	struct xe_ttm_vram_mgr *mgr;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> +	if (man)
> +		/* TODO Hook with RAS to show max_pages fetched from FW */
> +		seq_printf(m, "max_pages: %d\n",
> +			   to_xe_ttm_vram_mgr(man)->max_pages);
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_vram_region *vr = tile->mem.vram;
> +
> +		man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
> +		if (!man || !vr)
> +			continue;
> +		mgr = to_xe_ttm_vram_mgr(man);
> +
> +		rcu_read_lock();
> +
> +		list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +			u64 pfn;
> +
> +			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +			seq_printf(m, "0x%016llx : 0x%016lx : R\n", pfn, PAGE_SIZE);
> +		}
> +
> +		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> +			u64 pfn;
> +
> +			pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +			seq_printf(m, "0x%016llx : 0x%016lx : %c\n",
> +				   pfn, PAGE_SIZE, pos->status ? 'F' : 'P');
> +		}
> +
> +		rcu_read_unlock();
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(vram_bad_pages);

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> +
> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root)
> +{
> +	/*
> +	 * TODO: Replace platform check with xe->info
> +	 * once the feature flag is plumbed through device info.
> +	 */
> +	if (xe->info.platform != XE_CRESCENTISLAND)
> +		return;
> +	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_fops);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index d5392beff30c..f354c26c4257 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -9,6 +9,7 @@
>   #include "xe_ttm_vram_mgr_types.h"
>   
>   enum dma_data_direction;
> +struct dentry;
>   struct xe_device;
>   struct xe_tile;
>   struct xe_vram_region;
> @@ -32,6 +33,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   			  u64 *used, u64 *used_visible);
>   
>   int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);
>   static inline struct xe_ttm_vram_mgr_resource *
>   to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index dc97b0ad0e51..efcf3e1d4e80 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
>   	struct mutex lock;
>   	/** @mem_type: The TTM memory type */
>   	u32 mem_type;
> +	/** @max_pages: max pages that can be in offline queue retrieved from FW */
> +	u16 max_pages;
>   };
>   
>   /**

