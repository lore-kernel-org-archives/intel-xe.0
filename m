Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5D0CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 20:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FE910EADC;
	Thu,  4 Sep 2025 20:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Twi7SAYV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB6F10EADC
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 20:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757018774; x=1788554774;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ECpWEQglZbl9A+Rv+DSeg7p2nDepKpha9aOHD23MTpM=;
 b=Twi7SAYVLwm+1yNffQ7HLnr8MLzrleTcTYmc9GjmCAZlP2sHhXxHjjl9
 l+5hAGbMqAZk//RJtjDjVx8eastvKNd1hhuTlDGZiTpLK5uVp6njBGNmc
 TOgK+c2G7kJOVCG23cMskXKRwBC2pFjjns8l93c/gS8VcAccLT74Ld9Fm
 cx9S86OvBso5wegbNbNHIXx/2qyYS1Fl1DxTvO0aBp9FOS1OLC+AJ3+Mm
 Rzm36lTPy+IN1kxiqiCp4HmvkYnHs9fGx7/0hzmHWRj+XvdQmBjrvl0h1
 urK2VwSGrmkzysHuvcRTa4J67A1PIEvySb02LDlAOzDB8ybpZeHhDz+Pt A==;
X-CSE-ConnectionGUID: +g76C8qCQaWvSJvnJGR3Ow==
X-CSE-MsgGUID: HML2yAgMSimHV5BRFXpMTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="70748398"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="70748398"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:46:14 -0700
X-CSE-ConnectionGUID: +vFsl748SEan29pqb340Ag==
X-CSE-MsgGUID: GRGnqGFFT1+rKgJQP1cpAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="209168531"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 13:46:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:46:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 13:46:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.54)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 13:46:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=As+Jbhf3vOAoJaRm880T4Olp0k0Vsto+rniAQB/9YV+/1FpiCpA5LgLAwiU9W3oih3y4lKF+1crYiDzyEaBh6NpzGJl9llU4EIrOrOKUfVyd+k10LvsIQ6+AWxjM6DfnGpyq103nbK7Rc8fJM2wXNWhMUPDiLu1t79UcCVtPGxBDrElQvYs3+epKGirxi2dUKkse3GSBOYUPkIrho1PkpJZlgfMZ0rYv7SIz3xaF7hIxeA19EthlFOejADBhEJ5+aW7KyCxBXW6HPKUBPIv0DlvWWfyfoPvN3t9SobhJfASQ1P2bD1t9onKHTx8FsOZBoyhHhR2WVtZD87SsMaLAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKv3rHdmlj27wjiDlJt0fsoSYahG/AwNyPMMEVgxcdQ=;
 b=d+RMmF90uV6d8V1KCcwiYyYrKYHhLN6D6PdDSqWwiC/OIAIJ3Y2hg0FTeZX7iLtwBKB+wzwHT6rxqWra7p9mkOPTctOwt1Fd8YV4d6FtXjVZsdRLXHziXPQLDtjfAXUt9dRw69kglR4Krs015AgU7R5qmWlaSVtwUwDyobEK3DWuznOdSSsA+kSitpmbBRJAUZWp42GRar34ufJjF5/WD6ViC//oIGVAXeRC/hn/ln6MaMx7YGVmz8XfzpKA6mSh7lB9lnf5b9OlzcgvbeEJ1+reb3erATmHArhkQwTZ7rCFmAQjYQcF4TgkR2g8sLPThj07uV4n1JLjERSCZXUxCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by PH3PPFE26A71A1E.namprd11.prod.outlook.com (2603:10b6:518:1::d58)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:46:10 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 20:46:10 +0000
Message-ID: <f7f09822-751f-4b50-b397-b50c4c6ed06c@intel.com>
Date: Thu, 4 Sep 2025 13:46:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Allow error injection for
 xe_pxp_exec_queue_add
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250818234639.2965656-3-daniele.ceraolospurio@intel.com>
 <20250818234639.2965656-4-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250818234639.2965656-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0245.namprd04.prod.outlook.com
 (2603:10b6:303:88::10) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|PH3PPFE26A71A1E:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9b14e4-70ae-48db-68d2-08ddebf4143f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlgySUtzZE15VnBPcDZDK2R5TlVQVTE3cW1RcVhuNVBhbCthckpMUjJiblZo?=
 =?utf-8?B?MW5uVGR4SzJYdjV2QTM3aENiSnVTeVBHVXRVRUpCTWVMRVVvd24yMSttM3Y1?=
 =?utf-8?B?b2lIY3c0YzRGZzBDTUJCcloyamVORk5IWWdmRDJIcjM4WFdxOVJJVWhUZkF5?=
 =?utf-8?B?S3cwelkzMW5pSkFvVVlaV1FWZ21DM2pnODlIWUs1Unljb3JYS0NzbWVsYUw0?=
 =?utf-8?B?VXMzYng3Mm5yOWN4WHpWbjNieHhqWDVTckM4QTJ0cHJtMGdKZXRrWmVFSWRy?=
 =?utf-8?B?SFdFT2F4c0FGZGFNcEJ5NVMwYjg5WExra0NoaHBmZ0EwMG9ld0VGRlV4UXli?=
 =?utf-8?B?QUdFV1ZoeWdnSmNHRWN1R0E5WkpJL29oK3JBMHZGbGhxQXlFVC9Fc2ZzR3lq?=
 =?utf-8?B?WjhQSGZ0bmhGc0poalV1UURTVDc0eVhoTlc5MHVCb3VJaDRFbytUME9JMUhE?=
 =?utf-8?B?cGR6QXJtWUVLRHRuQTRVY0NOYWRtY3p6RGlueGgzYkJodU5HZ05OalJ0U3d3?=
 =?utf-8?B?VEpKUWdVL01vK3NjYTBEUU1kMWhwL2hYWW1yNFViemVadUFCS0hnZWh5UGk1?=
 =?utf-8?B?dFFWNG9Rd0d1T2pmWTI0ekprRDFXUVRrdWtXL2tOTkhhRnhmQnFrWUV5Rk9w?=
 =?utf-8?B?M0x0MmV6bUt6NlM2Qm45aHd1dUIwNWlOZzIwTTBVMDZCUkVFb3hvdzJKeDZw?=
 =?utf-8?B?eG5QTVA2K0VqVUI3RGdMMnA4VWxRUnpuSDYxV2lqeTgreXFaWWRldXZUL2pS?=
 =?utf-8?B?MXhlMXlpeEprdmRSSWlENUp6cFhmanF4WlFtVVR1WE8vYzJSZDlqRjIxTDEy?=
 =?utf-8?B?MnVscjJUanhiZnZVMS8zYXJHQVlTMGY0OEZQd2k5NWNlQVAwZ1puSFJRODht?=
 =?utf-8?B?Z0hxb1EyNDBqWnVHaGJCbTNQUmM2eGdEL2pUZzUrVHJzUXhlOW8xcUsyT0Rq?=
 =?utf-8?B?UkJtdExWT3pNd0dGdmlZQXlTckhEOVBTalhQWjBpRlhxOFBqTUUrV25vVVJn?=
 =?utf-8?B?ODFWNVlhSkJPaU8wNG5HNXlOaFJhbGZzN2tzMk5XcnlxdVJtRkc1REgxcVlW?=
 =?utf-8?B?U2xrUHRwUjR0OS9RZUNZUlhxdzUzS3U3VkI3L0dNdit1OW1hZTh5MDl2bUVK?=
 =?utf-8?B?SVlmZTRka1VxY0s2WmVTaVdDZXVRRXRueFdwVFhWL2NBa1NDNElOOWdoS1VC?=
 =?utf-8?B?andFNlgvbUlNVi80dE9sZWFsOVkvNlBKNXBjMk40MDFab1VqWVFVWmhOZ0pS?=
 =?utf-8?B?bXc0MVprKzZGYnpwR28xODVxck5QMko1ODRZK202U3hGK2R6MUtZemFkbHhw?=
 =?utf-8?B?T0FCdUZrNjl3Z1N3M2Y4Y2NrRkNYMTg5aUNKbW9NcWY5VnhOZlJkYzczZmZo?=
 =?utf-8?B?TTdhQWhpZ3RBbDJFQXVqbFJxVThnVkplS1o5b3U3VFNNRnJzTVVZejIxUG1m?=
 =?utf-8?B?QVU0Y1JIMXk3K01IM1ZNa0lpeW5lM2x4UUFLd3F3OWk3VGUzcHd4OVRsMEcx?=
 =?utf-8?B?Uk8ySHBjYUVmQXNYbWJsTFBxcGYrL21oMzY3NmxtdzBjSG1saDFDNm9tZ1o5?=
 =?utf-8?B?OUtXZmNndEtldkJQbHljQjdRaXBNNmxoUjBsbDRzMCtoLzlRRm9lRk1UMmpQ?=
 =?utf-8?B?UEFhaUxPbFladkNpSms5ZWZzM25WQldMZ3VId1UwZ1NmRjR4cmtsTE1uSWtY?=
 =?utf-8?B?WmR3VDJlWjB0TnJiaUc5UTg1S2YvL1pNOGpNZnI3WW9NanBXYjRCUmFxQjU4?=
 =?utf-8?B?dlBwUGZ4bnNQWUpzWFZuVTRnZFZFSnArUEhpMHl4aXZxWFFPNUovejZIMDRP?=
 =?utf-8?B?TlZLbFdnOFBoODh3MjlBUkNFTmVEcDNVRk9EekRkVkVnNnhrVGlWaUs2R3d1?=
 =?utf-8?B?c1pUY2NnSTV5VUtya2tuRmhEOWdxUGFBc0lWZXRFODIxREpyQWFKMVdyY3JZ?=
 =?utf-8?Q?Zr4/UnYmfZ8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHh3SFhJcVN0NGZac0RMSzZnb3BqS1RJYkR3bDdBSytGemhvSGNJTGVCZmNr?=
 =?utf-8?B?Skp5VG9meVlLQlQ4Y1JGUGVaQ1pCMkk4T29lL3cybVFZYnpFeHNMR3NDMnE4?=
 =?utf-8?B?MEVYNnN4ai91Y05CdFQ1dDlZNC9KNXMzZU1oN1plN21yeWs1YS82UW01Z0ZP?=
 =?utf-8?B?Tm5POG1rbGJGbVQxSDNNWkludEUwcjg3OHFTQnFpRWh3WFVMbmFkNE9WajIx?=
 =?utf-8?B?ZjhNTGtROWJmOHFHc2VYKythQVVGQXlSejA5TnhuL0pDbzUvZ3gwTVVCTnhm?=
 =?utf-8?B?cWRPZmxWQ3pWUklxbjAvdmpiRGJVRkV3TFJEaUFQQjhLaFlrb2F2U003N1lB?=
 =?utf-8?B?WkJpWDBwSEsyNEc0NFhzUjFYN200OWtOTlhTVVpaMXh6R1dGb2VhaUgwNnV5?=
 =?utf-8?B?Mi9wclB1UWJ6STVZMDFrQ0NFNy91bXp4NVMySTYwaFdPV0NBVFdmSXFjUWlQ?=
 =?utf-8?B?d3AwTUliVXpZUzNZY3I3c29GdG5EU2x2SC8vODZyUVpBSnBRM2dSSnIzL2Z3?=
 =?utf-8?B?SnF0MVRpU0JUdjlPckJyZlhwbVFYSnl5WGJhQ3pxSGFlcnBLT0JHSUhMdUlu?=
 =?utf-8?B?NEtDYlh5U280YTdKUDF0YVg2Z1pOQlJtWGJIcFpmY2p0TS9XWkRDRlp6d25Q?=
 =?utf-8?B?QWhNbEgyOXY0RlJ2Wmt3Vm9rT255U3FuVjZOUDIxRkNMMWJRNGxOVStlRG9j?=
 =?utf-8?B?NXFuVjR2eVVrVllSNkRESEVFRHE3WUwvbHZ0czVGUW4zaFQyaGkvNWZQNVFO?=
 =?utf-8?B?NGxiZmpaYnFCTm1tUkVoRkZhaUY1TjJ0aWw4MmVlMmhaVDJNRHNiUFhHWDFp?=
 =?utf-8?B?bmRqV1Bycm8yOFVLNGgzWjRUMktHM1ZXenRzb3J3eHRDZmIwcUVtZnRxOEZG?=
 =?utf-8?B?MVdFd2tiVDhDUlRPcFRONVAvMzhUd28wS0NaelR6WTJodCswbytEZStIR3c2?=
 =?utf-8?B?emNrTkNUVk0zbzJaT2o0bEFUaTBSSkZ1cjV3WXc4dThWSnBnNEdVL3F4SVhv?=
 =?utf-8?B?N0xHRlU4ZWVkMk03L3VnV05SRUF6Q1dsVEpXaE8xMzdDVUxtTFJSVzV1QXFK?=
 =?utf-8?B?S2lpeVJqdDNId1JlTVBadEJpN0FseldrbVgxY1lWeXRWZCtsMnV1OGUxaFJi?=
 =?utf-8?B?ZUxsT3h0Tm9VdDNpaW5uM3VPcW5HNFFLRnFXV1IxQmVJUDFyR2NCS3gxZVlh?=
 =?utf-8?B?QWtJT1lPVm85ZHJTNktFejBtWFBEMmNuT1JqbnVUbWQ3bkNjdEJBWFpodkVF?=
 =?utf-8?B?S2JBZ3NuVTU2QnpKc1ZNMTNJbnhDZy9pMHp4bGJaZlZQUFhxYTl5ZFJOd3Ev?=
 =?utf-8?B?MGVDbHBMeURiaUZtOWdMREVJSmlEWElRbS8rN2VzNjhPN01TeDJHdFU1cE1D?=
 =?utf-8?B?cGcwOVJIRkRTbXpPU1dnSnhvUVl5KzkraitOQms1RzN5YUpNRDBqUFV2cUkv?=
 =?utf-8?B?b2J1NW9Kc242Qis5Z1VTNE1UaVY5UHZzWDh5REMvWVlWVlBkK29iVTdNSFQy?=
 =?utf-8?B?bHZTS29GemgzYXJBeEYrWEkrdnFtVkJTcE5Md3I2RjFPOXRoL1prNzJlaEhq?=
 =?utf-8?B?YXdObERDM2xtcUhpOGZ0N2lZaVZNYlgrY0dXQVhsU1lkWXd4Z1Q3SmVNWlA4?=
 =?utf-8?B?ajZvWnBlM1BmY3BQU1M1OHZWS3hrN0F0Z3p6dXZkd0dnd1FYMGc5U0kycUdm?=
 =?utf-8?B?ZGZ1UEVDb25HL04wUFJydEtVK1lUUkhJNElVWDBNdlpEeE9FRVJtYnd6dTd4?=
 =?utf-8?B?dG9sSGpDREVBeVg0UkMwank0WlpFOG5mQ2JVWDh1eGYvWC8rWnZjMWFMQ1BM?=
 =?utf-8?B?NVBXVkpERnlxT0FlWFd0T1lOTTdhZC9UenMzK09uZk0zUWxKbFFCQzB5aG0w?=
 =?utf-8?B?a2lWNmw3Wk9wSEhzTmJORWtzSHEwT24yVDZESVkzNGNidjJHQ1F6Zm8xQnhX?=
 =?utf-8?B?MWsxdDY4K3FrSmNiNUxVclowMlFCNHdoWnJhTmtFV2RYRXgrVlUwZlV4OWpm?=
 =?utf-8?B?MTBiVE41S2tLd2NuNmx1OEN0dE5QdUR6R2c5UUtWYjFjUTExdXlYL21jakhz?=
 =?utf-8?B?dXJBVERLZ25DcWk0TFA2aS94NERHaTcyOGxlRElFYW84VWxSemlOV0pRdy9t?=
 =?utf-8?B?OEJ2cnV5R0pVVG5laTdWWUlnYUY3WDZhRFhsQ0xKVHVBdFp5MFJ0MTJ1RzRq?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9b14e4-70ae-48db-68d2-08ddebf4143f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 20:46:10.1698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oicLoOvwvziMKnz08a0cVsErT92odQWS5Z5ISW+IU6QSgF1T30BdB/iijD7Q0QWqphn7bIluYvN0OSrolsLuSmY3GBLMQPtHbwXiJ158dG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE26A71A1E
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

On 8/18/2025 4:46 PM, Daniele Ceraolo Spurio wrote:
> This will allow us to simulate this function returning an error like
> we do for other functions called in the exec_queue_create path.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pxp.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 3d62008c99f1..bdbdbbf6a678 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -688,6 +688,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   
>   	return ret;
>   }
> +ALLOW_ERROR_INJECTION(xe_pxp_exec_queue_add, ERRNO);
>   
>   static void __pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q, bool lock)
>   {

