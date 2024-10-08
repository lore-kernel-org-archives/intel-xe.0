Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC7ACEFC3D
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 18:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F039710E59F;
	Tue,  8 Oct 2024 18:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNK1Ej8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E8D10E59F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728413035; x=1759949035;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pOtUp1OB15tGn4MqYCtPopjdvnfHFc/pnoI7fK60Kco=;
 b=kNK1Ej8ca8EtB7T6eoJCqd2z9cwLpUsMSCgOBSTsDWXFBo7h4EnZsMjB
 rC+PtHfAFXsJfLKUgqnYdE6OX8mg5XU2bxThMMnzc/6g29yEpQsMe+Ow2
 052pNjF9+5zRMsR7pMUfFDYFJAdHqNOoL+bBwJuufkv8N2IfXeM9YoJKe
 XH+lwwLoCsqQ1HTY0lJfYxWtNGAlGDoLMzXIAkBk1XSZ/Ky44A2/Fq0b3
 3AqAF+9YwFn5sGjdC6hHoZmqFOH1jZ4//o6wN5TuYEGSQYIVNASZ1yAkS
 YJ7HSOQqqNnyKyLUALFwwjKxMcQA1d1bGqeoufX8amggcrgBMYEe4GGbD w==;
X-CSE-ConnectionGUID: zhH9hfRfQSS9U7UV1HOqFw==
X-CSE-MsgGUID: MlGaaQizRT6aeCOp/dkjxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27521085"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27521085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:43:55 -0700
X-CSE-ConnectionGUID: iAFi7bD6Rm+MfZKG/RQXbA==
X-CSE-MsgGUID: bs30t5i5QdKw4ExVTEEBww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="79919625"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 11:43:55 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 11:43:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 11:43:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 11:43:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 11:43:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 11:43:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0n8986mJNONssOtsbGJZwNf75A5/3SWw7Id1a/Q0TVZAT1v9bs6ufqUdLF+4NmILff7Tw9KobEm6lXkzx+b/3Ybz0VmDG/FWQPo4aES1U50YsIH8CsDRelOYlh6I2DFK+l1K5AkJYlx3wy29RI7/j4bTAheR3AGEiCWWB0EIpl8oNV9uMnHq2QbOgBp0jEjH7l+cBTs9/Uv5hkq0uJpNqcIZsBsvMSAlXnOZWPBTE0l+lFH3/Bq49Ad8Kk40Rk/QNQOIuBvIanGllah38whyr2w8H7O6N/rWtetjTNdnBXfBbVjR1CAeNtAxfvfZnrRbTqHFSrel+q4aK0r2ucmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jsibbxAdsRczguV/VdnhKH+jAqh4U4ktNvVo+tVYQ8=;
 b=xq+Ub2ILyj0VVpuybWZ/28zAU4W8VxJbfeNZEWQK5qhs/IOzvp06y50JUoMHyO7+0SOPqNSw+hpBNPJjQXDQXDr8xQ9gBhSN/RPwSQcnV49KI+H+zJcv+9ElIvAMr/DUkl87vvr5zHymJ9CShOVNaOA/5MJlJFjJpAPDXDffKT0BO5dIxX83Wf233gTzC4GFYvVLNj0AltkC2Fzz444uHAczB0T50SZhv24Ce+0I0GXTrY0e6FsCd880ZzaEbEhecLkY4mf+EUqOu1MBgj+tW2QOTg7r6mVfvrCHOrKOTP+er/G8cX5uS5kxPguJwUmF5UztEKMpqftWC+nSbaDl5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB7451.namprd11.prod.outlook.com (2603:10b6:510:27b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 8 Oct
 2024 18:43:51 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 18:43:51 +0000
Message-ID: <5a1779e7-14b5-4ff5-9c25-1ccb8bc5f05b@intel.com>
Date: Tue, 8 Oct 2024 11:43:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] drm/xe/pxp: Add GSC session initialization
 support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-7-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:303:b6::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5c2e3d-a5b0-4779-c390-08dce7c926f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzBYS2s5aGFIWHFpTEx0cVdCa1VsQTkzZXhVU1FtMXVGS2IxV0Q0QzYyanRG?=
 =?utf-8?B?V0xReTFjazl0R0R2QmF0aUdkWmFHOWFUY21MVXU4cXRwVkpLQzdpanhnRGdL?=
 =?utf-8?B?aEtiK245d3IySTR1T052cjYraGNDZ2RTUTI4L0dqd2lOU1RHTXdEZlo3bCth?=
 =?utf-8?B?OWdjMFZHb1dKeWprRUtjOEtsU25UU255YmRRU1oxUWttT3pTSkRXZjJvTlps?=
 =?utf-8?B?TzNTL1RUZkwwc0I1Ym9tM2w4S2tqTmpoNlh0MDZnSnZtZzVXV1p6SDgyQnJl?=
 =?utf-8?B?QllpcENHMjVORE1DMU9LbW9DZ0t4QzZSV3IxRVc5ZWlHaTFBMkFWdzJneXBX?=
 =?utf-8?B?ZDBmOUMxaThmalhtbjdsdHladWhhcVFEL3J1K2xhdXhmZjNiak1DMnBhSjRo?=
 =?utf-8?B?YzNsY3piSlJNK1luVmt2QWdaU0VBekQ0MjZXa0F0MVNFcXo3aERHd1dNdWxW?=
 =?utf-8?B?NisyOWlWTHBoRFdQVTRYWVdNZXhQbzVvMGVWZFcxT0RQUytjNFlPcmxQUU1h?=
 =?utf-8?B?Q2dzVFJZT2Rya0NQRG52NEgxMVMxSmtUb2pSZWo0ekx2SnYzZlZaRGd1QXVD?=
 =?utf-8?B?MlV0eS9MRWI4V3RpeGRrc3paMGpjYWJ3c0pMNVBrc2Q0UDlnQjdGMWFObkcw?=
 =?utf-8?B?Yy9DVTdUNmJXcEYxcCt3azI3WU1EdFNTNFBmcWNKdVNHWi96NXZBcEcwMjNo?=
 =?utf-8?B?Ymd0QWtxRFR2QlhkZTQyVkpaSWZ3VjVwSVJ6VGduYWpiS0lHbGdtTmhUd0Qr?=
 =?utf-8?B?UWNvR1ovYmVJdEl3eHBEc04ybjlQZDdmTFlYUGY0U2Y5VzNpQ0lpOXJnV2RW?=
 =?utf-8?B?SjNkWUlhWUdkUVdIUW4xVlRpc3ZieUgxRmhsNllzUEI0OWZrUVJRRlBqWEJv?=
 =?utf-8?B?NlBkVjB1MCtCUFlMOUFDaEpmSS9aaGlrL0YyUkluenJhU0svdTNGZU5ablQx?=
 =?utf-8?B?Szg5WGoxWUt5dTdrczRxQ1BIT0dZZkFDUHRaSHdHZ3IxWERsTnpXNGR5RDFS?=
 =?utf-8?B?MnVJV1dlL2NBVzJrTDZBNElud1lXbUNTNnllcnQ5UTE4K1F4RlNEbWovcmNt?=
 =?utf-8?B?Znk5WDJGZWVhVGpoSlJ5UzYxZ2k5SWhUQjZITWFURlBVWXJnN3doeWtYUnhL?=
 =?utf-8?B?dmw3VU81cHFuUVJlYmd0dm1oZkJ1MjNvdDNWMC9hbHBvV1JTRFBrU3h1MHQ0?=
 =?utf-8?B?YVk4MFB2R1J2SERUa0cyUVdpK2gvaU4ySmZZWVdiVWJhLzRXbjd6TGFIN1pI?=
 =?utf-8?B?aEdDN1lwNkV4WTZDTGdGYVNwWjRZb0xvVUs4bzF5WkFWak9sUzYwZTV5NXcw?=
 =?utf-8?B?UWpEUHQxMnNtRkRJa011WHh4NHdBcUo2c0luODZmRjl1MmNrU1NZM2I1LzN4?=
 =?utf-8?B?TFZrQVdIeVRxTFQ1T0lBSjIwdDQ4a1FlQVhkdUF6ZjMzWDIvNXFuNEd6Tncv?=
 =?utf-8?B?c0I4Y3NGdzdzMlYwa0s2T0VqZ3IwUTlYMytUOWpvWFVoTHFxRGNoRkxOa1p2?=
 =?utf-8?B?UzVnZ1NmVXVhcXdDMWpEVTg3MHFpR3hzQ3IyQ3lzaXlQT3JxMkxsd2hYTHRr?=
 =?utf-8?B?TW9KblAxTGN1ZXFSTHFtT3dObkh3QURIN2xYNkZjOVdJSDRiWVBBWmFnNHFm?=
 =?utf-8?B?MG1yZ1VOekN4UGF4cWdsQXorQytIWmx5L0ZhSExEYjFpZWk0T2xVdUVxTW4r?=
 =?utf-8?B?UFhveWJPSjlGZmJHQWFER2lHSTJTRlFQbW5mY0VBUXRqUmFQVVdLU1BRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGEyckVVeGlHcmVBT29kYzl3TjU5VkdSMnJtREVXTkRmSFBneENWaDhobjJN?=
 =?utf-8?B?UTg2ejNPQjRxbUhaU1NsQUVDOXA0OVNnbGpVZHRmMys4QVFrZmN5M1JvaTRO?=
 =?utf-8?B?L21jZVJPc2VzelBLMCsxUmY5dG5naFlWdWxGNjg3a1VvWkN3U2FzQURTK1RQ?=
 =?utf-8?B?OE0vSVQybGlxUEQyc25qQW53SWtpYjVHRE55amRLNEY0RlRrdEZ4b042a2hn?=
 =?utf-8?B?VUtDb0t2aUtpUVF4dlRkYldqM29EMWpCNlREamdjeUF2QnNsTTIrbEhjYmNT?=
 =?utf-8?B?SUVxZ2F3L3ptaUFTNjIxWlNYbDYzTzRIZTFmM0taTEUwT25sV2ZnY1QxWlRy?=
 =?utf-8?B?SEFhUSs3K2c4TldaUklhTlNrbUREYlN6eEVoQmZqM0hUWTFycFM1VHFMT1ZT?=
 =?utf-8?B?MUpjV29BQjl3Rm5VSjliOVhGYzdydFNyMURscHZkRFNqZTRaUXdpeXFtNU81?=
 =?utf-8?B?Ti8xMXdacXM2WGxzYURRbHhBd3g4YjJ6Mnkxc2g2K0gzU3Iza01UMGlVN1Ur?=
 =?utf-8?B?dnZJZXp0ZlYwTmdsS0ZWVlV6SHU5dThzSTg4elFKUG5laFlVTDZrUWZjQ0dN?=
 =?utf-8?B?VUVKbnlUNTIxRTdjcXZOV0k3bFhOcHM0dUk1YU5qNWJqV204ZXRHMGZzY1hJ?=
 =?utf-8?B?WFFkQktYVVlRR2NNM3RPQk9RQUJBNWV2TGVXS0gvTUNlNWkxbi95cm5QVGpa?=
 =?utf-8?B?N2swOW5KTmVLTDd5bXNYSVVnZERtN1QrSFNHMjI4enlvOHlvNjgwRXpnWVVC?=
 =?utf-8?B?YmNzSnpUU1hENHFwR0F3TlRRRk5YSi9XN2ZpR0hMRWMwdU9QOURMQVdxV0sz?=
 =?utf-8?B?NWw4MkZmVytYWTRCeXVpRDduLzFuTXZhaXVoeHltQmxGajgxS2RmZUNFNTBX?=
 =?utf-8?B?RnM5OHljNnpNOHNxenhOYVBVMEdWQVpXZlRDb0tpdjBMMCtxMW5GOWlyYlUr?=
 =?utf-8?B?WVRMdm1aeDJYbTJGbm9MMWwvMGU4MDJUR0xOaUNMT2djUURPcFBGKzRaZ1JW?=
 =?utf-8?B?VXhtV0UyMFlqMTQ2SXFlNnZGV2ZhYmZIdUFib0pOQ25DcThybEtUTWtuYmJs?=
 =?utf-8?B?ZHhqYXExZitHZW0wYUd5ZEx1RVZ6aEtIbGFQbStqVGljQkJkY2p5QUpmNWlm?=
 =?utf-8?B?SUJkS1lYR0NHNkphOUkyY1I1dmM5cndXcm0yamxvSmsyYk1sd2lVNnNmMkRx?=
 =?utf-8?B?bCtBNjNiaFIwa2hidFdkVGRKMjBNMzFkTXFFTnBJZ3ZnMnBYSGt6empnTTN1?=
 =?utf-8?B?WCsra20wVnUvS2NDR2Y5UzFBbkNNVnFhN09wbnVpZlVSb2dzc1JzTlhQQW5H?=
 =?utf-8?B?TEI2eWxNRHhGYWt4aG5leXdacGZrNXpYTXE4UThnRzVOTEZVWGJGUElTVi9q?=
 =?utf-8?B?Szdnak9TYldSTy9mdTl1ZzhUc1lPMjJoQmEvN1FQN0dQN1NjWFRkYWE2SXhM?=
 =?utf-8?B?ODlETW1hSDJVVDc3Q1VqNFNGYS93V2ZxYjB0VmFVZGJUWm11djd0QXVUWEdo?=
 =?utf-8?B?ZlhkMDMvOGN5UEdpSXFaVzhsYkRoKzJnYzNleDN4NW9EMUR5UnROV2VrS1Iz?=
 =?utf-8?B?b1VNaVlhYXRpczRaU2MzbGxNOGFZQ2JZaTIvOEh2ZUxvQjQ1ZDRuOFo2Uk1S?=
 =?utf-8?B?VTg3aEdDUlI4dGx1NTZjVnJzZEI3RGlxSDZvdk4yZGUwd0Z3TE51K1NMbzhK?=
 =?utf-8?B?SitIMEVwUXRYVloycTIvTzYzaUU5aUtacFpSMzNmSG1qL2ZjTGxhbFVqMVZJ?=
 =?utf-8?B?ZTR6cUE4UlpIcmNGQ1BRNHIzcjhtVElVdTNuWmdFbjVlbDdNdmlNUEltRzNJ?=
 =?utf-8?B?czlFZWNGQnErVmE4NDRIWDJxUUxFZXZqZ3hrYy9tNzNzUmZLR2ZKWGNmc2Zy?=
 =?utf-8?B?NjkxVnE1UEg1R0N5azdtZXF1Mm9FeEJmSDlhT1ZFWDRVU3IvN2t4TlNQMkI1?=
 =?utf-8?B?bzVNNE1RUy9ITDJ4Y1dPekI1dEMzS3dGdlRMVTgwaHhzZlJTYTVENFhCUCtX?=
 =?utf-8?B?eUJrSFViQWs2WmxhVTZ1SjBCYzdzWjdEUmRZWWE4anQyMTRJc2d6VUtUcGZP?=
 =?utf-8?B?dVpaenhLMEVhRy9rdlhiRnRmZUlGSU02Z01HdG5nblA4NjZodUIwY1c5NjVX?=
 =?utf-8?B?R0xjWHNUWGduVEhJNVRvVjUvOGdpWG5PQ2NQZ2RrZFZBSnhvNU5yMHpub0JD?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5c2e3d-a5b0-4779-c390-08dce7c926f9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 18:43:50.9762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJe/9d7dHOYIFcLfT3ZfYC0JaWZS/b384jB/YmvOFA7SVhxmVTnX1ezc6x6bj9l1qfzjc/HmxK1NBLpGvmoF4xRH9ECCj1SFaUNZJv3HoCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7451
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> A session is initialized (i.e. started) by sending a message to the GSC.
>
> Note that this patch is meant to be squashed with the follow-up patches
> that implement the other pieces of the session initialization and queue
> setup flow. It is separate for now for ease of review.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h | 21 ++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 50 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.h            |  1 +
>   3 files changed, 72 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> index 4a59c564a0d0..734feb38f570 100644
> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> @@ -50,6 +50,7 @@ struct pxp_cmd_header {
>   } __packed;
>   
>   #define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
> +#define PXP43_CMDID_INIT_SESSION 0x00000036
>   #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
>   
>   /* PXP-Input-Packet: HUC Auth-only */
> @@ -64,6 +65,26 @@ struct pxp43_huc_auth_out {
>   	struct pxp_cmd_header header;
>   } __packed;
>   
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_in {
> +	struct pxp_cmd_header header;
> +		/* header.stream_id fields for vesion 4.3 of Init PXP session: */
> +		#define PXP43_INIT_SESSION_VALID BIT(0)
> +		#define PXP43_INIT_SESSION_APPTYPE BIT(1)
> +		#define PXP43_INIT_SESSION_APPID GENMASK(17, 2)
> +	u32 protection_mode;
> +		#define PXP43_INIT_SESSION_PROTECTION_ARB 0x2
> +	u32 sub_session_id;
> +	u32 init_flags;
> +	u32 rsvd[12];
> +} __packed;
> +
> +/* PXP-Input-Packet: Init PXP session */
> +struct pxp43_create_arb_out {
> +	struct pxp_cmd_header header;
> +	u32 rsvd[8];
> +} __packed;
> +
>   /* PXP-Input-Packet: Invalidate Stream Key */
>   struct pxp43_inv_stream_key_in {
>   	struct pxp_cmd_header header;
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index 41684d666376..c9258c861556 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -26,6 +26,8 @@
>   #include "instructions/xe_mi_commands.h"
>   #include "regs/xe_gt_regs.h"
>   
> +#define ARB_SESSION 0xF /* TODO: move to UAPI */
This same define is now in two separate source files? Even if it can't 
be moved to the UAPI header yet it should at least be in an internal 
header rather than being replicated.

> +
>   /*
>    * The VCS is used for kernel-owned GGTT submissions to issue key termination.
>    * Terminations are serialized, so we only need a single queue and a single
> @@ -470,6 +472,54 @@ static int gsccs_send_message(struct xe_pxp_gsc_client_resources *gsc_res,
>   	return ret;
>   }
>   
> +/**
> + * xe_pxp_submit_session_init - submits a PXP GSC session initialization
> + * @gsc_res: the pxp client resources
> + * @id: the session to initialize
> + *
> + * Submit a message to the GSC FW to initialize (i.e. start) a PXP session.
> + *
> + * Returns 0 if the submission is successful, an errno value otherwise.
> + */
> +int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources *gsc_res, u32 id)
> +{
> +	struct xe_device *xe = gsc_res->vm->xe;
> +	struct pxp43_create_arb_in msg_in = {0};
> +	struct pxp43_create_arb_out msg_out = {0};
> +	int ret;
> +
> +	msg_in.header.api_version = PXP_APIVER(4, 3);
> +	msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
> +	msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, id) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
> +				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +
> +	if (id == ARB_SESSION)
> +		msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
> +
> +	ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
> +				 &msg_out, sizeof(msg_out));
> +	if (ret) {
> +		drm_err(&xe->drm, "Failed to init session %d, ret=[%d]\n", id, ret);
%pe for error code

> +	} else if (msg_out.header.status != 0) {
> +		if (is_fw_err_platform_config(msg_out.header.status)) {
> +			drm_info_once(&xe->drm,
> +				      "PXP init-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
Style mis-match - "init session %d" in the first error but then 
"init-session-%d" in this one and the one below (I prefer the first one 
that actually looks like an operation rather than variable).

> +				      id, msg_out.header.status,
> +				      fw_err_to_string(msg_out.header.status));
> +		} else {
> +			drm_dbg(&xe->drm, "PXP init-session-%d failed 0x%08x:%st:\n",
> +				id, msg_out.header.status,
> +				fw_err_to_string(msg_out.header.status));
> +			drm_dbg(&xe->drm, "     cmd-detail: ID=[0x%08x],API-Ver-[0x%08x]\n",
More mis-matching message styles - 'SOC:%s:%s' vs 'ID=[%x]'. Neither of 
which is the normal format of kernel messages.

John.

> +				msg_in.header.command_id, msg_in.header.api_version);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>   /**
>    * xe_pxp_submit_session_invalidation - submits a PXP GSC invalidation
>    * @gsc_res: the pxp client resources
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> index 48fdc9b09116..c9efda02f4b0 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> @@ -14,6 +14,7 @@ struct xe_pxp_gsc_client_resources;
>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>   
> +int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources *gsc_res, u32 id);
>   int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
>   int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res,
>   				       u32 id);

