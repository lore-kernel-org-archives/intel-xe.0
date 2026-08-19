Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51566C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 14:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C71810E576;
	Wed, 19 Aug 2026 14:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMzDtnjo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0FD10E576
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787148929; x=1818684929;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KCtxHh9Jk6yxiXZkA2itJ1CuymdoCKHpEf5ctcdJ9uk=;
 b=PMzDtnjoh5vcpLMTKMVaGqcABlhuX/tAsdaLPuW6mus9SgYNM9D3uxYR
 nL0qydkd+MKCdPyZbYb8906W4DGofQcVBxCztzFgcxcoME6gd0Ky+bYdC
 obhVYzLHXJhw5//4TidP4xPYIRsvuAVzvRw0hK2IiUuubDIMx6Ws8oeJa
 30FUp38ZiHlBjUkN5E9IfwYLIUbocIiwmzYdCuEFUcPTftv47O100q3ha
 yINlopAYBk1Mcgc4GTmMuj55HBWjANaxafPPV1rJ385TV7yzTCiLskW7l
 D9kBGccPL9eZ5KCYLTbFXSDdWQPTqTI72YmsVfk2yKlW1yMsImPkshOun g==;
X-CSE-ConnectionGUID: n4WRlzU2TwO4n1L7BsGE/A==
X-CSE-MsgGUID: Mze+pQsLQ/K5k4CVht22wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99189814"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="99189814"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:15:29 -0700
X-CSE-ConnectionGUID: uFsZnY0BQuWDis7wVkJYlg==
X-CSE-MsgGUID: y5xNLPC2R5ySvDoHSgZ7lw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:15:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 07:15:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 07:15:28 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 07:15:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfYcCNfPTbOlqwHbUsIoNHdt4ydurIZ9SpIB683KlfWGYc1HH3RE8zBKzHDJGIM4tvoWmIuM+xmabbXdwIbCWeRsFhJViCfNMaqqqnFz4GigmbjqIzc9yTEYMWSQbnoRhE9RtMdY/6TE5tjdVCnlCxrThkavuTby9inaPkucKyhN9PIgu3Q/OUyd1F5DR4gpyTr6fjdb5JSkCy/w57FF/AvLsdlkjn69/D6E8Q7CbfaTvg7PDupV6PSpHjuUyMVA6P/oAP1HAdoPpQjbA4kDQ7nWWWfKFPupwe6B91tWDQBaIjBWqB8AyWNugfwd1ZXnhCUZfocZJdDUek4Q9C4S/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRGRFS4HGueqOBRbOqGIhmqK5Ixrs/+H+p5dy2GfFDA=;
 b=yBVUU47FCh2ueYZ05iBwUv/baKAQHrY8TMiTZR+0owee+6o53uYoAdRtMpFNlYAlyafUtiD+42189JmilOgbDjkO33+UfeBNQjd1a/b72wxsv1RDUpcphmrgfaukRZag2Y5rDWZG1CmNH3xRkyXqQIS7lIaB0cmdxyBmEzix+iMywmnDdfaRGwRlgB8+B+mrUBD9A7Bxd1FuP2NTyEl08mZqr+Oh6jpv6VNI3HrSTYoe4dq3wuxe47zljP8zYgs6vxxd+5hqtMy+EAQZqg1M5EeQOm6QVQtU+YarmNbx5s5ujrzODKXP4d0hWRUvylcpg+BROUoMcGtpC9eajcUbIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20)
 by CH3PR11MB8704.namprd11.prod.outlook.com (2603:10b6:610:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:15:23 +0000
Received: from IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce]) by IA0PR11MB7752.namprd11.prod.outlook.com
 ([fe80::848a:3e54:c19b:11ce%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:15:21 +0000
Date: Wed, 19 Aug 2026 10:15:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
Message-ID: <aoW6dfdEwGLgJPzj@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
 <20260817065055.3734576-24-tejas.upadhyay@intel.com>
 <a670328d-b5dc-48b4-bb02-ed7dfa2d48f1@intel.com>
 <DS0PR11MB871812022E070C0052F5AF3F81A72@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoMxh3bh1WEf8SF6@intel.com>
 <60960fcb-7aeb-4642-bd6f-ad1b6ffd2a2b@intel.com>
 <aoNhZwRGQC2uh95n@intel.com>
 <DS0PR11MB8718B926A3C9AAD8770AB89681A62@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoRWO88_jtfv1V-g@intel.com>
 <8ceaee0e-cd24-4382-bb45-c59f9444e6ca@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ceaee0e-cd24-4382-bb45-c59f9444e6ca@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To IA0PR11MB7752.namprd11.prod.outlook.com
 (2603:10b6:208:442::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7752:EE_|CH3PR11MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: ca95aec3-6d7e-4a08-eb9c-08defdfc4dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 6ZkJGrgGtZFgLD5v+0IqdcdSNOR7GLXOc+V+NIilKby98qwKB54iexUH2ROBs/TC9KVJXizBsuPdI8WQ5tyQK0ix1G1H90Ir2tGMbhT+nov3A8CuInC4pGbpVLMs3lC2LY4YVd8i4aXtbsEZndJ82RWa31Roi6SBHNkDM+lh1eNY1nZ+nJbf5NJm0fzdGU05nHEnwdW633W4TEez6uopZACKknA2yoTR/iRmtz1/442H4mTZmqoz50vRhnyS2QQzWDDwx2VVoFMrAcxOuSJNGPGzLobKwGHLE+m++db0U2ghurY7CYpDjSNfMLk33ScZTBJMC/8hZ4+5A/W+vBmewwL0gwpdgvochhIdz74iKSQ/PvHOlUZ3EGzDfdUq3keWseUlcLIgg9iiifCnzKiAcNztr7CJWDvHdbE1PBV29UmR+/5H+YrtaFza4LzDX0WPWl6Qvf6gO/eTMYwOWxRRrHFtcwpPW6MqPcy0iC5Sdt9M3VKMxOFd7hzKLCs7b7PbfgznW05FR7284BBBGrQ3SKIJkucgG+em7AJDveTZaMZll4DKoBMIEzmenQR9X03OqvQ4NKZH0li4R43yskWDosNa3UX7R0FoKtdUXqaulVO9FiXIPJ16lyOhtwg/j9Q5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7752.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVQ2WGprQnNTZGpodkZXeXRKeFEycElUeXdmQVNNaXhTVkI4ank1N0dOL3FY?=
 =?utf-8?B?UDNHU2hQQUZka3pmNzFTM29nMk1WN3c3ZmFHdjQ3SERNakJXazYrQU15TDZk?=
 =?utf-8?B?UnNYYVV2RmRYMFdTaktvbTY2QUNySWNyNzhLU1ozZ1lMWDI1ZXlCcis0cXRo?=
 =?utf-8?B?amh0eEJTRlVDeDNVWENla25RL1kvbFpmbFhIU0dUV3AvbzNqK2RVOTNFbnc2?=
 =?utf-8?B?dm9CLzExczlTVisrUVZTTlpZQVQwQ2p6b3ZxTzFDYW5qdi8vRUhYcjBzNlFX?=
 =?utf-8?B?ZzNkZHYxanF5Y1NCQjluOUdYKy9KdjFqbVdJQ0xheUNJYUQwa0dWRDlzZlda?=
 =?utf-8?B?bTlPSEs2U2szWjBpbGJ3YnI1TC9aeWhNUFdYdEpXaFpHT1dlLzlpQUZqVm9u?=
 =?utf-8?B?L3I5SlN3cFZhR3FOejBacG5SdFF6dC9xdEFEL2FDV1J6NmFQeFhXblN2S3M1?=
 =?utf-8?B?OW44bkp3N3dqTnVudk1xaGR6bmtBeHl3SHlENDk4ZFErOGcyYnN5UExWVTMw?=
 =?utf-8?B?dWdTMS9lSlNIaUV4OHBLSzgzdTdFUTFtSFBlREp4OUNBdkFwV3pRKzd0d216?=
 =?utf-8?B?Z29SK00zTm94US9lR2V6WWF5ZUlnZzk2RkFvWUp4dkpDM2duQnB3QnF5cG5U?=
 =?utf-8?B?UUJ2UVdkZ09lZUx6YmpiZXRxQXJyclZuY0xUN3pjdy9TSmVvUk8rU3Y4cVho?=
 =?utf-8?B?RHV2TURGbEdnNU1FaEwyQWZtK0hQRWpoa1BEd0FUYXNKZm5QeUNvK1RMckNF?=
 =?utf-8?B?RFREcUtpai9NYi9pTzIwTnphd3dsbS9xTitrTWlLN1h0WjNZVDh6RXRTWk1k?=
 =?utf-8?B?bGRPb092ZFI5OGlLeldKZDBxMTZiVm52U1J2K1RMakFpRmtEM0dsY3F6dWhV?=
 =?utf-8?B?cTcram5Xd1dRQUIwQVNDZERpaEpzS3JYWGdiSWtXYkxESndPUFNTRG85N29m?=
 =?utf-8?B?OGhBdXNqbTMydmlwcHpEaXd5WU5iNkJiTFNVUDQrS0M1YjB1RzJUdStJYVhz?=
 =?utf-8?B?ZTRUcGV3b1ZsR2ZlbHRMWVMydkdQalVsRGxLMjAyYWxrYkx6dnB4dnhrWEdw?=
 =?utf-8?B?ZTJpYXB3U0xFZlQzK0lObExRQ29SZ0pHbGFucXdnNnJYQlZLNHRSWDh2UkZB?=
 =?utf-8?B?MERlREt0WFd1N3c1Zm5iQzNEQlV0NHU3OFNQREk3UTh2cGhwQVd3MzBsRlVX?=
 =?utf-8?B?TWlZVGlLTDdRZURVK2xjWEVFbDkxQ005VFdRWEpLaHNNeUk5OTR6Mm9SMjRZ?=
 =?utf-8?B?T1ZLcithNUdvQVd6TWFDUWdtbXJEK3oycTdJWldOWUdodFo2QnlMV3c3b2dL?=
 =?utf-8?B?bFBrOVRGYjAvQWZjNTNveVlINlVlSEE2RDBOWG52c0tvVkFKMExkMldkTjA0?=
 =?utf-8?B?bTdzV21yeUZZZ3Z1ejVKYnVHc3J5WUxkQ05RU1R5UFpQbzJVcTVSZFduSXlW?=
 =?utf-8?B?SHQrSFpuV3lXNDJXdVpIQVplSkxzMDBVZ3VmTVdmNldzQ2doRURWNDh4eUtF?=
 =?utf-8?B?SEl6anQrVzdWMmVQWkpNZlE3amk4K00rbW9yYmMvRDJUQjkrb0Q3bUZVUWti?=
 =?utf-8?B?MTRQOHliMnlkcFVHSmFhRUQ0c1FibUNGR2plZXBObGFOU0pxYWE0VDR3MXZV?=
 =?utf-8?B?SmlZNEkyeWVNVUZQNU85ckwvSjBpSXphaTFiVTJzUEFMeS8xb2srOTNEM3VN?=
 =?utf-8?B?emlQam1xMVhZYWFNTHdLT3R3WVlWNEdmemJEd0pXdlpyejA3RU50STk2TFMx?=
 =?utf-8?B?MTVyWExaQkw0SEtzc0hjdlBqMkdENU9lQ0g5NDdmdytpcFJ1a0JqN096NXNt?=
 =?utf-8?B?VGg3SzZmTE5Uc3RnZVhKbEFadVBCYS9ncEJsZTVNTGVLLzdEZk1PcElmOG1U?=
 =?utf-8?B?Y0taV25CemtIYmE2Snc0ekVuTGIyaUNnT0NaRDVxNWFYZktDMVNtWmUxd2p3?=
 =?utf-8?B?enZINEZjM2huSzZLdWhXRWJ5ckZmaHl2RTBvcXgycXNkUGhrZi94N0RENzg2?=
 =?utf-8?B?RGdyQkh1aHZLYXhYT1pPakZENm51T1VFR0o2WkFWWEp5Wk8xVjc2aHVtU2Vi?=
 =?utf-8?B?U2V5S0swUllnR0d2N0JJMXFodVpuaHpIUFA1aGJJU09sS1QwUm8xYmhSVHE2?=
 =?utf-8?B?YnlpMDRlanpBWW1SV1oxZW8vUXFVa3N2ZmZ4TXk0cHlHL1lGUGMzekVYanll?=
 =?utf-8?B?NXZReXVwOFNDK01wa3p6bmlwVStCb3RLM2NYTjUxVTZsN1dZK3pLeEliRmlM?=
 =?utf-8?B?bGxkNHFDeU5jTVR4azlia2VmaGtyV3NWdHpON0VwUkxtTGM3aVU4QVV0bThs?=
 =?utf-8?B?Smg4eUh6a3ZtS2FhdDYyL2c4QU42djdFWlNWajNhTGFHTDBVdmh2QT09?=
X-Exchange-RoutingPolicyChecked: KVTCiuDJnbDQASPR01c68EsonXXdlh3R797TxTcc/uL7aPlD0YErsCbwySgC1LPxgdzBqyjRCCqx/kfxjzqYjw3xZlWaPRHcUi70C9NlnEC5swVW6FxHAd4g0/y2IIRNAt3ZOq3a8QIJloenGr7Fpm86twSc7JSz6aLT+Ub0HiEF/s1n6qKtzN6h2J/4uToipcJgSsJODXefFk/2hQe20xlXrfCexVKviaFfBzWU7N3rrATSVrbpgbPJfdiE8uc+me55pwmntGIJ4yCwuGdccedTgnRsSSIKewm0GNbuPUtPqWWDW1SzuGtx9j9R3xco1EsCC+Bv5Y68EaEwx4y/2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ca95aec3-6d7e-4a08-eb9c-08defdfc4dd5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7752.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:15:21.6036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CBxiJe6bbMXHnJ0yPCmGMg8dTj0tWHeZPK/KdCRYRd1OgXXanKhZrWtDNiHMZNKR8lgSdyaa63XR9gtw7fATA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8704
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

On Wed, Aug 19, 2026 at 07:20:30PM +0530, Aravind Iddamsetty wrote:
> 
> On 18-08-2026 18:25, Rodrigo Vivi wrote:
> > On Tue, Aug 18, 2026 at 09:08:46AM +0000, Upadhyay, Tejas wrote:
> >>
> >>> -----Original Message-----
> >>> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> >>> Sent: 18 August 2026 01:01
> >>> To: Wajdeczko, Michal <michal.wajdeczko@intel.com>
> >>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> >>> xe@lists.freedesktop.org; Thomas Hellström
> >>> <thomas.hellstrom@linux.intel.com>; Ghimiray, Himal Prasad
> >>> <himal.prasad.ghimiray@intel.com>
> >>> Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
> >>> pages
> >>>
> >>> On Mon, Aug 17, 2026 at 07:09:46PM +0200, Michal Wajdeczko wrote:
> >>>>
> >>>> On 8/17/2026 6:06 PM, Rodrigo Vivi wrote:
> >>>>> On Mon, Aug 17, 2026 at 02:58:31PM +0000, Upadhyay, Tejas wrote:
> >>>>>>
> >>>>>>> -----Original Message-----
> >>>>>>> From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
> >>>>>>> Sent: 17 August 2026 16:57
> >>>>>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> >>>>>>> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> >>>>>>> Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >>>>>>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> >>>>>>> Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad
> >>>>>>> gpu vram pages
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 8/17/2026 8:51 AM, Tejas Upadhyay wrote:
> >>>>>>>> Include a sysfs interface designed to expose information about
> >>>>>>>> bad VRAM pages — those identified as having hardware faults
> >>>>>>>> (e.g., ECC errors). This interface allows userspace tools and
> >>>>>>>> administrators to monitor the health of the GPU's local memory
> >>>>>>>> and track the status of page retirement. Details on bad gpu vram
> >>>>>>>> pages can be found under
> >>> /sys/bus/pci/devices/<bdf>/vram_bad_pages.
> >>>>>>> since those new files are xe driver specific, shouldn't we refer
> >>>>>>> to them using
> >>>>>>>
> >>>>>>> 	/sys/bus/pci/drivers/xe/<bdf>/vram...
> >>>>>>>
> >>>>>>>> The format is: pfn : gpu_page_size : flags
> >>>>>>> kernel documentation [1] says
> >>>>>>>
> >>>>>>> 	"Mixing types, expressing multiple lines of data, and doing
> >>>>>>> 	fancy formatting of data is heavily frowned upon"
> >>>>>>>
> >>>>>>> [1] https://docs.kernel.org/filesystems/sysfs.html#attributes
> >>>>>>>
> >>>>>>> so to follow the guidelines maybe we expose the separate files:
> >>>>>>>
> >>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size		u64
> >>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count	u64
> >>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved	u64[]
> >>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending	u64[]
> >>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_failed	u64[]
> >>>>>>>
> >>>>>>> or
> >>>>>>>
> >>>>>>> /sys/bus/pci/drivers/xe/<bdf>
> >>>>>>> |
> >>>>>>> +-- vram/
> >>>>>>>     +-- page_size	u64
> >>>>>>>     +-- bad_pages/
> >>>>>>>         +-- count	u64
> >>>>>>>         +-- reserved	u64[]
> >>>>>>>         +-- pending	u64[]
> >>>>>>>         +-- failed	u64[]
> >>>>>>>
> >>>>>>> then
> >>>>>>>
> >>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size:0x1000
> >>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count:5
> >>>>>>>
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved:0x0000000000
> >>>>>>> 00
> >>>>>>> 0000
> >>>>>>>
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> >>>>>>> 34
> >>>>>>> 000
> >>>>>>>
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> >>>>>>> 35
> >>>>>>> 000
> >>>>>>>
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> >>>>>>> 36
> >>>>>>> 000
> >>>>>>>
> >>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
> >>>>>>> 37
> >>>>>>> 000
> >>>>>> Thanks for comment, this is documented format by design doc. Sysman
> >>> also depending on this format. So I don’t see this can be done without design
> >>> being changed for everyone.
> >>>>> Internal design docs don't superseed upstream documentation.
> >>>>> It is the other way around.
> >>>>>
> >>>>> But also, the files will be there one way or another. Both paths are
> >>>>> valid, so I don't believe that change in here force changes in the
> >>>>> userspace. Although, yes consistency is good...
> >>>>>
> >>>>> That said, I don't have a strong feeling for one way or the other.
> >>>>>
> >>>>> Since we are adding to the device level anyway, I believe it should
> >>>>> be okay. But Michal, do you know any doc or any precedence that kind
> >>>>> of force us to go the other way?
> >>>> hmm, are we talking here about the attribute format or folder layout?
> >>>>
> >>>> if about the latter, no strong feeling either ("files will be there
> >>>> one way or another")
> >>>>
> >>>> but if about the former, then the same documentation [1] earlier says:
> >>>>
> >>>> 	"Attributes should be ASCII text files, preferably with only
> >>>> 	"one value per file. It is noted that it may not be efficient
> >>>> 	"to contain only one value per file, so it is socially acceptable
> >>>> 	"to express an array of values of the same type.
> >>>>
> >>>> and my proposal with separate files meets that expectations (there
> >>>> will be either single value in the file or array of values of the same
> >>>> type), opposed to original idea of array of offset:page_size:flag
> >>>> tuples
> >>> doh! I'm sorry... my comment was purely driven by the other sentence above:
> >>> "since those new files are xe driver specific, shouldn't we refer to them using"
> >>>
> >>> But now I looked at the content o the patch itself. This patch as is is a BIG NO!
> >>> It is against the sysfs rules. Period. Internal spec and other components need
> >>> to adjust.
> >>>
> >>> Also please do not repeat the same PVC mistakes with tenths of lingering sysfs
> >>> entries. Organize this per directory as Michal told.
> >>>
> >>> Another thing, make a design that is future ready, use 'vram0/' as the name of
> >>> the directory with vram0 stuff. Like we have freq0/ for instance.
> >>>
> >>> Perhaps even
> >>>
> >>> +-- vram0/
> >>>   +-- pages/
> >>>      +-- size u64
> >>>      +-- bad_pages/
> >>>          +-- count u64
> >>>          +-- reserved      u64[]
> >>>          +-- pending       u64[]
> >>>          +-- failed        u64[]
> >> Currently information shown under vram_bad_pages(looks similar to what other competitor's  bad pages info shows), actual gives data which consumer can extract directly meaningful info out of it. With above approach, consumer need to make one, which we need to discuss with other folks. Lets discuss in a group.
> > 2 wrongs don't make 1 right!
> >
> > If you don't believe in the reviewers check the documentation yourself:
> >
> > https://www.kernel.org/doc/html/latest/filesystems/sysfs.html
> >
> > "Mixing types, expressing multiple lines of data, and doing fancy formatting
> > of data is heavily frowned upon. Doing these things may get you publicly
> > humiliated and your code rewritten without notice."
> 
> Is my understanding correct that the PAGE_SIZE limit and the "one value
> per file" guidance apply to regular attributes only, and that a
> bin_attribute is the sanctioned mechanism for streaming output larger
> than one page (via the off/count arguments)?

my comments were based on this below:

               |>>>>>>>> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
               |>>>>>>>>   max_pages : 10000
               |>>>>>>>>   0x0000000000000000 : 0x0000000000001000 : R
               |>>>>>>>>   0x0000000000001234 : 0x0000000000001000 : P


But if we are talking about the /sys/bus/pci/drivers/xe/<bdf>/ flood as above, then
it is a big no from maintainership side. We are not doing that. Let's not repeat
PVC mistakes!

> 
> Thanks,
> Aravind.
> 
> 
> >
> >> Tejas
> >>> Thanks,
> >>> Rodrigo.
> >>>
> >>>>>> Tejas
> >>>>>>>> flags:
> >>>>>>>>   R: reserved, this gpu page is reserved.
> >>>>>>>>   P: pending for reserve, this gpu page is marked as bad, will be
> >>>>>>>>      reserved in next window of page_reserve.
> >>>>>>>>   F: unable to reserve, this gpu page can't be reserved due to some
> >>>>>>>>      reasons.
> >>>>>>>>
> >>>>>>>> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
> >>>>>>>>   max_pages : 10000
> >>>>>>>>   0x0000000000000000 : 0x0000000000001000 : R
> >>>>>>>>   0x0000000000001234 : 0x0000000000001000 : P
> >>>>>>>>
> >>>>>>>> The sysfs binary attribute is created under the PCI device
> >>>>>>>> kobject when the platform supports it and the configfs
> >>>>>>>> bad_page_reservation policy is enabled. Uses RCU-protected list
> >>>>>>>> traversal so reads never block normal VRAM allocation operations.
> >>>>>>>>
