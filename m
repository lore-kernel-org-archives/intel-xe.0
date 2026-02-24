Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD29F4BB6D
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 18:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822BB10E605;
	Tue, 24 Feb 2026 18:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asIe9RZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC910E605
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 18:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771956455; x=1803492455;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sWiaWLFk2JuaAIIk7qJDlwTDwAFrebKeg8GzUDY4JIA=;
 b=asIe9RZMMHFlLg8VQhdWVtXHonf6628i37DPhqSQzpw28dPdupAQ6vcB
 YQ/vow2SlS3f9/yyJOx0Ru6hMl02Q9EQEh9vA8VeSXgg5Am9Y9/rgIMIe
 z7Ms0q/7SqWiyb3TXOrz3Pkt5a8Dm0crrU5uHqq9bp314WQvWE5tfpg5X
 yuxIsZbHel3h3/YB/Qm90RcBXlyTEilaWYUWiRScrF9bAnCRzZkQNn/Yn
 xJqLvOdmE96nGAHdQ0rzCnqzOEC8gXS7slffy/DU/RtnobM0L6HxNchIN
 a6H5gDT9EVXjyfctQLY3xnSqe1izD2jx3znJpP+tSrO8YQMJMlfpT8e6V w==;
X-CSE-ConnectionGUID: Qsk/Xf5fT7mYm3kDdffVTA==
X-CSE-MsgGUID: gLbfIowfSaCOMxM4YscF4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84077070"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="84077070"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:07:35 -0800
X-CSE-ConnectionGUID: lIboBTERSmWYNhYUjrIv6g==
X-CSE-MsgGUID: mvYKsPPuQRCZWioWjp5rQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215986214"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 10:07:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 10:07:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 10:07:33 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 10:07:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cauq0d+hrFP32nV5QSUo8aSUkJx9eUPR0mHgK1WTi8UB0jqZkw5e8X4U03NhEd72T0fq2Pz9FPyU73OXH9RC8h82Vy+SvuRmyaNoYZNR1Y6TdK4uGX9t2+yUTa1Df1Qw2Uw2u0lFqsHL6egTwJfODNEokscvhUw+svlLkAy6htKAbGy0IinYEiU+Kkr1xmhurFJZm7DFJxU5bw+2YYD3WPqUbHrNAv1NOhkP5XWn4b9QE+yfBWG9ZUwK7JXHH7ttapfTq5LGxmIJdWmcZOlLzav23tRQhjXu5k0j3Y/sP/5yhKWR5w2bxebcw7Xe5SsUEv5GunTGkPXNUpCJIiGUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37Ccc2FvqOVQR5yeIuSnzxWhZS5LGeHTuROO4ETfk+c=;
 b=QqFlP5j3IkIxrAgOubU981gdzxZdXfnkPdhZ+ij5niclu9vfsCP0A4Xszg7W75/w1iyf7W32FhLHp4lbb4k0QJ4bRD4m9WQ2c1vmqv5O6MT5nld2irn+FWwHe+Z44FAfIutcVL8aqAcyzvSDMDN8iAVnb5beC/ESKDAmXjWV45qVPdPfRncypmQE9PpYg9D1h5Lk7UxrHswxPGxttABCyhrIU0fKiuKoAfDij4JduerXoZOfN2ssW8BYw7uyjnKcTAWfnwVBhpfWT4Z1WRnHShK0FhqQKhiLjd+s0McuGnlRz+LNCoB3IUzskw5xBgdgAXLTs8kxgxqVdZgZ6RGfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7712.namprd11.prod.outlook.com (2603:10b6:510:290::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Tue, 24 Feb
 2026 18:07:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 18:07:31 +0000
Date: Tue, 24 Feb 2026 10:07:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v6 2/3] Reapply "drm/xe/xe2: Enable Indirect Ring State
 support for Xe2"
Message-ID: <aZ3o4KbEvRgATkaP@lstrano-desk.jf.intel.com>
References: <20260220170137.328131-5-julia.filipchuk@intel.com>
 <20260220170137.328131-7-julia.filipchuk@intel.com>
 <aZiVvPmGtxxOi4JF@lstrano-desk.jf.intel.com>
 <3114cb01-228a-4016-8e45-146202aa7828@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3114cb01-228a-4016-8e45-146202aa7828@intel.com>
X-ClientProxiedBy: MW4PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:303:b9::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f67b11-f9cc-4752-a993-08de73cf941f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3VUTWV5MjdyUFM2bmEwTUFiOC9pM3cyRVVTMnErUFg5L0FVOSt5ODFZUG5T?=
 =?utf-8?B?a0FPYkM3elhxVWpYZjlWNm9tbWZGVC8wY1dzU0x3NjBBQkdSeWkvYzBPcTJj?=
 =?utf-8?B?L3ZhWWtDREM1b255YXE3a012ZDJmRWFqb205cTJqZ0NnVS9XczdUOXlaWmo0?=
 =?utf-8?B?b3pnTUxGdnl4blZra20xZFA4cTROU2h5cmtPTnJOa2dpRWtXaTFYN05hVjZN?=
 =?utf-8?B?U2FITkZsZTRMS05VcWdMN2RsRE5yYUp4UmpEc2JMbzJYdHdvTkkxOGFZVW1T?=
 =?utf-8?B?SFF1NnRpdUN1cjVhZ2ZFS0t5VnVSR3BpMlJOWHgydXg0bUk5SFNINDIveGFi?=
 =?utf-8?B?UFhGQ25UTkR4QTF0QkY4M1poODBSUXZ4QjBxYUFTb2gyVU41RkxUREQxblRF?=
 =?utf-8?B?WHEyQkEwVE84dFlJdEtDQkVzZEhnekVabUxZY2lpd25zQVp1Y1N1aGc1cDU4?=
 =?utf-8?B?YmNlelk1K2xuVzdxYW1mbWpQOWNFTm1TNmJ2Mi81bzRyUE10YVFQOWJwTFZH?=
 =?utf-8?B?VXIzNDNpenBabXB0ODczOG1kMTBuZGFrY3VLN2lqTlNaR3BRbCs4alFKKzhx?=
 =?utf-8?B?UkNoZDVPWEJqRnEwRjlMeklwcG9jNXlhRG5zUzQ5RUxrTkFkWEVyVkRxL1hB?=
 =?utf-8?B?UjNkazJaVWdHQWlGTllOM3M0amJreEZiYXozdk1WVk9WNVJFdGFoc0FFQzRh?=
 =?utf-8?B?RUhrR0xUd1MwTmg0NjA3Y3grdmhJK2VCRDJxQkN3bUNSRnBtNkxSSGRMUXpY?=
 =?utf-8?B?RG9WRXBYL3dGN1NoMDc3bStlWDZsK280aTdLem1YQXRUUFNBK3VHdDRtMlU1?=
 =?utf-8?B?MDVIc0tPc0FXVnhhOHJPK2hPZTlrQUNzWjZYaEVpTGlGRDJEY0VmNjU3cjR1?=
 =?utf-8?B?WkJ4WFE0NTdPbmh0RVNldDdKdlh5Uys1bVZXcDh6cno5U0gybHNieERtOVYx?=
 =?utf-8?B?WURwejVmQ0JNMHVzS2hkVE9mcnV6VDh0Ly85Rkh3U3RvY2FyT1NnOGRQeHRs?=
 =?utf-8?B?dVpKazA4bmJRVUxrVkZCZXFjTWYvdWtDZ2lRdnhrZEUzenV4K2hteCtwaUtl?=
 =?utf-8?B?Tlh6cGtOQ1RJenJpKzlmTGpxQkFNb05rMFJiZVppd0drOFVlc2NiVmFldDFS?=
 =?utf-8?B?dVJPYTJHV1pKaXNXdTZhMHpZVHB1YUs4b2lrdlF4YVZjMmtmb0s0NklZZzFm?=
 =?utf-8?B?WWhLKzhjVElXU3hzMm9PaVUwT1JxYTF4MVdvLzV3SE4vZExYVXppTi9qdUFq?=
 =?utf-8?B?UVlOWms4VWZldXJWUU9wdW8xS0NSZlJLSXl0cTdIV3dPNk1hTE80a1FENEhr?=
 =?utf-8?B?WHQvRU15eTdYcGhzWTdrQllyWlNxbUNaLzRjdHoxdllUT28weW85eFZpZWVs?=
 =?utf-8?B?YnJjSktCRVdnQmhXaitzZTJPS2E1dGY1bk0rMFpwODJMbmtyQzFvYUVtVHlH?=
 =?utf-8?B?eTFwNG5FN0dQUll4MUJNSDR5RTFYYk00ZEJLNElhNUJpVUNWUW5VYWxxWGpi?=
 =?utf-8?B?bzV1RkR4dkIrbk4rSWdLVm11VG1kK3NuMERVQzdPSFRIdzZrWUYyQVdHRjBQ?=
 =?utf-8?B?cmxsTGp5UmRmdGdDTGVkK2xuZVEzOWtZcFdqT0M5MkJwNzZnNG1EOUFKVnRS?=
 =?utf-8?B?eFR4eExPZTFYVU5ENmdnQndDR1dPdElpenYxUmVkZ25VZXZ6akxuc1JOWjNk?=
 =?utf-8?B?TVFvRlhoT2ZWSFY5eks2UWt3d3JuZHRKWE5XRWZySVF3SGUvcFRNK1J5U0Zi?=
 =?utf-8?B?dHpKb3VJNU83S3k5RkNpenpKNGtkZ2g0ZGowZnhmSTNQZEc5bEhTZENFdGpi?=
 =?utf-8?B?WUdHWW5NazVOTC96ZGRsOFlZWGl2bnE2aWZkSVFoR1Z1NzF2dFY1aFpLZzFC?=
 =?utf-8?B?UzNqSXlBQ0ZEeXRwVGhxQjRIUWFydkJJazlLd1JjVlMyRXJGc0cyZ0Y4SXps?=
 =?utf-8?B?Ymh0eHJwWmg3Y3NEWTV6WXZMUy9WSXFlZlNlM2Y5OXZvY0hvQXVQMWdQVk1h?=
 =?utf-8?B?K0Z3dnFLeXFobDRkVjYwREZpUEpxc1JCdDBqTzhvRUVralZpNVgrUDlYelpC?=
 =?utf-8?B?SGUwMHRlNkg5MWp3dEhqemg5Vm85VnZBb0RlK0dvUnBWUVNNUTY0TG80cFdk?=
 =?utf-8?Q?cE7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJjb2ZWZUkwL0w0eHYxQTZwTHMwNnNsTDlLUmt3aXNRT3BrOG55ZWw1MGF6?=
 =?utf-8?B?cUcyOVlXVTRrZWduQ0puQis2QzhhbGpJUnJuZmhwNU43dkVKbnl2TUFTS1NM?=
 =?utf-8?B?cXhGM0JyYlQzdzhDRHpQMi9EOTh0Nk1aU2pyaTUrb0Q4NXVxeFpCY1J3Zlh4?=
 =?utf-8?B?N0U4d3RrOTlzNTNuanNxOXZiajRMeU40K254NDNDZkd2RDUyaE1TWjM4RmRR?=
 =?utf-8?B?UWQ5Y2pYbjMrUUM5bHVWZmFvR3VOYk9OUmx4UXQrYUsrU1lGVGpMT2JYMmo4?=
 =?utf-8?B?b2laZVRKVGM4RGQrYm56d2NIb1F3RXNBZFVyUGtRdXlmZEpSV1VJWkZwdDRu?=
 =?utf-8?B?Rm1UNGE1bzM1d0FlSVhSSFdNSFZMMHBFRDcwbzR4MkRicTVmYkhCYkt0anU0?=
 =?utf-8?B?VFk5SjdCdzEyVHJNN1dvWHpkOVJPV0dybXlBZlpBbW1zMWtTdWw4OUJuNW1F?=
 =?utf-8?B?RWw3d1dYSklFZENwTXJaRGZsaGwrL2YwQnhwaWtBR1pWa05icW5YaW40VjZO?=
 =?utf-8?B?S3lXVndKTUtBK1pwaG1kT2d4RDBsUEZSODJvYmdXc0lLQW11emFMK1g4VjBv?=
 =?utf-8?B?MlFHeFpDVDY5eDRSbVY2cTFYZzYrZnNWaE5UVDZNTTgwcUpSc2IyVjdleFVF?=
 =?utf-8?B?TVBuLzlkK21FNlpEbzIzRW04dU1VaHk2bnkwV0xjNmdxQitTNnE2SVdHNXRY?=
 =?utf-8?B?MThDeUYwME9xNGFUeDVBdXQrVytha3BtVzNsNzlHZjNES2FDc2ZrelhwWlUx?=
 =?utf-8?B?NlJRSWsvb1ZJYXhmQkJVbkcxM3VMT0RYbGlCUXNTOG9pMmMwM21RNDlDNno0?=
 =?utf-8?B?bjNjNlcxb2gxaUFGRmxJTHhXTXc2L05SdStTRmUvUjFpT3VjTUFPbHM5b1ZD?=
 =?utf-8?B?TVNBUXpEdG5LNGVwbmMxUUwraVFvZjdQQ0JrWXh5dGNnZExFb3cxY1lNWEQv?=
 =?utf-8?B?dGhJcGx6dmkrcGFYVUl1UHVhRE9jOWJGQ05WUnNwRzRTOGlKVGVralBrK05n?=
 =?utf-8?B?b3d6U3BuR0d0c3lNTzRCejFRbHcyeW53ZjU0djhBMVJxaUJ2Y1lIdDgrY29Z?=
 =?utf-8?B?NlRZOXVlZlBGOHNIOUg0c0dpak8rZHpvaFArU3lnMEh5eXZVNHR2Sm9ndFps?=
 =?utf-8?B?TVpnMGJncUM3RTY3QjU2eGE1aWFuWHJCYUlneXhQQTQ5UWllREhpYklUMGlL?=
 =?utf-8?B?K2crTDE1Yi9YeXdnbzdMcnd3TkVTQUN0QkpPV09DSzZYOHBESzJBemlSR3BW?=
 =?utf-8?B?RG9lQk10TVFOZXhUS2lvNmRGanY3OEM4VUFXU0x6WGdSdVlUQmxkWjZhWWVp?=
 =?utf-8?B?d2tDZUxnNzFVTFFaVVRLaXFKTzkxQzYrOS8yamx1bG1zaWVGWUhDL1B0d1Iw?=
 =?utf-8?B?c2VZSnVSY3RVWUZra2RmZ0ppdldrdFJDajhVZHhYY1doRWhwQjNMR3hQQzVz?=
 =?utf-8?B?YXI4V0o2YU53K0djcHE4b2paRDNuRFNlUDJkWnEyR05WS2lkbEdpK0dwUGEv?=
 =?utf-8?B?L25vY3prOVRsWGxsYUtXc0g0Wm4yNVVFSnFLL0p1WEYwSHcvVFAwWjM0dWxV?=
 =?utf-8?B?V284bzBRTFErZzBHM3cvV2FCOU9la0JUUy8rNVpSS0lvblp3RlJ4ZFVCT0Q1?=
 =?utf-8?B?Z3NnT0lEK3lXUjM3UHlvM2RodVlFUzNtMHdQaTBmWTZQSURsOUxJS0gyQ1Zh?=
 =?utf-8?B?VFoyRDNKcGM0QW5aOXNCT21ycWU2NDcrWVQrMEE0TGQweU40cHA4MHZyakVu?=
 =?utf-8?B?R3ZOUWNwWXBSbTdjaEl6M2pvNCtrQmJLd3ZnMENaL3F0T29MZjN5aWFjeG96?=
 =?utf-8?B?SlZRS1FsZGx3QmtpRXRBeE1lWjQrQlltVy92MzdoOXVCYkkrSXVkMlpyMnAz?=
 =?utf-8?B?VEpNWjdQK0RvSGE0SlJCZU5pdUNFeFVscXRZUVlWeVBacjNIeXFDYWF2TGow?=
 =?utf-8?B?bEJ2cXhObnFOd1c5WGJpUXlhbldWeW5nUGlKTk1JRnNEMGNaaEJYWXluL25O?=
 =?utf-8?B?Znh3U0NyelRLU2VmdVFLdmJqeHlzR0RhMjNyS2FJMnBheGY1Rk5OZHRiLzNk?=
 =?utf-8?B?RHAxODY1UGF1aDRha3M2R2NUUE9vbmw1bmREeE1jV3UxU0l1RThBNVFvUHhu?=
 =?utf-8?B?d3lsZUxtamZOem5sRnpGTnZZdFZHSFVOakRLbG4wclBIOWhHYWx1L3dITysw?=
 =?utf-8?B?OVFRYXk5QkpBTzBha0RDOUQ3VXIvSmdVNEpZUDliVklQam5UVlg2eVVyeFZy?=
 =?utf-8?B?VG8zOVdXV2xIZXdpeThaS3NlOWNUZWlPUjI0K3QzK3kvMGM5UXoxbyt1L1I1?=
 =?utf-8?B?bkVETVV6VjlpcGM1TWxmTzdHVyt1NDN6UGVNZE1VTjluL3JTM2M5RUZOY1o1?=
 =?utf-8?Q?X23fO1vyF7rcmn2o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f67b11-f9cc-4752-a993-08de73cf941f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:07:31.5248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5F1bBbYuY59nsnDiY9SFL1QoT0DfsxNpQEJRaqtmNloyClCTvL4PJxewdUAxn/wSDcoMnXKWpzCw2iN4g6GDFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7712
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

On Tue, Feb 24, 2026 at 09:51:46AM -0800, Julia Filipchuk wrote:
> On 2/20/2026 9:11 AM, Matthew Brost wrote:
> > On Fri, Feb 20, 2026 at 09:01:38AM -0800, Julia Filipchuk wrote:
> >> This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.
> >>
> >> Previously this was reverted due to failures on LRC context switch.
> >> Issues should be root-caused and resolved with GuC WA 14025515070. Now
> >> setting indirect ring state is available by default.
> >>
> >> Note: Will be cleared if WA not available due to older GuC version.
> >>
> > 
> > Is there a reason we need indirect ring state on Xe2? AFAIK, this is
> > only needed for multi-Q or if we did user-space submission. I’d rather
> > not have an officially supported kernel floating around on Xe2 with a
> > mis-match of indirect direct ring state enabled, since it’s a very
> > subtle delta that could surface in odd ways.
> > 
> > IMO, it’s best to leave indirect ring state off on Xe2 unless we have a
> > concrete reason to enable it.
> > 
> > Matt
> 
> Thank you for input. Changing to leave off for Xe2 for now.

I think we should merge the WA though so if we want to experiment on Xe2
for features which require indirect ring state (UMD submission) we don't
trip up on the indirect ring state Xe2 bug.

Matt 
