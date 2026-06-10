Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CE2CD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 15:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59F210EA11;
	Wed, 10 Jun 2026 15:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfHH1UqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2042210EA11
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781105075; x=1812641075;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2/2MXx8hKro4LXGjVHwfF1EUqLUCfKTp3dDqTxAYVpg=;
 b=BfHH1UqPuZSwL5W7pdZgSytNFmcspsb5Do5lOffR9q5YxmzCYj6Qv5L+
 GDTiiGt7X9uU+af4qbo9YWM+sGZjBf9vhsCWx9H1g6tSh00O6iIfT9QX8
 6ZqT//dNJVbtT2vdzhTZz6b4U6BZtVMLB3N/o6nTspOza7sPZ9rl5Nday
 lzxmtTeHe/+uMNe5ijsDznm7zKnuvUpIADYJAiBzE8+Lpix6493dX08EJ
 QfXRjVqKOCvj8HcYnJgF6cQR42HCIAOnzOdohY4z2MA4nvvJhOcMOLDxl
 uFIAutYkj0m14EhkAmYNpzZH0f/Bc6qCh8NOT9vskTkXWXs02HQcStF0a w==;
X-CSE-ConnectionGUID: CcU9p9fPTGSlyeJ7SXrmWw==
X-CSE-MsgGUID: 0v/iP7z7ThG6OWnWuzA1UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92575781"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92575781"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:24:31 -0700
X-CSE-ConnectionGUID: LDB8NmrLR42EKQoxp2yjVQ==
X-CSE-MsgGUID: PGikfTnhQvKVa3Q6oEjBrA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 08:24:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:24:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 08:24:30 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.11)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 08:24:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pe7be02Fo3V7knVRN5yjPfKu0ssGTAYmhjFZmXbd6k+bvif8SZ2CG9CYmtGV+UmwoqYK1h5MLUqIv4BINMLZwpc0qccWxuLo/3m/a7RfhSrk2WizUkj/1uFxVBsCXup08kXhJELkkoyby8vXgdD7bzNqwaAFtY3hgvyrnw49VINtNKDXUa8Gnu0fedV1piuP5urHTHrcALYVrfTRH/vwKRPIEyoXm0u50/SjiS7zvhW40zIDXMORJuVAPHMixoOudUCy9n0GuJdhQQDWPRZqgaTkPvl8lxa02p3+0Ddpke97RxadD7FQUtzxwKSbsbdJ6AhNu1DMdLcDyV+bq9e/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYm2iDxJiWefRCgzD0V15A32QA7mDirBSd1bucrz6RI=;
 b=J3K3RD4nhyHTbA9E8WY4KDsY6EH4WW2Tk6EuLx3MThqwNxw4+ATopt6Kw8lrVEF1GRra8N+fWgo8VUa7mSz1ZhCUvpdOYGgy8YemWFEUARD6lS9/PGIQ2SKFlGKXXPH132S0rkbH43NkChHyHE+Q/d/bzvTg6xgPkYKNMX6/wAhULkNIuVMpxs+P0pZyCBZFRjXG1XrbamTLiun3C7gwb+XAWD6Xi1bXhgTV4XlIj9yVe9idPEmClDOeR8Vg4Ag95tgboV038meKYHyp66Zfi6ZUAoD3pg6nbG4DnYN0PCuqawLSzd4gohtkhuWoajU5aaNKZ8SRrZXf79pT/W/eYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 15:24:27 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 15:24:27 +0000
Date: Wed, 10 Jun 2026 11:24:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
Message-ID: <aimBpzGSMeI1AnCm@intel.com>
References: <20260609144412.244678-3-rodrigo.vivi@intel.com>
 <65d5dc1e-3fc8-4acb-b9ff-6ceae8750263@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65d5dc1e-3fc8-4acb-b9ff-6ceae8750263@intel.com>
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 8baadb55-29bc-46ca-2db7-08dec7045ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|6133799003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ZZ/qMipfx6416I4vfHsBNMhmzjtc7NMRJVUg/OweWfCzZkTmfPgN4k1qzcbwwwhuglEHX38cwyQf9is6ST+i3OtS9m1oNCA/H8IwlcTVYGGLbs7fi5yxrg+C3ZLXQwEXR2oBXnMfchssumVleZZHLOXDpyI3M9Fv5hYrdKjYSTMzJPhyX34s+pAUF8cZSZBHe5T6ilXrD7onsivkk9p2rGgfjUqhRqpuCpLtBuQTC9+SWxjpzZNoLPjlxbb5OUBMW08XXdo5HSOlJE6TS9873csYvrlkSY0qor0o8/gg1nn2oHJeYqArHA64vxLYCQhgAU6c8Wx+gObbuw1qpvpYZ/ReM6jMdU2mg0CcQvZ04akwyTfvvPGQch475Nk0jtiszTg3XdtOcRTVn1fcUsXGv60+Ykjxmm/x9Rr9gVsGs1O+2yRcrC6MP40jxosCiyoeAdxu+9K7PpgDWiS7kOt+7LGNsrsuPiktbHrdrwZXT48E3bepNoFJJaIUZVF1NYRbXzX2TzaXyBbH1OSXMagPL6PrAzIXHh0Ro4JdL6kF3RjtzHxbiHliKQ9AelpsPUjH/VpUNsdLpSwYqrpaVdMrvLhOfCEZVtJIwnVoo3sH+qw8SeIl9gRJ+4fZ3GgxXjXxA3mj9QHtKtm9m7+3Lbhy+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(6133799003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTRjaUlBclg1VFF3eGJBeUtwWkNoZnpqQ0dKNFdKQUUyakdjYWJNbnpHNjhh?=
 =?utf-8?B?alZubGlpYm4zdmZGSk5QOEQzVEF3WFFqMVdUL3pKZlVkekJYYkZaU2VINTg2?=
 =?utf-8?B?dmtOcldsbHdtTWx4VVpTcm80VmtRd3pFamE1YXVjcG1UajYxT3R6S2ROeVJh?=
 =?utf-8?B?ay9CQzlzUllSV0hDTVZINm5oWVVsRW9abDl6ck1SQUUwOFNVL3RGV1p2bUtr?=
 =?utf-8?B?UkxZcFkyQzR2Y09DQkhhemtLQlhHaDhrLzI1QWtNZ21tTCtla3ZUS0FCdk5F?=
 =?utf-8?B?cTZQb3VUYjg5OXJWVG5FQlVDb05VSEV0WEw4d1hkWGtaVTd4TFFKN1M0UUZU?=
 =?utf-8?B?NEMrMU43ODVFS2Z2WWhvU1BiQmd5VkRxN3kwSmpFTW0rcHlTd25yeVUxQUww?=
 =?utf-8?B?MjhTK0x4Y0ZTOTZldkhzSEpiVlBqUmpDQTl3WStpT2hZRU9wM0V0WEtTTDdU?=
 =?utf-8?B?UVd6VWhqWkdaNWJtWlpzMW5hQWxET2RtdVRaMk9mMHF6amwrcDIyTkVXMG9E?=
 =?utf-8?B?dHJuakx4WnVpNklGVzEzejRTVU42a21zZytTVG0xUDJyT2FkU0lPTU84V0Q5?=
 =?utf-8?B?ODNTaE1IekNrbGxZbyswS29xSGlMcWJ1UVowWE1PZ0N0cFo5VWJNanhRZWho?=
 =?utf-8?B?RVRaY3hqdXhpRE5zSFJCUjBSMDJxeC9IclNCMitkZ3A3ZTlIdzQyWk1TRGV0?=
 =?utf-8?B?ZGVDK3hpc01Pb09XaUVNdGV5RE0zUG5aTmlIZ0JjdE5LVCtzb2VLTDQrUTJr?=
 =?utf-8?B?ZmVWR2tsVXNnTmNQc0wrVXYyWS82cXBtTnNlK3hBUTFaQ2Z5Q1ZQYUhjcFJ0?=
 =?utf-8?B?bHlreEZNUXZXRlNNMjhuRGNtYzF1N2x1KzdlN1MzaGpaU0xQbnF0WjR6TWdN?=
 =?utf-8?B?WFpGOU1PNUxobk5xZWpWTjR5UnZVSE4vbWRIUjlNVmV6T0pKTVNZODI5SjFx?=
 =?utf-8?B?YUVMaFNEbzNmc3l6TzFUckdqMWtQL1ZoUkh2alpRbHJmYy9lcTdUQytnLzRu?=
 =?utf-8?B?RUJQVTMvSlRuNXhPS0dyQktTMGhFZnhQSjg0SEp2aFlTUWNSZW81cEN5Ujh2?=
 =?utf-8?B?aURHdGNaZE9LdG91Rnk3QkZFeDYwcXpMcTA0d1BjR2NZekRCM0FHaHZXb2lD?=
 =?utf-8?B?aSs5Mndhd1plRkc4RUttZ042N3cvenAxZFdYa3U4V25ZZEt2eUdGWklQVHFM?=
 =?utf-8?B?SVlDODc4RW5CU0JHUSttUEtJRU5sbExObTNHL0E4dC9aVkhqTFJ5TnhKN2xw?=
 =?utf-8?B?ZjgzbTgrTC9KVHRORFdDOStYeCtGZVcwb3VUdnBlRkFGekY5WmdDM1BZdjI0?=
 =?utf-8?B?eUNXK0daQXlTODFsWXZ1R0RuVW11Qkp4bGlUSUhmZEo5enVLUDFJUkV5d2ti?=
 =?utf-8?B?UUhabUNqNGhnSEZXWHdod0M0eTlBenlORXRNSjZMRnp1ZkNqZGJ5dmpUbEpa?=
 =?utf-8?B?L2VKOU1HLzdNV1NrK2xQN2tkTHpqbEZSVlhlN0E2VGE0bXBscW9IbWhBaTgy?=
 =?utf-8?B?NzZOdTJ6QTZYZ3ppTlh2akVNZnFCYmZXMGprSGYvRDdTZkt6MXd6QU1xZXkr?=
 =?utf-8?B?UXc5R1ZtWGhBWldMT094WFZsTm9wNzhkNlNhQUhVVmtYclNQZnQ1Ui9yR3JK?=
 =?utf-8?B?dUZWaU95TjJFQ1Fodjh4dldPUTNtajB6QTVDMTZTcEx5NFJ0aTA2WW9mdmI0?=
 =?utf-8?B?VkYzMTYrcmFFL3RmYzdIZHUyRjA0dHdiZ3ptWDVlRUZlKzh3Q2RyUkF0cklW?=
 =?utf-8?B?YzgrSDI4cTQzQ052ODBtV1dZeXdPdTBiMU9wYkMzM2w2RmlXUk9mb1BGZGdR?=
 =?utf-8?B?aU9kdnl5c3B5dlFNb01ucENKbVJzNGdLVktCQm1sWXQ2TGRVU3liQWF1VGFS?=
 =?utf-8?B?ZUpvNUYyQkRIVDR6WU5ZNk1PUm5qTEFnVE5TM0o0ZTd2ZkoyVHR0MVBQVzNz?=
 =?utf-8?B?dm9CZlFFWGJvbkkyV29TT0hGWWFtVXFOeE1oM0xnL1pTbEh1V2lkeVh3ekdJ?=
 =?utf-8?B?dFVHQU5GeFhJbldRZkVLdU9vTU1FM3M1VWNrMEZZbVRnRmlueExsaUlMaUlz?=
 =?utf-8?B?QmIrbE1PdWNKbUpCVDQyVHhCbnpRaUlHTFQ3ZzIxOWZwVWVqMS8xL0xkT0Z0?=
 =?utf-8?B?R1BONEF4UTJzc0RoS1g0RlR4c3ZUU3E0Y2N1M1RFRzhzSHN0ZVU0UFVPdEx6?=
 =?utf-8?B?Q1V2anZnMDc0WXNqaVl4TXhlL1hicUdhcUxldmVNRWc5WjV1bUhWa2M1TmFv?=
 =?utf-8?B?WHFnaW1KTUZ5Z1NJTDNnM1hhTUNtQmJCcDFWbXkyNC9DeTJ2MityQW1TVE11?=
 =?utf-8?B?ejNkTm50Y1ZDUXBkNEJHVkRNVUdwaDQycWlHdVFxZUtQcUZvSXAzUT09?=
X-Exchange-RoutingPolicyChecked: GTzwKFFbkxUhmEHJOy9MfctpMAWCDASlk5PZYl4nF4Dr8M2AJ/7zhUJkop8jHd1kOTzYyijrn1OyYLfzugD9NctmgTTwhbYUlFFmAfTNTniTM5u3INZI4bQanstHHAy9kvIcKfT0aCFN9FpI+ZLjUYc2tZEoMiZjT9t0XRoqfRllu+XJYfl+xEiMUM20BfVyTchltLZjTwzg0IWAPzVG18aIeDGHYf5I1KEDCSSnjI03pJvxJ3rOuSmgJqz+ILbfp/cVAGCjDHAFYoseZT5biJhG5x/WDR4SLVpKFIQsRhJ3KQYdpvSetMTQbeA9oOEhbjv0oDTG6ZlIvTSViB/fOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baadb55-29bc-46ca-2db7-08dec7045ba6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:24:26.9552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MeV88q6umhv2kueptx/Rjq8nG2HzTa+XkxqJmxHZwp3EITz2sPsLzQI4cx3F33/J05Q20q2fPkJqrVU/NvPLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
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

On Wed, Jun 10, 2026 at 03:17:04PM +0530, Yadav, Sanjay Kumar wrote:
> 
> On 09-06-2026 20:14, Rodrigo Vivi wrote:
> > Jobs that GuC never scheduled were silently errored out instead of
> > triggering a GT reset. Kernel jobs that exhaust all recovery attempts
> > should wedge the device rather than silently fail, and userspace VM bind
> > queues should stay permanently banned rather than being reset and retried.
> > 
> > The queue is banned early in the timeout handler to signal the G2H
> > scheduling-done handler so it wakes the disable-scheduling waiter; without
> > it the waiter sleeps the full 5s timeout. For not started works the ban is
> > cleared before rearming so that guc_exec_queue_start() can resubmit jobs
> > after the GT reset — a banned queue would block resubmission and cause an
> > infinite TDR loop.
> > 
> > v2: (Himal) Do it for any queue type, not just kernel/migration
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> > Assisted-by: GitHub-Copilot:claude-opus-4.8
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 41 ++++++++++++++++++++----------
> >   1 file changed, 27 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 4b247a3019d2..5c40eee41103 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
> >   	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> >   }
> > +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> > +{
> > +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> > +}
> > +
> >   static bool exec_queue_suspended(struct xe_exec_queue *q)
> >   {
> >   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> > @@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> >   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> >   			   q->guc->id);
> > -		return xe_sched_invalidate_job(job, 2);
> > +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> > +		return true;
> >   	}
> >   	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> > @@ -1460,6 +1466,12 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> >   			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> >   }
> > +/* Unstarted jobs (GuC scheduling failure) and kernel queues recover via GT reset */
> > +static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job)
> > +{
> > +	return !xe_sched_job_started(job) || (q->flags & EXEC_QUEUE_FLAG_KERNEL);
> > +}
> > +
> 1. With IGT reproducer:
> Works correctly, no infinite GT reset loop. Kernel queue
> recovery behaves as expected.
> 
> 2. also tried this threads-hang-userptr-rebind-err [since failing in CI]
> IGT hangs and the GT reset("trying reset") is stuck in an
> infinite loop for non-kernel (userspace, GUC ID != 0)
> queues.
> 
> also any userspace job[threads-hang*] that GuC never
> scheduled (unstarted) hits timeout_needs_gt_reset(),
> returns true enters the GT reset + rearm --> Just ban the
> queue and error out with -ETIME for Userspace jobs?
> 
> OR GT reset for only for kernel job failure? -->Please
> ignore if am missing something

Great catch! Sashiko also agrees with you:

https://sashiko.dev/#/patchset/20260609144412.244678-3-rodrigo.vivi%40intel.com

I prepared a v3 that now passes this case and will likely make sashiko happy again...

> 
> -Sanjay
> 
> >   static enum drm_gpu_sched_stat
> >   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   {
> > @@ -1608,19 +1620,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> >   			       q->guc->id, q->flags);
> > -	/*
> > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -	 * somethings has gone wrong and the GT needs a reset
> > -	 */
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -		   "Kernel-submitted job timed out\n");
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > -		   "VM job timed out on non-killed execqueue\n");
> > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > -		if (!xe_sched_invalidate_job(job, 2)) {
> > -			xe_gt_reset_async(q->gt);
> > -			goto rearm;
> > +	if (!wedged) {
> > +		if (timeout_needs_gt_reset(q, job)) {
> > +			/* Retry after a GT reset; wedge a kernel queue once karma is exhausted */
> > +			if (!xe_sched_invalidate_job(job, 2)) {
> > +				clear_exec_queue_banned(q);
> > +				xe_gt_reset_async(q->gt);
> > +				goto rearm;
> > +			}
> > +			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> > +				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> > +				xe_device_declare_wedged(gt_to_xe(q->gt));
> > +			}
> > +		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
> > +			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
> >   		}
> >   	}
