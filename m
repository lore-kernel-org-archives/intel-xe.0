Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0103EC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 23:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E2B10E056;
	Wed,  5 Jun 2024 23:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="je8xuTVO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5246410E056
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 23:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717628890; x=1749164890;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZkcsIoFAyGcm9ihaaykiCC6pr0wOh0mENQCK+BxBFCo=;
 b=je8xuTVOT9iz/FjGwPIEZ3ALHlSDwbDo1QJK5UFzG1j/88ztKTkq6r2b
 mWs8cYE8YKPDjstqAoyiOmGTiD4EK2/sXdDie7Z4XRqqKTQLHBMt1O/Lc
 tFStyp+IzB65kz8WeffnuSRn0lFQSJZymI/W28QAWzcu/0n06lN00/pdh
 IoGpxqNE6qLy+jXdShWAGr81kPHxdNZMq50rakH6x4XF9s1hOB5nJa7DV
 UGdRJm2y5gOGaXRv9oBKfVCDet5lXOLFpMjtYuH+2yBMn75jKAoE24gpU
 z7wDXlKOdqFhgREkwNO8R+5HRjtCJyT0sKyD85zUkLhjINEhfcMMaj6lO A==;
X-CSE-ConnectionGUID: oiH4xu6pSFagl6TLCb8Z2Q==
X-CSE-MsgGUID: yasUABNpTfurgaMJOhSLqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14073544"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14073544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 16:08:07 -0700
X-CSE-ConnectionGUID: FrkXzK/BTyyOXMVS3ZdU8A==
X-CSE-MsgGUID: 8U4PUlL/ShmB2EL7AfLjfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42215164"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 16:08:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 16:08:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 16:08:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 16:08:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 16:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtL0z+UTsqTVbKnTexWK5QUy+Ybw3VRRj50FgJ/zelOWikYsfN3jeyZ1QB8hd3qOwsVF/YLv8QnsUxmxyTW+1G+fl+N0RGieW9tZSSurWZmiAruJ+w8jO5UywOQptrfKrPJU9rJtChjz2LSow5RjaIsDZHITobWbIDQDqBsNCMzDIadfcYoQUF/HxK9RCCMNYk1MfBdQugRnANDGvHL537s6m1FIveg9ibfBexKzeSK8nIQZdjwdWupoDPuwfb+dKf+Ofaoh6yw/J7MPM/H4KOwMq4pzKIRJTUuP7A8PtqFoPJoFVKgXA69xcqWiHYaqtE5Q+GG50T5xlgWXu4RIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEQSqZso20w70sdP+GWvMUiJY0eB7Y/+lxK4mTXNZhw=;
 b=lAg/QkSounyiTQIQ8NtIYXHD4jv9Z+Ye4GNZimgu/+nM1DWY6IowgBfH4FFlaiFlcEmLcWlGJyOfU9UDFwz05Gy0MNmCsBF6rZoPjqOQRDZ4DD0yqxDn+p3tpn123hD4yfgYwhyDTzJSx1SCFbL+nDA0jj3+5F9rMPT239N7D0k0Gf/Yq54AL+2T+39wvjE2i4RTKiJTsZJwpy8+lwTIhx7vE8G5Nrohr7RjlJI7PiKe1S4sR82FQ9rTkuvSZVv1i7eMAsLftpyjvgVsOF/aeJhF0mO0x39Pw7I9DQszrgTkPiJBpK+xKjaarEfSkv+t8PUN3sWRoh7sWjiQ8b4+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Wed, 5 Jun
 2024 23:08:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 23:08:01 +0000
Date: Wed, 5 Jun 2024 18:07:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <fei.yang@intel.com>, <intel-xe@lists.freedesktop.org>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: uninitialized fence causing null ptr
 dereference
Message-ID: <guqyephc7tp2hy4r7wzehwndapykt3zgnzammhk4u64dxknzaw@mw5urgkovoge>
References: <20240605181528.2047987-1-fei.yang@intel.com>
 <20240605181528.2047987-2-fei.yang@intel.com>
 <ZmCsFytzsaX6hdqz@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmCsFytzsaX6hdqz@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:303:16d::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd15c14-adbf-4d30-fb6a-08dc85b4591a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OvDSA0xlRVf+5Kg10qu1Fp3CPc5FswPEHxY1pB2oeJMtBI/fguoD1eQ/ev?=
 =?iso-8859-1?Q?kedHH05afCqeHM2zC4mIY5izaIyaZUoLCT8Nxw4iH8C7oXFHc9ydNGgoL/?=
 =?iso-8859-1?Q?EvrGS8DW6sBt4E0CCs7UUpmle6gVTZ79g350G70NoQn7sXqzi10QwPLjOU?=
 =?iso-8859-1?Q?Sv4sMTZqPdVR24a2prYxVTVmMfHm7yvPeGWpnzcbWrVUqZNUNdy1Hi0nW2?=
 =?iso-8859-1?Q?GGYKCwWa/nhxkYnuu4pGC72W0gyixpaiXynrTN8emFn33fp4R6y0nwmhmZ?=
 =?iso-8859-1?Q?h9H85j28QxJoICXE7Z2G4gJcvJLXT6InipAiabzvIPOyG7UNro8pPo3skR?=
 =?iso-8859-1?Q?Q1DCjEhV38F/kzUUN71AZvmz+LKCaoLdvrjAlqCaS/PrR7/f053ftR8Wb7?=
 =?iso-8859-1?Q?2ibrpmTQL+Ki2arAwgs3jek5CQopfU8H4hzPaslmGn2YFpIhgwrkrBIz0E?=
 =?iso-8859-1?Q?cby00Ll2odV7Ya6DOcxQaeMMoI/DydwUb/S6vx0PT+U6ScXcMHBrXcW3qe?=
 =?iso-8859-1?Q?L2QdHxCuaJm9yOEektmDe624I8SPmkryZE7aYjspAUuZrHyTP0w7TKsUto?=
 =?iso-8859-1?Q?BwiUgjeDkOkCLjr/Lp0sMzJw5yoEU6iwaRac6jPq32E9M+CKAuEG8Vf3+D?=
 =?iso-8859-1?Q?JafKkCCf14Q4wOwODBLJGGd9rmJc9sJgG53ptoUZGNgsIo6rfwAaswTj91?=
 =?iso-8859-1?Q?Bw0v6NRA0rt1444nSiD3k4ZQbnthGvBXLj03AVAZDACnDxCtX+Hk2e4c8L?=
 =?iso-8859-1?Q?UmrJ/J8N+v2QAS+hF71XQ73vh3lvN3eQUPHG465ZoisLJf/RXTt28jkGLA?=
 =?iso-8859-1?Q?mVWHH0usDsoKG0YfMpU6QX2tEaubs1exdksNh4QhO+Eb47ef+AlITwjI25?=
 =?iso-8859-1?Q?m2bKJ/MOzeobnno6F6Ocrt2Dl7pBsxct4pYFbVEG49Y7ZQpDgtrF5Hxp26?=
 =?iso-8859-1?Q?GH2cTbrkkVHN0awQ5v5uBxVyMbxr1Y/alJv0iMXNXmuwtnMqhL6p6UegXD?=
 =?iso-8859-1?Q?PeiRPwDlh4/OyT1HgOeZ1qsa/NdGNxMnMuPelr74xFKwj+4eJF3rQWoR1x?=
 =?iso-8859-1?Q?vQe8d5Gvr3vU14w+C4RLriWC+EOjDT32TbAdoKC0AyAQEJ6VXZT3WUHV8/?=
 =?iso-8859-1?Q?zelnoE331JfmXahH81QKhEa+sdhk5cM+aNi7VIqGw7mO+DXhwGU9viAtcC?=
 =?iso-8859-1?Q?UkDv2zKn2CIZw0diguU3ipnXXa2gwDQcXvTunsRXZVhTQnij96TtSMfk+S?=
 =?iso-8859-1?Q?SYG1B4M8duLvBHT5YjgGHnodY7eoOtYm2TdsJRSEI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?45hR1dzH8T5CwXBiiTrX6U7KclxAQtGB81+2HpvRGQ+x3FyadlLJhbcMPL?=
 =?iso-8859-1?Q?B3wVK8NDlWXGBEHbrNxlfR+3hwkE8ueucGKfDaFrHIf06Tav8Oiu6Gcz9L?=
 =?iso-8859-1?Q?cq3hlvsO2N/o9QPmBYlg2zV2j+w1vrjnHOeRQQpa0UksC8a6RjNaauyXv1?=
 =?iso-8859-1?Q?EJ9MIIzKqoDnUOFAImouAALSAaCe0PhblJ7OhQ/3E5r8XOVdPMG7FrTObf?=
 =?iso-8859-1?Q?+YT0YBvAEuyLrBIbkMRKCqrt2rqxIbFQvhisEyOtUxT3q9kOvUJhRRXQH9?=
 =?iso-8859-1?Q?4Yd5ZMHPEdSqlF7rJldgNWTTgiS+M8Mr1lF7wOKZ5cQ2bD5+p1A/Gwae5g?=
 =?iso-8859-1?Q?4FJgKjilwn/3T+o7dql8RJIWq6e26LjNHYOeh2rVEGeKLry4mQRzccYG9A?=
 =?iso-8859-1?Q?5ojtvoUFaW5hvZNbpF+gfsSF/TUJf2mQMSA6B7Lh3wdUNuaOIKRllvUwFH?=
 =?iso-8859-1?Q?bU+1y2KmSiewjgkOxtW7DbRfWoImBsP/MSqyLMTZfhIn+rxxwQs5m+IoOv?=
 =?iso-8859-1?Q?yiyHblg0jpb6LxWWpq1/Fjf+9PEmH0FMs4nyziC6q1otXvc6IHwBw7JuU8?=
 =?iso-8859-1?Q?w5/WtvLffclezIb5ds87IR0H+cTHCinIq+gTko9BxfY1hD/l+4uvDVr4Eo?=
 =?iso-8859-1?Q?13h9RPvu6ufZ0GqvS1mPR7NNzfqMHklwNjjdeqqek3ybnmAhqnFiOhRkfH?=
 =?iso-8859-1?Q?mu8Q57u9zSloueI0RqUp1hK9XNYwcmLozSguOVFEKz0LSHX6AuLjkN7Vbk?=
 =?iso-8859-1?Q?i/LbLNJoKNN4dY0/LCgS74PtZTvtIdZ2qP6GiAC3N0Cvon30S149xys8cZ?=
 =?iso-8859-1?Q?FGZBubswPDvfypWNA5A/GNAv7BiNRr0IfAIOqkel1oQDMbz6gPMz2YHqt9?=
 =?iso-8859-1?Q?5o82CXsx6Tx0Q5L8hq5z9LiejnjUqo+KdjzH5rjkbD7KYN1cSRsMds/JTW?=
 =?iso-8859-1?Q?gU4FMx/vZFvtP763ZYSPV3XOXKT9UORjQsiUQUCBKznxzPu/ErRKdZtwsK?=
 =?iso-8859-1?Q?0c0m1WnFe8YWLBw9LqfQUJsMjqw0or/XAZTsMytQh2R5NNc8VOMrUuCt2J?=
 =?iso-8859-1?Q?vQUvDq0Ogh6vBQp+btfUAj4NgNYYF/ZmP3CEtOGuMUg5PfU5BIkGqdGLsa?=
 =?iso-8859-1?Q?wOr4YoQZwN91xsogAGmfNjmPmaw5RHAcYBNaoghwBTbItbmiSAFIlrvUdf?=
 =?iso-8859-1?Q?5SqJn+M+Zk5zs26A86AZGIKuSLvB6FhC5Gcml5KYhvqmoYf/l2Zf7YfpAr?=
 =?iso-8859-1?Q?15Ff8LBujEt0SdJiod4zpzdcBbVbVUaoj/ZeZINOhJBvC5gaoEO+inhzCN?=
 =?iso-8859-1?Q?JsyXT9lqPJxTWxy0zeJk4gHW0xXkdwirFBd0JJZd9kPT6huPY7l35QVkZ/?=
 =?iso-8859-1?Q?LCVQsJCy+81x+PLKiaP7ea5hLKBt6evVoZW86Dp0FfBtRHatRzm1G6Tz8F?=
 =?iso-8859-1?Q?B6FeNCl8G8kFPqyeNANJ1S0eOfmu7HndrTwGTZC3hiGZxzdZ1DyIe9KwD7?=
 =?iso-8859-1?Q?zlSacggp6f6pHD5EW8EPxkftdsakJ0GNFw/q/AYKbdLOLhD2+MxMStg33f?=
 =?iso-8859-1?Q?4H32aL2ex57Ae3US3PaGj/598v6M5bbKEvX3goD2PiAwfr6NVnAduaQRwl?=
 =?iso-8859-1?Q?rUQdFDrQ9v47lMvImN6iJe49QzGJdmqM0KdTIbict98xJtRugxRsaaCw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd15c14-adbf-4d30-fb6a-08dc85b4591a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 23:08:01.8416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9agITlg+QzgEM1GRor5dm8awQmNQVWFi3SDfYhostCjYGjkC8JKNiZJR0qzSo2i6iMzwsKnU4Vm1ZRHt4cLyCCIZ+GcKIeiA8jvzq7YdF4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
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

On Wed, Jun 05, 2024 at 06:19:03PM GMT, Matthew Brost wrote:
>On Wed, Jun 05, 2024 at 11:15:28AM -0700, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> [  141.256160] BUG: kernel NULL pointer dereference, address: 0000000000000028
>> [  141.257162] #PF: supervisor read access in kernel mode
>> [  141.257943] #PF: error_code(0x0000) - not-present page
>> [  141.258722] PGD 800000018c95c067 P4D 800000018c95c067 PUD 18c95d067 PMD 0
>> [  141.259751] Oops: 0000 [#1] PREEMPT SMP PTI
>> [  141.260409] CPU: 0 PID: 7277 Comm: gemm_bf16 Kdump: loaded Tainted: G     U             6.9.0-xe-474+ #1
>> [  141.261812] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007
>> [  141.262669] RIP: 0010:trace_event_raw_event_xe_sched_job+0x50/0x100 [xe]
>> [  141.263644] Code: 02 00 00 0f 85 ad 00 00 00 ba 30 00 00 00 4c 89 e6 48 8d 7d b8 e8 a0 c4 78 e0 48 85 c0 74 7b 48 8b 93 18 01 00 00 48 8d 7d b8 <48> 8b 52 28 89 50 08 8b 93 38 01 00 00 89 50 0c 48 8b 93 08 01 00
>> [  141.266281] RSP: 0000:ffffc900017ff1c0 EFLAGS: 00010282
>> [  141.267075] RAX: ffff8881001c4208 RBX: ffff888188499380 RCX: 00000000000007a3
>> [  141.268100] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc900017ff1c0
>> [  141.269123] RBP: ffffc900017ff208 R08: 0000000000000002 R09: 0000000000000001
>> [  141.270145] R10: 0000000000000034 R11: c0673accd9eb118e R12: ffff888157969908
>> [  141.271166] R13: ffff888188499380 R14: ffff888188499380 R15: 0000000000000001
>> [  141.272187] FS:  00007f38147d4780(0000) GS:ffff888237e00000(0000) knlGS:0000000000000000
>> [  141.273402] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  141.274250] CR2: 0000000000000028 CR3: 0000000188490005 CR4: 0000000000570ef0
>> [  141.275268] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> [  141.276284] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
>> [  141.277297] PKRU: 55555554
>> [  141.277758] Call Trace:
>> [  141.278186]  <TASK>
>> [  141.278571]  ? show_regs+0x67/0x70
>> [  141.279114]  ? __die_body+0x20/0x70
>> [  141.279666]  ? __die+0x2b/0x40
>> [  141.280164]  ? page_fault_oops+0x153/0x4b0
>> [  141.280782]  ? search_bpf_extables+0x96/0x160
>> [  141.281439]  ? trace_event_raw_event_xe_sched_job+0x50/0x100 [xe]
>> [  141.282317]  ? search_exception_tables+0x5f/0x70
>> [  141.283004]  ? kernelmode_fixup_or_oops.isra.0+0x61/0x80
>> [  141.283771]  ? __bad_area_nosemaphore+0x18e/0x290
>> [  141.284466]  ? __lock_acquire+0xa22/0x30a0
>> [  141.285080]  ? bad_area_nosemaphore+0x16/0x20
>> [  141.285733]  ? do_user_addr_fault+0x338/0xa80
>> [  141.286384]  ? trace_clock_local+0x10/0x30
>> [  141.286993]  ? __rb_reserve_next+0x62/0x4c0
>> [  141.287611]  ? exc_page_fault+0x87/0x2a0
>> [  141.288197]  ? asm_exc_page_fault+0x27/0x30
>> [  141.288813]  ? trace_event_raw_event_xe_sched_job+0x50/0x100 [xe]
>> [  141.289678]  xe_sched_job_create+0x29d/0x2e0 [xe]
>> [  141.290373]  __xe_bb_create_job+0x93/0x220 [xe]
>>
>> Fixes: 0ac7a2c745e8 ("drm/xe: Don't initialize fences at xe_sched_job_create()")
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>Thanks for the patch, noticed this too [1].
>
>Since I'm hear and our patches are the same:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>Will merge once this CI passes.
>
>[1] https://patchwork.freedesktop.org/series/134484/
>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
>>  drivers/gpu/drm/xe/xe_trace.h     | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
>> index 002c3b5c0a5c..0c3ddbb7e25f 100644
>> --- a/drivers/gpu/drm/xe/xe_sched_job.h
>> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
>> @@ -70,7 +70,7 @@ to_xe_sched_job(struct drm_sched_job *drm)
>>
>>  static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
>>  {
>> -	return job->fence->seqno;
>> +	return (job->fence) ? job->fence->seqno : 0;

	       ^ no need for parenthesis

This also doesn't have the commit message in imperative mood, so I'd prefer
the other patch mentioned above to be merged... or this one fixed.

Lucas De Marchi
