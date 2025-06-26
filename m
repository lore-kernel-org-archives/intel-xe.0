Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B6CC7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 17:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AED10E2ED;
	Thu, 26 Jun 2025 17:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mv7h8Re0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE2910E2ED
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750957758; x=1782493758;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5X9R/1csiTC6aknMhff9D0cTTMTHzfBlKANYK0yqapE=;
 b=mv7h8Re0E7gsPeXWNPqExXTyqDJp+WfxXKHm+iYXAaOECR4NNuTVthVq
 RCI0LqtmLVJvvokgUJgOQBmvjBr3kfvwIdmiV0jjmGE6LdRKhIR71114R
 /Vb3aTA3kVfI4zl/g99L3c6a5YTqmLuJG6LW1ErjOzDTJzENYHbn+eAVm
 U+eOvRkrvSf+DguUgZhj/YYuPUKT4muDuDf5npKmjGAkyrtL5tvCDTS/v
 UHycaS3FZSBoEeklBVJWqj36tkNoOzbl01r7GchO7YUPJUDrgFa9wA+Wz
 P5AazHQsSEhN19qVw4NkA4GlCUcP9NETGfBSiYbiu+LZ2TJC3ndkJre1Q g==;
X-CSE-ConnectionGUID: lBh/HZqmTPebvfiMMJmGZQ==
X-CSE-MsgGUID: FG01Z9LuS7+G8WLTnHIqDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52494078"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="52494078"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:09:18 -0700
X-CSE-ConnectionGUID: 9DUHo8dZTn+oGIWWn0V1Fw==
X-CSE-MsgGUID: nGLjhBiORdWRclgKHmBejw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="183607755"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:09:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 10:09:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 10:09:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 10:09:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAYQX1FSby6YCbZCfvTX/tTLJqn6X5SNkbzjc2+SU2A4YhLjHhZCuqwZ2ujntH3roD1qzdIhuVcx0RCY5EBn9Uhl8eVkv9M3Y1UMOti5CJevbUTGnqGNarjCwqaOQP/Y3xQjp9vX2ek+XwRzH6tkEFLA7sq4t+eIgTzkXfQI9PUWJjuK2feKbq7dD9rSFQLJAtiVqY1xPMDJBnO6A8uVjBBhBWPuvpoqbZjOX0smGA2JtFur7cdmRLU2VpKv2Ers71F+74RTVV3rMHzsRYkSkJqy3zwRcbLXDmII1mxOxubOcHdzd2kPaGnjklpFhgZ2bCQDtY5cpqx4M6nHjk9uuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JM9pLztAFJeP1+fuUQl0fYbIUt7pcVnNh1P0+eqC9n8=;
 b=btrCQrCJ3bHIRtnBV8uSlUpvnkUlAoUcHrwl/inZ3ZxH0GA7gS3ruTADsHpgizIxb7QpHCYGdB+rSNlK+n36h4qLsTvtNQ3JvPOpwdjrqC9kwpcfhyN6FEK9m7QC9VdS4xmfUF9YuqYTnVYkVAXJQ0fD732ZM7jz9V+H9SOJ1r0ONIW7gC7kRHRs/blUasM0SLQ7xYeWPNX+ItUayfdVGEqip+qVsVwHCczeBVXmHgB59LomCH2GJ5nv/JhZMQUswIjed+vp9dPu+NZ1at5VTJNbfkjjz0FmI48qQvAyq1iMV4mFvQpVgHYTvJnONjNtc2wn9claoPNEZlYe8YBhcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB6222.namprd11.prod.outlook.com (2603:10b6:8:99::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.17; Thu, 26 Jun 2025 17:09:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 17:09:14 +0000
Message-ID: <fbca33ae-0414-4648-873b-e249ad45de45@intel.com>
Date: Thu, 26 Jun 2025 22:39:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <jonathan.cavitt@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <jani.nikula@intel.com>
References: <20250626131805.3977408-1-soham.purkait@intel.com>
 <20250626131805.3977408-3-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250626131805.3977408-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::31) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 415610a3-0c23-4fec-7e68-08ddb4d42d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnp5ekY4YzRaSWpQZHUxWGxZNUllSE1RdmttMXNCY01QNHp6RWJoK2x4c01Q?=
 =?utf-8?B?dlZjeGUvcldzSDBZU0NUQzZlK2F0OWgzeCtTZGUraGhnM0phOUFmSEgveElG?=
 =?utf-8?B?OE52OFc1UFljMEh1bnRLUlVVZnZabXRIVlp1RmkvZ2pTN3NzRnNndnptYjdq?=
 =?utf-8?B?a2tKV3lzT2p4NnFUclg0T0lHV1BoT21ldmlpa0pvYm1qTzJMNVM3aW9KY0ZN?=
 =?utf-8?B?K3BRZnA3SmIycUlMRWZhVmR3Uit4OW1wczI4K0E5L0w1MFc0TjVteSsrZWhr?=
 =?utf-8?B?di9mckVMRG5VdThuUWlEK1l6b2NpbTdZWS8wR0pOa0RhRnRpcXNWUFNhZmJj?=
 =?utf-8?B?Y3RnVk5EQnNxUFlscklRLytuSGRtNEtIQnZ1VnlxVXFqUnZtbmxLVHNSSHVR?=
 =?utf-8?B?ZGx5bjBnViszeHNNLzZFOFl2UzRHZ1hITGZkZldxUFU5NzFjNUw5MGxYMWxl?=
 =?utf-8?B?WnNONmFUOFRpay84cWNpMjVqWmIzdjUwZGUyY25TeDUrLzFCVU5OK2hIRzdE?=
 =?utf-8?B?bXJ3Zzh5dW9nZ2JUNm1lN2xvVFFaNjNOemY0TTRmNnVIUmFUUVFiaXBIZU9K?=
 =?utf-8?B?dUJhWSs4QkUwY1NrM3JXVXR2ZkZIbHg1WDExL0lOK3VVdm82TGJIcjUwNXlS?=
 =?utf-8?B?YUpXZkZxQ2tGL2E4YWVhKzJKeGNIaDdoaVkwTHFzRElHd1o2bG9PQ0RvUHpC?=
 =?utf-8?B?MzF3UzZLN0xBUVFBbXFiV2taWDFqdXkwUVMrVHU1cTdVZ0d4TG9qRlZLNTFZ?=
 =?utf-8?B?SU5IODIyV1BYbEM0b2hydVhtMStXTm5ERDJ0S1grdkRTOXdKcHJPOXIzbTdl?=
 =?utf-8?B?OWFSeHdWTy9POGVjWDd0Q0ZROGVUOVJMQkxKSU85REpwRVZYSFRoN0VZdnJU?=
 =?utf-8?B?anB2Umg1aHF0N0VNRkpvOGZTd2VZZzhwWWJMVUIvNE9lSUVpcTlxZFlYdHZQ?=
 =?utf-8?B?WTlXaXE3QTN2dU0wcURLcENHWVNtOFBzNVh6ZHl0eVZuMUxWU25xMlZPdzFn?=
 =?utf-8?B?SVFVaW1kRXphbTBqRmlIYUZVVUZiNmFUeERlYkFXS3NjVk5CQ2dRWEtCNDgv?=
 =?utf-8?B?VFdSMHFJZmtYbUc1TTN3cDdpS1g0TXd5NDh6bEYrUDdFdVlhL3ZsQ0R2dm5R?=
 =?utf-8?B?YlFyczJ6VjBQTzJIbTI4TDliZUhPWVFnUkNSdnNWYis4SVZzWUFOQk9vNzhz?=
 =?utf-8?B?b2ozTWZiVEVFYzl1VnFDMlV2RUc1VjB5Ukw1bTRKSHdBU1YwR2dsSG8xQVp4?=
 =?utf-8?B?TUxSdUF0ejYzNEI4Zjd3eHkzVGpZbndmUVU3NU1COWY4cURPYXdudkNZQzd6?=
 =?utf-8?B?czhxeitONzFhNGQzZUkvdUpNZnN0Z0JPNU1uNTAwVDVrcGJRaEZIQnVGK1BT?=
 =?utf-8?B?N1ZNbEp6K2l6MG1naUJLQzJyS0xyVmJUUHlxMGxKbEorOVVaMTVjL2VsRFdK?=
 =?utf-8?B?dk4wcVlldFFwb3lKVzNDSzV2SXI3bFJ5U2ZpUzZYZFJmOTNXUnJORU1wTHVx?=
 =?utf-8?B?b2MwN0tINkpZOWNhSFlORUozNlNLLzJIR1hFcFl5TEZlRmExSlFzZmo4YlVh?=
 =?utf-8?B?S0dveTh4NDBvck5PVWM1U25rTFE0cmdpTnNpeWtEWG50ZVJZcElZc0lTMUJU?=
 =?utf-8?B?ZUZXUkJuM0owTnJ0MHp3b0d3a0tlaVJwak02Mkltbmptc2hWVFQzY2RPdncv?=
 =?utf-8?B?SEVHOFdPZlo3SEloREFveTZ2MDVDSEdta1htSElKMUcwdHZ0Z2pMVFozcllF?=
 =?utf-8?B?aFFlcmhvT1E2cFJ3dXNvbFAyekNrd2srRk1tdVA1d2Y2MGxWWS9mU2Vxc1Zm?=
 =?utf-8?B?YkZzSHdscHBLVjByVWVndUxmMHpxUmNGR0NiSzF0YTdpWlRPaHpUUk4vOUIx?=
 =?utf-8?B?WEFCK0VNRHFyNXBVQk1mWTZzUVQ4ZG5WNERZQVRuZENsSFBCWTBGWndxSk5u?=
 =?utf-8?Q?QYpmDvJKvYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlRKR3d5Q2xZM1Q1RTlJc1owWUNQWjFaNHQ4QUl6azF6MjMxdERDajZEMUxW?=
 =?utf-8?B?ZkIweUwrRlAza1VNa0FvNmxzK29HOHRWN1V1WGdVTzZLYWMxYTF3T2dzbnVx?=
 =?utf-8?B?L3gwcXpEYlVTK2h0N05zcEwrNjhVazNhY0xQVUdKSkxlcHRpOXliOWpQZkM5?=
 =?utf-8?B?dGhJN3YreTNvcE9IM1kzSWhPTndIcjBPUkY5dTRkSFJkU2U0RG9oV3JCaEtY?=
 =?utf-8?B?bUFZZ0xNTmdKTFo2dHNncVZCZ040UlBjZDJORUduanc3bEt3UHQ3TkM4b3B2?=
 =?utf-8?B?QlNCQWNOZEtNWVNMVXNDeUxnUnVqSmg1dHpPbmtiNEJUTnVGVXFNYVd5Nzhh?=
 =?utf-8?B?c1dyMGtScDU5LzliRFpsWG1NUWZyM1FTdmZDVFl5WG01RnNOckFFdms1Snho?=
 =?utf-8?B?MVdQVEEyTTVRTWVRRkVKdGFpcXhoeG9KNGNuNXphT3JBY1g5aE9ueUtuTERu?=
 =?utf-8?B?aUxsL0hHZzlycFVRNTA1Y1Brcjg0eXBsVUFreFFnV2FNMTB3dURjYmhlZVpV?=
 =?utf-8?B?d05sMGFtZlEvbTg0QXNxQ1RrZzJBNmdNYVF6aENXZTBBcDIybU5KdEgzcDZB?=
 =?utf-8?B?UzNXREEvYnFFTldqb0hLUDBiMmZ5MnJOMy93Uk1EQ3pyMStSRGhlNjR2UDQ4?=
 =?utf-8?B?ZGhtMHp1Uzcvc0dNWVFjUEZYT3pMVVFzM1psS0ZaQ01FNGtjanFBTmw1SEgr?=
 =?utf-8?B?UXhxUThTbzVzMTdHcWttRVNZZXgzSEFNbCtmV0JXSStML0hDZFNRUUwzWDlN?=
 =?utf-8?B?RTBscEJPNVdCeW9YWkduZmhkZUQxQVBZcmFCQkxySjJZYkxZWGVUUDVmSURK?=
 =?utf-8?B?M1JDV2c2TWpvWmRzSDRyelZGM1laYkFhakNYTUVuMng3T2FSOEdJeDRadDFy?=
 =?utf-8?B?b3FSVGpBVC9jS0toVmZLUTJLNTkvMkxKZTZ0THFXNm9ab0c5RHJIcEVmYVk5?=
 =?utf-8?B?ZFRzQzVsUkJ1czFQRVVCcnJhaXpiaWw5Z2Jsem9kdEpybTdLOWRuQUJpNko1?=
 =?utf-8?B?QWIyQTFuT2UvN2lMZmNZY2s0L0dQSndCUVVMM0ZqV1NSbG5LeWhpSXpZTmh2?=
 =?utf-8?B?M3dQKzg3QlZTL3F4cFVpQjVMNmtUSUsyZFpJYkcrWmZCVFhONWZVMmEyUkxs?=
 =?utf-8?B?UEJWSCtZRVNaSnJlUHlJZ2ZqM3JIWjNtWWo4em5DN2R2VzVxTEFneDhkWngr?=
 =?utf-8?B?alJ4WE5tb0VTeWVtNU1qMTRCaEVhbVVDUHkrbWNCbjVidkhxQUF3Ump6Y2xm?=
 =?utf-8?B?KzhDeERUMVBDbDBhTExwVm85em5iVE4xbGphUSt6dW1FWkF6cElyc1VlOVBs?=
 =?utf-8?B?aWRDMHdpejlJWUNKMktock4zdU5ObGJhSDg0VGdjUm9xSWJDd3VzZUZUQUNw?=
 =?utf-8?B?WlBuY0N5dEdzYkhwaTlETkhRZFpmdU1nTEs4U0hyaVVsR0d5Mmk5bDVpa2N6?=
 =?utf-8?B?TjArZk4zdWxpYkcyUTBGdDBFWGViTWVEUGEvUVp6Ym5PMnZ3dHNxM1k2dndL?=
 =?utf-8?B?TXMxK3dzdjZpYldKWHJDWUp2N01HaWVMWUUxVzFQQk1hVjJ6TlNSdWdoQzN2?=
 =?utf-8?B?SmxvbzJLclZzalRDYmcrMWxNazE5Y2RZcEJIYkd3cHlQWUl0WjNLUDh3QTFz?=
 =?utf-8?B?L0pHTVVRd1lJb1M2Q01NRHUzcmkvdkpkcEhGR05ia2FKY2l5MkRVdTVmaW1r?=
 =?utf-8?B?TkdpRFFqMWtlYkYzZVJXU3BNcTAwL24yVmFhY3BjT05FOW1BeWQ4SktSc0I0?=
 =?utf-8?B?WHBRaFg1ZnBuWGFFV21XcThBUHFsdkJ6VTVsUmdtWXdBRjdrNzNTcWZQeXNV?=
 =?utf-8?B?SDVnYkNWSElBZ0diU3FzeVc0bi85aVhPcW96TnNKa2U2STNLZmdWa09Dci9O?=
 =?utf-8?B?OUR3U2tjL0RpcmJUS2Y4Ulo5aUlnYmYxYXozcmtCeVBNeVlFUVpzMjErbmZo?=
 =?utf-8?B?T3FWc3o4YmdndUwxU08yaDdXcDdRZkVsYjBYdk0vc3RUa1JadlJJYWVyOTV0?=
 =?utf-8?B?KzBlQzNlcDhTc0RNbW85MkJDcWJXMUNPcGExUFlXTVpTS3lLajdsR3dvT3FM?=
 =?utf-8?B?OGhYTk1ldzQvRjRQMktzdnRWcHM0M1JrNDVPMnozbWxXV3lPSDVjcGJmZGM0?=
 =?utf-8?Q?iuum6ImWaEhC6kf5Dl4NvD8wR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 415610a3-0c23-4fec-7e68-08ddb4d42d64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 17:09:14.5381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBAx+4dDNS5ZeDDt0eWxUcmODvx/EWvqJbMhGxxwLWjpXylTDhsMs9PiVIJ3Y/WioJHs5lMwFeSIgiLmM1lpCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6222
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

Hi Soham

On 6/26/2025 6:48 PM, Soham Purkait wrote:
> Add debug nodes, "dgfx_pkg_residencies" for G-states (G2, G6, G8, G10,
> ModS) and "dgfx_pcie_link_residencies" for PCIe link states(L0, L1, L1.2)
> residency counters.
> 
> v1:
>   - Expose all G-State residency counter values under
>     dgfx_pkg_residencies. (Anshuman)
>   - Include runtime_get/put. (Riana)
> v2:
>   - Move "dgfx_pkg_residencies" from "gtidle". (Anshuman)
> v3:
>   - Include debugfs node "dgfx_pcie_link_residencies" for pcie link
>     residency counter values.  (Anshuman)
> v4:
>   - Include check for BMG for and add helper function for repetitive
>     code. (Riana)
>   - Use "drm_debugfs_create_files" to create debugfs. (Karthik)
> v5:
>   - Reorder commits to reflect the correct dependency hierarchy. (Jonathan)
>   - Simplify commit message and rectify register offsets. (Karthik)
>   - Error handling and return before printing. (Riana)
>   v6:
>   - Remove check for IS_DGFX() as BMG is discrete. (Karthik)
>   
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..3f276d85c2ba 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>   
>   #include <drm/drm_debugfs.h>
>   
> +#include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> +#include "xe_vsec.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -30,6 +33,23 @@
>   
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   
> +static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> +				   u32 offset, char *name, struct drm_printer *p)
> +{
> +	u64 residency = 0;
> +	int ret;
> +
> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&residency, offset, sizeof(residency));
> +	if (ret != sizeof(residency)) {
> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
> +		return;
> +	}
> +
> +	drm_printf(p, "%s : %llu\n", name, residency);
> +}
> +
>   static struct xe_device *node_to_xe(struct drm_info_node *node)
>   {
>   	return to_xe_device(node->minor->dev);
> @@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);

you could use a for loop and local struct to avoid repetition

struct {
        u32 offset;
        char *name;
} residencies[] = { BMG_G2_RESIDENCY_OFFSET, "Package G2", ...


Thanks,
Riana

> +
> +	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, "Package G2", &p);
> +	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, "Package G6", &p);
> +	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, "Package G8", &p);
> +	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, "Package G10", &p);
> +	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, "Package ModS", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
> +static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L0_RESIDENCY_OFFSET,
> +			       "PCIE LINK L0 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L1_RESIDENCY_OFFSET,
> +			       "PCIE LINK L1 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET,
> +			       "PCIE LINK L1.2 RESIDENCY", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
>   static const struct drm_info_list debugfs_list[] = {
>   	{"info", info, 0},
>   	{ .name = "sriov_info", .show = sriov_info, },
>   };
>   
> +static const struct drm_info_list debugfs_residencies[] = {
> +	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
> +	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
> +};
> +
>   static int forcewake_open(struct inode *inode, struct file *file)
>   {
>   	struct xe_device *xe = inode->i_private;
> @@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
>   				 ARRAY_SIZE(debugfs_list),
>   				 root, minor);
>   
> +	if (xe->info.platform == XE_BATTLEMAGE)
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);
>   

