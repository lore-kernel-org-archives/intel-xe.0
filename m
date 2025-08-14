Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D530FCA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 21:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7263710E120;
	Thu, 14 Aug 2025 21:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQ2Vq4tj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E5210E120
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 21:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755206910; x=1786742910;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IU/UxkAWTkzqmgoq2ATsHqvERgTHqS2zcjZS9jripq0=;
 b=OQ2Vq4tjo7lOWjJRdwZEUp4VmbCMbw9frq2u1DSaV3aPQCLMaxDAylM8
 WlobO1PWyjcqlTOwv3X35+4JZMJ+Oakv6coXTtaJNXU9yb8kmy24FEDAB
 hnaz5sZoF/veJyYrjJd79ITKkDLmZ1qONRUNkC4BpL2NPXGWFc8CyN4Bm
 LfQ6PeLBgA9f00WNKrpcoeKkvWZN8LlUqIzvZ1IOVMMHvAnBeA/MYyde5
 1xFZSfOJoY9T5T7LaKEz1J7lKb7k/BlvwpVIEbPIsM/PwW4ClrSyPcYpz
 bKZfwIzPb9Wkoh/OCqbqEpHyVDJ1yHBHjzpbBDrlz8Q1bVWZPiiNzYqur Q==;
X-CSE-ConnectionGUID: j7EsSIb7Rvyo/l8cBPqEnA==
X-CSE-MsgGUID: pdk2Hp2rQWyvcW0JylPmnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="56559316"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="56559316"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 14:28:30 -0700
X-CSE-ConnectionGUID: 5XptdK2KTae7iWR08cZ+0Q==
X-CSE-MsgGUID: u4xrHtYjS0WZuApXzgM4xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166357445"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 14:28:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 14:28:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 14:28:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 14:28:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Obk2TRCFtCKKiSOruQVRD2+98D9u95pLE4XF2Vo+A+hcegt2vvHaifa0K+QZ+Njx3UW4XwWkEgKLW00oAYcHhKTNa2c3k4tsBhDoDlLohI8dkVNIrJnUJfOOWd3oSi17TsgKW/6z4R3vzrtOrch++rQve4pljOYpdv01Qk06H9yj8cuZDFHaohs4BT9m7T5mJV1J3QtFOveU9O14bJE+/2nblb9drCrRAUW/ni5fKQblQJtZt/qCf+eB2WkL4JzJbG7oh0fDz9nPtCCW6GKVgiTWJlZj9P6/OnVR4X+LTPvTh9EdBobbiwNPntv68Z6JMpPo5m4ehJrUU+8OUPRqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vA1BcgB2ne72Y5VpTmCNFOA83llkTnSxNswXAZt1M2k=;
 b=GDkk7zrOwi5CY2on+1bHNwOxpiOgpeMYz51+KhR0dejSJuYa5CVhnujAIBO6ZTbclingVRDvOEkQgbVtB7xQw374MDREUVi1Dw3XoKI/lE38AvvyP4+8bng5jnYxFJtlvJLMx31whWc4Jc9vePEC2A647jekS55k+Zw13kS8ubmGlhUH8jBxkICXiGBffyJCHjRg71f4YNp/lJVYVRh+VW4KbDArHNeia+CEZfIY3keQIZsOIpakGS14+d7QhHDVFKZ9zJN6QIgFB/pDZzVo3L9B3iKbJRp7UAYIxFvD6tdss0QeJmO135XHeb8at/zoLfT6gxf4IZM2eOQV3Gu66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS7PR11MB6174.namprd11.prod.outlook.com (2603:10b6:8:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Thu, 14 Aug
 2025 21:28:27 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 21:28:27 +0000
Message-ID: <7366b68e-9846-408a-a064-839e9c2128a5@intel.com>
Date: Thu, 14 Aug 2025 14:28:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] drm/xe/rtp: Add match for psmi
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-3-a111e9f1e4b7@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250808-psmi-v3-3-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS7PR11MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a16c188-29ed-42b6-ef4f-08dddb7981a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clRHdHVMZ2NsSE1VZllOd1FtSFlWT1hsRE5MVmxwQXdpT0NyS1lhbjVjZlN4?=
 =?utf-8?B?Y0dVd1F6VUgyVVNKZ1FsclMyRWhnYmZiM3lmZmxNOFJwS3RRR09sMlhMdk1o?=
 =?utf-8?B?OWVHWTB1VHBMejMyVDdLYnh4STlrbEFNRlByUGxuVFk2a1dHajkyWkVyOUdy?=
 =?utf-8?B?ekxVOU5UbVVUWEw2aEhselhQRGdKd0cyaXN4eVFYbnE1SlpWaGtzaE9xOE0v?=
 =?utf-8?B?QzZlTm1vM2JJeXBoSTBlQzR4Nlo5L0tFNXBxQVk3QUdDVHcwNHhOSHRDdGRm?=
 =?utf-8?B?Z1BHTkNKSDFJeEF3TlBpU3lQZmY5aUdvSHd6emJ6SW81N3ZHZzJuMlNZSjVE?=
 =?utf-8?B?MnVGbGkyTFgrN3RCeG5VcWtPdXB2cFlCell4ZnhZbEdZZk9WdTA5RnAxYW15?=
 =?utf-8?B?RG9LNEFReWxFaVJVMzZQKzZNaHhsNXJGR2dkWnd5SFBsTEs4bjdYZjl3SE9K?=
 =?utf-8?B?ZmhLVTgxSzZFeU9YVW1sWVMreFFNMXByT0diNVNCKzd0am5vdjFhL1MvWllE?=
 =?utf-8?B?aDlUeGVvT1JBd0xadXRhR1lVN0xwalRoYlZQVmNFamFXMHJ2RjZsKzlEbU13?=
 =?utf-8?B?NW8rTjFZUEk5b0N3dnRFeWNkUjhuY0NkWE1mb0k0LzZ4TWJRWHpEWHQ4N0x0?=
 =?utf-8?B?TWE3Mzl0Z0NYM0NKQ0xzVWxYMEJTbktLOHQ2RFB3dHI5WUhMYkRBMVZjd1ZP?=
 =?utf-8?B?Zi9EdFdxWXFtRVdBTFBXVEU3T0NFQmJ5Mmx1cXlzbFQ0SC9PN2JHenE2VmpU?=
 =?utf-8?B?S1dGNEZXZjFyMGl0R3RlSDFlOVBrM1ArSW5mNFo3blFPVlFwZ3JJVEk3a2xi?=
 =?utf-8?B?eEgvVHVNZzIrMFA3WnJMOUorQXFmR2hjMmFUakpVZzRtOGZsUlJMRjliZXo5?=
 =?utf-8?B?c2lBeDQ0ZVJiNWxxeW1IYkhjQWQzMnkrNUdIV3Z5SnpFVUZacWl3MHhqNkRt?=
 =?utf-8?B?Tk1hektmUzB5NjR3UGpNN3NoUFFpeXNla21iMVFYK0wyd2c4QnhhS3BVcWtU?=
 =?utf-8?B?RXhQcWZEM0Ewcm9TeVQ1eVRpNExVckttV0VJdmo1d1BMMHM4cTdBNzNNdFdK?=
 =?utf-8?B?WWYyUmw2RW1KQk1yM09QSmkvb3d6dlFrVS9NZEpYTTlZNktoa1lhaU8yZVZs?=
 =?utf-8?B?MURQNkpSM0VlWnl2MzYvSm5nemF2b1VrS3lqL1hiNWxKOTlWZzc5Q1FOTXps?=
 =?utf-8?B?VS81Z0xoamhTU1NHUGRhSi9hcmJYbzVkZ1Z0QlpnZTRUc3ZSSjdSSXZSRzA5?=
 =?utf-8?B?d3pLazdoMVBxUHV6N0JoV3VGQjNGVUVJL0hZRmNCSWFLbFJudGVDeTFqYzla?=
 =?utf-8?B?VzR1TFRoY1BoL2FTQ05UdHZJbk9SS0RCWDdEVTkvTFF3QzU0a3ZHODM2VnU5?=
 =?utf-8?B?ajZ5YVhCRTdwd2JhV0lOazlycU5HRWRXYUlxUGNBbTh0N0gvS0NqRFQ1SThR?=
 =?utf-8?B?VlZqNExnN2E3S2xjcm5uUktLNWNGM2s5azlvTlc1MFFiSlNTenY2QnNxbmc0?=
 =?utf-8?B?MXRhZHR5RmhyNUgrMDVmM2NBTGd2ckt1cHhTZW9Bb1pjZndVcXg3Q0ZQaVpj?=
 =?utf-8?B?b3pyb0pUNGVIS2pha1hvR3pncGFlQXhGSkRweUNwMU5oTHVDR1M4UkFpRW51?=
 =?utf-8?B?cDBRdlp3U1R6QkE2Y1RFSmNZR2hqUE1kSUhkdUpxd1Zvb05JcE5DY1pHS3o2?=
 =?utf-8?B?c2xyZnFkSFUwdTBYQU1uZFJoL0xCR21NZy9jRmJIZW5hV2Q0VEdPSFkxQWNQ?=
 =?utf-8?B?eE0rd2dISi9XTlBPUm5jT0gra2NYV3JhWFFaZmM4N1QxTFJGUWJtTHh3RWgr?=
 =?utf-8?B?bkhMT3I3Qnp0WTlBZ0YvaXl4WTV4eEVVSWtqVW5OWUlpMUxrRXl3bzNnY3p0?=
 =?utf-8?B?SjNoeTgyc3NzclNYZWlxVk5pZCt0UHNDSGdJUzVNWW1vUEM1TU9odURSQ2hC?=
 =?utf-8?Q?3chYqxFwFA0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXAvcmNaOWJrY3Q2MXA4TmYwWnpWOHExUTVHNHJqU2FzeHVrMTYvcERNdFZ3?=
 =?utf-8?B?OUJ6bnBkRVExMUM4c0pTSUFYc1NHYjlqalJPVWZUZ1UzNUR2MTB1VjBpSEpV?=
 =?utf-8?B?MlJCNnovYzl5K1VtYk5pczVaUGdsSVpSWnpkVFZlbjVLUVJvUXZITmU2UXdi?=
 =?utf-8?B?U0prQ2R1d3gxS1FNTkVtNFR6dXd5MVVKS0Y4M0V6NlFMZkxjUGNqUFdPNExE?=
 =?utf-8?B?YTdTcDh5Nk1qdlpqZXFxOVNxc1lMSEdpQVhwdmR4dVlVYlJFOW51Zkh5U1p0?=
 =?utf-8?B?dTZpUEQ1ZFYzWFZwTUxMSjUzV0NFbXZIUkd0bTVIbGs3Z3BPWFVFeVYzck5h?=
 =?utf-8?B?ZVRhQXJMZmYrR0UzMWUwMzRYK29JdTljanVUajJtZEpLb2hZV3h0WjBpUlRH?=
 =?utf-8?B?VXR1ZXdTK1lmM0t6UThWS2VzRFplc01LWGhuVjYvQUlkMnFEMER6R2o1dzZF?=
 =?utf-8?B?SldHdUludUcwWlMxdGZ4NkRLWVpNR0d5TkhGZ2tSMjdKc2F6QmdGKzNJZmJ4?=
 =?utf-8?B?UmZZemNRQVBQdjF0bTBSbGZqT21tb0hLNGtvWWZET1gyVklxa0UxaFFOK2I3?=
 =?utf-8?B?UzN1VVlGTXFaZDhwN2NhNkliQVMxWVl1eFp5WmpkNXNvcTRNWGhxcWVKL2pE?=
 =?utf-8?B?L2pCQTJub3I4MTVLQ3dNWHRZcWNPTUZkNmxKeCtMZGFLWExLSlJyZHZvWmZ4?=
 =?utf-8?B?WmdHSVVXMkxpVUFCRXFtbFd1MHdQbkdFR1psWmRmS2FZclJhZi9LL1Fyc2lQ?=
 =?utf-8?B?ZXZGZWRmL2t5VTgreUF6WDdoRW1pUldjNEEyNmxrM0JkRXliemdCdkRyV2NT?=
 =?utf-8?B?dG1qdUJDNGpnRlFlWFBYaTk2VFJDVWJDcUdGMHFTN2RIRUNaaFdYL3oyVTUr?=
 =?utf-8?B?VnhtSkJON0dOWEVrY0grUWMxVWpRTTNnakxHTktjNC8zckdFUERaS2EvVjlx?=
 =?utf-8?B?L2JocUlGU3RnajUwcjNtc1NLbGdwVGRvbDYrLzh5SGZBVDRjYW9pWldyRi84?=
 =?utf-8?B?eU1MejlQaHh3RXRhdHlML0tGZExPbFFNNFNzeFFLYXVVRkxDSWFzSW5wQkF5?=
 =?utf-8?B?QTBjeEg2SlpSdmVuQ2JzM0lDMnUySjcwdm5xZ0xzdE5HejA1UlkvV3YrM0hN?=
 =?utf-8?B?bitlZkJ0TVlwZFFua25DTVluRDVkR295bGpoSWZ4Rmd1WTVaL09NREQ3Nlhn?=
 =?utf-8?B?VEZGbUU1VmVjcmNUb0dpNzVwL3d0ZlQwbnJrUHUzdjZZc1NXcjNvSXdKR3lH?=
 =?utf-8?B?ejdqdFc2WlFVcUZjN2RtWlljZW5qZXV4V0x1MUplTG9lVzh3MEZTanF1Vm9x?=
 =?utf-8?B?RzhYNkQ0K2JkNW00VHE4dTkwc2tyczRDRXV4cDlWeHIrOVhrZm1pcjFIYmdJ?=
 =?utf-8?B?ZjBNWi9JZFNHZGpISjZ4VEZxRndpNGo3VW5LUDl6dFhpYm1PMnBFOVFRNm9l?=
 =?utf-8?B?T0NsclcyeTBWRXNiQVJRREttU0tMQ1EzWFM5TkNrWVNRZW9LMTFyWFJBck5Z?=
 =?utf-8?B?Q3VIaWJOUUs0RExxb0FIdFI4S3BoaHBweUFBbzdjRXNmb1JZTlVnOFA0RUZU?=
 =?utf-8?B?OFF4Z0ZUd2h2MlZRWTJpbjhXcDE2L2p2YVV2VjRZUEhOWHpRNXZCZ2FscnRm?=
 =?utf-8?B?NVdKUXZidWMxK3l4U0tGQkVHT01iVjhWS1hKSEgvamlKYnBvUFhyNGpQbXh0?=
 =?utf-8?B?ZWdEQ3lFYXBLeHp4VFJ1dFVaektWejRPOVNrR3dLMm1CdHlHRW1EL3N0UzZJ?=
 =?utf-8?B?cG9ad0dsNHdzcE9yOXFhYVZWdkxrQXlhL0xPSmh1NkRGbDM4Z2tpc3JCUDFt?=
 =?utf-8?B?RExqVmJmYzh6ZmNMTW5Od3IrR0pGSVlMa3RKdkE0Qkt4VU5aVzVaTmJQSlNL?=
 =?utf-8?B?dWRrRE9QL1RwbjFYUzBqQnpQNDdmV3FaMFc2TTBkeXZTUWwxWGZOajkvT2Zx?=
 =?utf-8?B?SjlvcEliVmppZkJ0ditWMlRrMnVnNFhvc25yU1Z0cjVkUFNkdVFMb0IvZTVn?=
 =?utf-8?B?bHBuVkRza0RFak9zV3hFMnoxTVQ0RkFjemhFWW11aTNRc3JTank0ZVBkRVlK?=
 =?utf-8?B?RngzWnZ1aWVDVE1QNWRvSW9Sa244WXhRWjhZOHU4RW1oWFZOWmtOM1RoSGpN?=
 =?utf-8?B?RmpTeEdVckZHdGNzdXkrM0VYV1JsSWtyUDcvN1IxSExxOWtaT2hnam9NNTBF?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a16c188-29ed-42b6-ef4f-08dddb7981a1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 21:28:27.2082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1nIQ73fxrtliIh/T90BBCoZEk3epNkzv0MTRHciOEYSKA7UpLYB58qvtEZkCH6SNMCM3uu6O/YIh5lVKeVeiN76iJ43TShvVR4MLOygYoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6174
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


On 8/8/2025 10:29 AM, Lucas De Marchi wrote:
> Add match to be used on WAs for only enabling workarounds if psmi is
> intended to be used.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_rtp.c | 7 +++++++
>   drivers/gpu/drm/xe/xe_rtp.h | 3 +++
>   2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 95571b87aa73c..47ea1521dc80c 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -9,6 +9,7 @@
>   
>   #include <uapi/drm/xe_drm.h>
>   
> +#include "xe_configfs.h"
>   #include "xe_gt.h"
>   #include "xe_gt_topology.h"
>   #include "xe_macros.h"
> @@ -363,3 +364,9 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
>   {
>   	return !IS_SRIOV_VF(gt_to_xe(gt));
>   }
> +
> +bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> +			       const struct xe_hw_engine *hwe)
> +{
> +	return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.dev));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 5ed6c14b9ae34..7951fefdbe044 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -477,4 +477,7 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>   bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
>   			       const struct xe_hw_engine *hwe);
>   
> +bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
> +			       const struct xe_hw_engine *hwe);
> +
>   #endif
>
