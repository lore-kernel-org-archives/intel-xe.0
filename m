Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82586CA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 00:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411E110E67C;
	Wed, 13 Aug 2025 00:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWKxMxKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE80D10E67C
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 00:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755045504; x=1786581504;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QwowvuhZuqQJvjvLHivykyR6taHhlNFG+NKyQWOateg=;
 b=iWKxMxKEUU0l6cQqL9FBBlWiMTK6H0wenxZhAWXIuFOAlivYIyIih00k
 Zb2s6ujv5tTI3hJTNCNym7cckfsuQcqTOHaQONHFew3/okMbhqwaXVuBn
 Todh0psbHiTulr3GayzBVzo3E6RTjgKKRMdCkgpppfk6Eq4jkxoanx9pD
 Dlj6oyc5fHlLOLOaaYH5snEHhQtb36BjA1ittufUxeSXe61aV5tChWgrp
 y19lX/wQhC+LnTUMy1UVmCH6MdazFj6d7G+MiqBgYUjfDmPa61ckcCE4j
 LR2ooNfv5irOamIVw9zuteRq1Tgv167QjGoqoGvS3uBwExfv5c+ToQ8G9 A==;
X-CSE-ConnectionGUID: 7heiAv2pR9+r+JBhO2nX3Q==
X-CSE-MsgGUID: MDx7aWMETRG931hfqcwxew==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57289664"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57289664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 17:38:24 -0700
X-CSE-ConnectionGUID: 2dRth5Z0RjKyAUhmqVzhEw==
X-CSE-MsgGUID: Tf3oMU4vR6ynlHXjH8VBmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="171666951"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 17:38:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 17:38:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 12 Aug 2025 17:38:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 17:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDojOm4dvXpjigaCxk8hcSiCVH0HPBcV841kz0P5iLnLlDuhl0jXfnOZTRqs+FEZswmxs20zukfyyz28uoupbyg6Shaqc3huW6uiaSyJMAbdvPeAcZ0fFDiAYsv/rVzB8Vyfq7UG1B+7anq289YmaDSBvQ84HQobXluxN2ueDfaTAczPDgm0hY+W8LDW67jvfqoOkOpY8waF9I+m6G9twF+mQ/rhJL5ZrmJ02Mr4Vj59GpeMoOdmWd2Mv/NJWeUecfS1vLsouwYXAeyo3gXdnwxY+YxqlqqfzX/7c4LdyCo5ZIJ6sMzdiBFPbPWhTwBKCmSS1QHJ7tS2HRRpchbtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtUqGHiWjARmyDMxIcfjWqvA8ctS/m7Yi1Q7Not8v4w=;
 b=b67Mniz5c20HQw1ZvR5Pxi/lYvUnEs2vzDPYbTey3YBpUunYPerK7VupOCG+0w7XK90zEi3t1uQItL8vO04rYkdOfe6dVW0bl7kys41zZfHP1SDJJjgg5IcEQ9glUVkU/HYl5HZ5jGkHFhjCiQMuqa1UNp0d0K5q2Nlp6CSMrrtrruWlR7fWu+zY7Ulpt5UODMXSWpMJ+3m9e2p/9r95GC6KK672G42qfWbttQ36T7OXSuIhpAXQKZekdlLHtApEsZNwZZg2PosYNMcaWBJJGDgda2awPhJhxhcAgMOqRsWNUuohm8uQnTG4QkJk8utjZG8O4h7TJxXftLQdrq4vxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA3PR11MB9274.namprd11.prod.outlook.com (2603:10b6:208:578::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 13 Aug
 2025 00:38:20 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 00:38:20 +0000
Message-ID: <1749abbd-5b10-4684-b1fb-c340fe57a215@intel.com>
Date: Tue, 12 Aug 2025 17:38:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] drm/xe/psmi: Add GuC flag to enable PSMI
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <John.C.Harrison@Intel.com>
References: <20250808-psmi-v3-0-a111e9f1e4b7@intel.com>
 <20250808-psmi-v3-1-a111e9f1e4b7@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250808-psmi-v3-1-a111e9f1e4b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA3PR11MB9274:EE_
X-MS-Office365-Filtering-Correlation-Id: d9dc6f36-5e34-443f-ebb1-08ddda01b398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TW5VdFhyNjJHc2c0ZVdpVmNwR0crQy9aYUQ1b2FCaUNhQnY0d3VOMC82eVB3?=
 =?utf-8?B?aDI0eGEvcDUzRUV6WDZab21OT3BZNFAvYTJyQ1k1TXJtdUtNckRERmhsZDZm?=
 =?utf-8?B?UHFLSC9HY1hrRlR1OXB4UFk5ZkxmTGxSV3laT0cxc051cExLd2ExQ1NSTFRM?=
 =?utf-8?B?cDBIUnRXSGRmWlZ3WTZnZGhZUU8xRzZJVTlnNDZ5dWZYZHBDSUc2ZEdrUVNj?=
 =?utf-8?B?N2tFbStmeGIwSngzRFUrcjJqOStvdk9zRDdoZFU0bEsyOWhqT0Z0ME1QS2E0?=
 =?utf-8?B?K2FneWhvV2NMbXNmOTc5dnRKM3NpN0JCdVRJQ0txdU0rTDVyM1IvdCtIeU92?=
 =?utf-8?B?b2hFZWcxYS9sY0FvUnpLVlNuOEdaK3FPSU1xaVpXWlAzb20zZDJoSVp1RjZj?=
 =?utf-8?B?ZXd3SC9MZW82RVNCUFZCTmxGSTlnbStnUU5MYXIrL1hmUzhzZ09ra0VSNUFw?=
 =?utf-8?B?UGc4QUlmaEU3Qmg0ZFVpdzlPdk4za2hQRnpvbHF6WFBTSVkxYW1OdGhMWElN?=
 =?utf-8?B?QTlGampsWWUzOEdmMUNhVTBoMDdYaHVIeUdwNVJBYkJHdHdQendyZ3V5Wkh4?=
 =?utf-8?B?NWJkRURkSkNTc3ZOejZ2TUZBcGZMZm8ySEQ2cnVvcXNpR2lZQ0JDdG9oSHZM?=
 =?utf-8?B?RTBCcTlzSCtqK1dYYjBKRHgvd1gxR25ISENxZENyT0xQUDUxMDhjSGdsSFB6?=
 =?utf-8?B?S2JnWTh4ZGUxWk52QVVubUJ1VTFUcFVCYnFKSUtPeVhZN051cHdrR2Y2eEZW?=
 =?utf-8?B?S29hVXV0Q29ld3VQMExqUFFLM1p4UXcxcFpXU0c2VTFRaXUxaXRWUjdOYmN5?=
 =?utf-8?B?NkVaeXJ1YzZzbGE2dFdhVGhTQjB3bi9LUDZWV25rUFlRdzJhVUlIVmEwbUl0?=
 =?utf-8?B?M2FGamJLelhwNVA0T1ROb0o0dEFLbVRnU1pjMzVUclJrN0t3QkNleG9WZmZX?=
 =?utf-8?B?NmkyaWwySnVsYWpIL3c0Z0l4V2NKUldnYzY2NDNXVkVjRlhQUU9GVExrL2VI?=
 =?utf-8?B?V0NoeUJtam9rdE5zOHRONlRvL3dSSzZaOEJkYVljcVBnM1ZmeFdURjJ0U01R?=
 =?utf-8?B?em02ZEZKRHZqZVJpQ3FlNFloWWlsRi9PQ01Fd3M4VlQ5WjdBZW5MWldhR1RJ?=
 =?utf-8?B?SG1ONUNpQ0E2RUhBcDF6UmJpc0c3aVdBWElBcVRrR2pMWHZxU3p5NTBLc0Y0?=
 =?utf-8?B?R3R6NnBEWVpvVGRWcEFQdmVKY2ExeXRGWWZVMjVDZTNqUWw4MkV5aHFOK3Fk?=
 =?utf-8?B?cFBNVnBQVzdSYUhuUk5taVcxN2QwNFNOTlJPUjhuWHlCYTAxWk9VazQ3MjZh?=
 =?utf-8?B?aFF4N3NMbGs2aFRnOVE4Q05OaEptVlVaSWtjTENFNG9GS1RVSzhqTjVIb1l1?=
 =?utf-8?B?WGJVOEppYmdEMzVUUitDaGlFeHd5L3JYekFRK2lKQnAzN2p2ejA3NHNvNEQy?=
 =?utf-8?B?bmtwdXdTV3RWamxJSWxzNTY1VHJ0bjVOYldnbkFUZ09OSEE3SFIrSHgrMno1?=
 =?utf-8?B?a0VKeFIwcmpIeWh2djZreDNtalJHQVc5Tk5lRmxuM3FLci81Z3lZS3B5YnNl?=
 =?utf-8?B?SjEyQ2VBamNYRU9ZbzFiQXdieXBnWUo1bDJSS3lWbVRwUmV5a1FPMG1mVHhx?=
 =?utf-8?B?M2VKU1kyRzFlZ3ZpeXVCR3dhZHU5Mm1mZmFmalNCQ2FwNGF2ZE5aK1o5M1Vy?=
 =?utf-8?B?aTNmZ00yOVlCd0NuVHZWY2FkREZma1BKQjhsSm1uWGtOb2ZkLzFlTlA5NDc4?=
 =?utf-8?B?UDhVK3I3NW1rUjZMTGFTNGxmQTZWejVxQjB0aTZkTVYyZFJZaER4YXhqQWZQ?=
 =?utf-8?B?ZTVUTVNUQUpTR1Ftc3QxRkpuRFhpbjV4RWNFODdqWll3OXdUM1BzS3l2aDBJ?=
 =?utf-8?B?Zm5nWWl5ZnV5MGJsOTJYMEFGblhreHF6dytGZHdMYjUvOCt3WWZtTXk0TWs5?=
 =?utf-8?Q?DBP4Q2Xf6WU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXg1OUk1UENkQ3NvUVBlZE1CQllmYkVIc2FEcGpmRVJHeUtIdmZHOGlyQ1dr?=
 =?utf-8?B?ZGFlVWhxV0VuWUIwc0pXWmU3a3pRd0RjRUw2WTRuYzJsaXNmUlNBWmNIVk92?=
 =?utf-8?B?akZYR2RjSkw3eVJ5dUZqRjFGSEVVNUJDUnJZOGdkVTlmcUJwc3VFRGpSNUtv?=
 =?utf-8?B?dmZ0dUh0aE5iOHoyb0Rza2lJQ3lpMWJGQ3ptcm8wODRTNk1oVi9wZVVCUk9w?=
 =?utf-8?B?eXJ3RGFwWmJZVndQZEdMQm5MNXZwMU5KWGFKc2NtdGlVaGJMTDBtSktqSkZO?=
 =?utf-8?B?aEo4YUlocE5KMGhPZG1xeklrTituRi80TVFTSnNUcUFtM0hLeTVhbHRqck1z?=
 =?utf-8?B?MkNqdTNQTUpKaTRVdVdXQm9TNGJUSW9JaC9jNWVmaTNOTXZrS0ZvWUNDQkt0?=
 =?utf-8?B?eDEvM1VxOTA2a2d2ZWx0ZGw4MHRob0xUOGZpN2pSNE5pbW5PVFRJQmlwYlVO?=
 =?utf-8?B?S0JieWJTTHVTUWExUWtaSkhyaGVEZUlSSnZjS3JiN1NYcUhJQnJIU0Q5eVgx?=
 =?utf-8?B?SEpHRUtLMWlIWUdGNU9LMVJiOWIybWt5SGRYRHU3WUZzMUZON0laMHJhOHlZ?=
 =?utf-8?B?aUU2YmlTbEpNemZyY0tpYzJsdThwWGpvQ3VSRjdRenBNY2xpeWZyWEZtV1pm?=
 =?utf-8?B?clp4QUJRNk93QTZIOXhoUm51RnNLa0Q5eHpYeFkzR1FCTC9qU0Z1ZjAzWWdn?=
 =?utf-8?B?d3M1c3kwT0xsNHQ3d3NTdnMrYUhLQ0dwNHhtT3Z2RnB2d3dhUTl3ck5WZFRz?=
 =?utf-8?B?VFZaWEVjRlh1Nk83cGtWckIvaStodmtVbmUwWVJXUlVYc3ZaTFgvamlHaTY2?=
 =?utf-8?B?YmVuK2RaTFloYlM3YnJwRC82NGFuOTNmWFo4Tm9iSVpBVEpLRFR0eUVTTlRm?=
 =?utf-8?B?RnF5TXBDWkVMcGQ0YlJZUnUwN1VxdEtkQldVWnBValN5ZDRDN1JRa0haUVV6?=
 =?utf-8?B?UFI0M0pVRlNDOVFsa0JTTFRMbTBYVlUwRDBoRjkvV2JlTmZtQVBpYmtMeERj?=
 =?utf-8?B?WFdKVDMxUCtId1h5Zms2all5QlB4Z1FSeGFWM0JNWUNMbnY3OUJlNGQ1TW01?=
 =?utf-8?B?RzNJOU5BZ1BOUE1iaWQ5bCsxN2FQWUkxYW14aUNwM2JhQlp4ejNWcGNTK2tZ?=
 =?utf-8?B?ZlFVaE81YU5KL2ZvajBYU01GVEFJK1BYeThRKzU0blUyU3Y2Y1M1bjdjb3RE?=
 =?utf-8?B?R2JodDFESmVDQzRneXpBN21oNjBBc1NtVmNVTVdxT0IwUm5zWWxTZjd4bm5S?=
 =?utf-8?B?ZjBuMk5aYUtnWUE2Nzk1c1JGYnZsN0ZpbHl1UDlIOWx3V3NSTlFTenpWMTZ1?=
 =?utf-8?B?RkwrNmVkS1l5NTZJUTZrcGhYdk5kdVBJUUZtQlRFYlNSWFhkTlVtb2Zkbkhy?=
 =?utf-8?B?akUvbC82ZVlyZmlBRmZmeGVsWEw1Y3BObmpZTm9haDVhSzE1RlNYekJ6cWFO?=
 =?utf-8?B?cHI2alJieDhoZllxUnJoQktjWTI2Q0NheG9NdzA0Vy9hQ0RmOTREMXBjSVZL?=
 =?utf-8?B?WFYvV3JWVWp3VzZONE85eFpkRkRNVEloQ3hOVENsY21URU9mbkVNOCtRNkRK?=
 =?utf-8?B?bTJxbzNPVFdVK29xQ2UrQXRjSkl0S3Y2ZytzSTh3WWFINWRFQUtINmR1WEZU?=
 =?utf-8?B?NEF0QXZ4b1hCMGIza0U0aVJvL1N4K21sWjc1QkU3dU1IUkR5RStFZUpJWkd6?=
 =?utf-8?B?eGNoTHNlcnFkT2NtMkptdFFCcmwrWGJhMGwweVhUS3dHS2lOV2dQNzlUb3RD?=
 =?utf-8?B?ZW1nV1IwbWZOQ2w0SnBVUHhXUTBHMngwRUhlTEQ2aU9FeVNuUE9GQSt4UUpZ?=
 =?utf-8?B?Mm9lSlE0WFZXMUxhU0xvWWFvamg0NGM0NlcvYWtrTVVZZSt5cUhScVBoWGlX?=
 =?utf-8?B?TTlWMkhNdGZ4cWR5U1FSUzlobjFBQ3BzeHY2bS9IV3lFK2FvWXhBM3lzMGtn?=
 =?utf-8?B?TDVkZXlSOUwvVEYwakIxN0xHWE1YR0J0dzhDZm1uU1R4TE5XV2NjeHJjcEZv?=
 =?utf-8?B?ZmU3elRwa254ZWhHT0FiYXJ6bzJXekVCSTdLR2tqaktBeE1vZEVPemtoV3dr?=
 =?utf-8?B?Y25FaUt4Z2ZqMzZaMkVZWG5JR3R4UUZUU2JBT3dvdWtDY1B0d3R6bmNTV2c3?=
 =?utf-8?B?RWpKUEs2cHU2cGtFemlrbVdkWHhlaklUVmZLVEhNMVlpbDdoQ1g5MXppbEZt?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dc6f36-5e34-443f-ebb1-08ddda01b398
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 00:38:20.0901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMnSpr+ZOCdBah1COdE/gF+h0eGVp441Be+BfLTrxlxnaB8fxcYAOmSNdn+KHZJJMe2R1gzSiZvR+/Ot5zCKlfKKaK4oepl7KnVPL5WUkBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9274
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
> PSMI allows to capture data from the GPU useful for early
> validation. From the kernel side there isn't much to be done, just a few
> things:
>
> 	1) Toggle the feature support in GuC
> 	2) Enable some additional WAs
> 	3) Allocate buffers
>
> Here is the first step, with the next ones to follow. For now everything
> is disabled through a check in configfs that is currently hardcoded to
> disabled.
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_configfs.h | 2 ++
>   drivers/gpu/drm/xe/xe_guc.c      | 7 ++++++-
>   drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
>   3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index fb87640080896..c14588b86e833 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -16,12 +16,14 @@ void xe_configfs_exit(void);
>   bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>   void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> +static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>   #else
>   static inline int xe_configfs_init(void) { return 0; }
>   static inline void xe_configfs_exit(void) { }
>   static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>   static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> +static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>   #endif
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 9e34401e4489f..cb757a53de856 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -16,6 +16,7 @@
>   #include "regs/xe_guc_regs.h"
>   #include "regs/xe_irq_regs.h"
>   #include "xe_bo.h"
> +#include "xe_configfs.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
> @@ -81,11 +82,15 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>   
>   static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>   {
> +	struct xe_device *xe = guc_to_xe(guc);
>   	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
>   
> -	if (!guc_to_xe(guc)->info.skip_guc_pc)
> +	if (!xe->info.skip_guc_pc)
>   		flags |= GUC_CTL_ENABLE_SLPC;
>   
> +	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
> +		flags |= GUC_CTL_ENABLE_PSMI;
> +
>   	return flags;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index ca9f999d38d1e..4dc000c977faf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -112,6 +112,7 @@ struct guc_update_exec_queue_policy {
>   #define GUC_CTL_FEATURE			2
>   #define   GUC_CTL_ENABLE_SLPC		BIT(2)
>   #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
> +#define   GUC_CTL_ENABLE_PSMI		BIT(7)

Should we have this as GUC_CTL_ENABLE_PSMI_LOGGING to match the GuC 
nomenclature?

Thanks,

Vinay.

>   #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>   
>   #define GUC_CTL_DEBUG			3
>
