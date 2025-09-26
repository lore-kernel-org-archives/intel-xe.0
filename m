Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CDDCAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 14:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DCA10EA73;
	Fri, 26 Sep 2025 14:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1YQW0Gb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C23610EA73
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758897745; x=1790433745;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=j3blKroHkaUVU29l5/1Ff/lRtyDWr4ID9CYh8zsbFcA=;
 b=m1YQW0GbpaWLe+0DsHWMtMAbF4fAbdo09TPExk2Dpli7Jx7GzdAGrXoW
 dH70oW8E/ruB7QCXAr8fA/d/w5hFX2olzJGod0ZZjlE3ssNheQ6zMfyDG
 z49pZOnXU5LlA/PLXzzmibnSuMO1/uYB931pfdK3xSE8gF8ARWipHMH0Y
 geMQWlOVAeLgZvrNik2cGdZWC+6TZn6D/Gsl9khnVcP5tTwWvnWdXHJTd
 /mB/HKxFXs+vaglNfWhfPFi44JRnHhjn8SdBe8zlT0+zeGj0Zq+5REn2V
 4P3Og087VPrzoVQ2fTRQnZgpvZzBXdy5f1pAP9ubIjH969dk4FKUn11R5 w==;
X-CSE-ConnectionGUID: bO44gDEpRM+Jx70oc7MKzg==
X-CSE-MsgGUID: /A+DNIKNRrWEmEZAY8mGug==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="78873435"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="78873435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:42:24 -0700
X-CSE-ConnectionGUID: dmq/fB9iR5G2+UfWjWsquQ==
X-CSE-MsgGUID: wRO0OEIHT9mKPjwQ/Wp3LA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 07:42:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:42:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 07:42:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 07:42:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHnbSDopjmEA7CmHZ03SuGEa5Mt6MYdJzhZOsHL6TmAcrw47/bCwKJkhQaeowCREf7H8JEUUiyTLyc4I2KAOCsfXWwxkz5oj5UdAkAtpkmQddLK7TVlw4xLQPCchXMMRV+SSQRxk2lg/aJ5mrlLUy+BaItFxdUSIk3VeqwPktskTiL6I5aGGhiX9n2mHPcUCTghuTzBw82mknJ1SvSpgR+tfLxhuMyXELRU3qyZqk6iCHSVLWRvd/DBp/+kRsGU+1eLgjMAWkpXz+k0Gfsf1IazxZ1wqhlwNyj1v6gY3w29I1lyjGPxs0HwxM+N00AEqx8bAwxDJOjZ9bg5We0IvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQliCa6KN9FlyEUYVojtHAtnibGQlJ5GTWba/B44hbQ=;
 b=MtvdOO187rO4AanP8AVpImgB/cG9EmGyJLxfAnYHP0X5FVphE/28EGW8WQgKLRAXGnf6tXjngr5Iu0UOkyNvDmgwU7Fi7wWs6AUBW888w3y7ns8QwqK3BU3UpZnIu/Z+9fxqGzYx3ZiTdbSkTvnhPdVP6VnLmlQTmOQnjVz1NZ/f3/PN2ZlmPTZxNPDJc3x1DfgpMrMnfd9q0TQ7q7w8Q8Hh/9sVb4fkIY1pzkoO/CCM/eYDeMQDnhRA3cCuE16VlAz6SFy0wetnCwyWSclpGHhaAu73iTjLKy7qybxUx2qAtSQdBbg2PmfT9bvGs76ixSwKAnzB70Q0HyBdZB+f4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8411.namprd11.prod.outlook.com (2603:10b6:303:23c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 14:42:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 14:42:21 +0000
Date: Fri, 26 Sep 2025 09:42:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 3/6] drm/xe/pf: Populate SR-IOV debugfs tree with tiles
Message-ID: <jtqjnyukr3lnekqm2hdneip7ehsgug6nd5wnlpwq7ynbkk3nu3@wv5lsbqly5qm>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
 <20250925220425.196860-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925220425.196860-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: a100b239-5209-44ce-4228-08ddfd0ae638
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ym91QjVYOGtZbXU3bHdkZWtreHUyNWFLczlGK0JpU2o4d2lPL1F5VktsU29m?=
 =?utf-8?B?eG96SDRZeFlyUTVmZnRrQ0MxaVRIU3poWi9COFJ2NTBlQzBBazZyU1pxSUdX?=
 =?utf-8?B?RFJhMnFkMHFiQzNudVV2a1ZyZ2xJOVlNVjBYMXVYbVpza2NFRXFkTG1UUEFT?=
 =?utf-8?B?dDY5d1FyVGJyOWtFWk92c25aQk1FcFFBN2tRWGc3LzN5NGljOGhoRkswUXJY?=
 =?utf-8?B?U3ZQcGNBRU5xbkw3LzY2Sk90ZGtEYzlvOEVIUjIyQ01FendJbCtrWDdzRU5w?=
 =?utf-8?B?aTcyQ2xqb21CYXY1NjVBTUdmL3VjSUJsZVR1eXMzRFR5cHVMSTRRd0Q4MVdo?=
 =?utf-8?B?Qk12U0kxeUNBcWxJTlNYTFptU0VDckRJTGMySXI4ZFBuVUh2UGRZcEFRR0hI?=
 =?utf-8?B?NjZHQzcvWGxoNlNHcThaNE9mWjlJMmV2WHkyZTdVaXJDejFpMTZ4RkZ6M2U5?=
 =?utf-8?B?Sk1IYStPa0gxZG1YbWdscnVYQm9KSW9lSy9NTWpERnRCVjBiVUR0Z2gwNkF1?=
 =?utf-8?B?cVBBTjFyUmtmYlg3MlBSVVlkamlBMkZBWVF5a1JPUWJDZHEyQ0dxN1kvVnY1?=
 =?utf-8?B?K1NBMCtUaG9Xc2NMb0h3N21xQXJyQWYwRVJsNjMxT05UOU5yYkljQTVNMXNE?=
 =?utf-8?B?Y213QS9uRVgxNEd5Y2NnaGpJMElveVNvd1lEQzA1aHUzNXRMWWFzZXFKWWVh?=
 =?utf-8?B?YStTSEVaTXZrREJuMHRmbGNtV3hHL1JaMkFMa3YwQ015YWtNcEI2dWVkVW54?=
 =?utf-8?B?RDJZT2R5akVlR0ExSGdidGlhRlprVnZpTEdaZkhOMTRQSGU3T056T0kyMHR5?=
 =?utf-8?B?cGY3WnpJWCtMbHJlQXNkTmFOVXpFRUFsaHJqNmpVWEdWZEhpQ0tJV0taaGFP?=
 =?utf-8?B?ZGNSdUREbkw3WHg1N1lDSFMzbWF1VGdJdGlXWVFRN3huOHkwRlhzUkU5OFE3?=
 =?utf-8?B?aGJmdm5RTlNBU1VvdjZCdjl6T21vOXpvMHhEZElBRVRuZHgvQm5EYmY5dHRS?=
 =?utf-8?B?VzhNYU91KzAvU21odDhjK1U3M25vTHdDVDRPWjZEemordldXY3dRb3NXUjhz?=
 =?utf-8?B?MmZrdW9WNlA3L0ROM2pwY29kRXFjTUxGTmJQdFNWMnVwTDNsZURuSXVpZkhK?=
 =?utf-8?B?OHNJbEJQa3lpeWdrZGQ0aXhxRHpUTHk4d3IwSVU0eC9DKy9HVmdqeFZJT3VY?=
 =?utf-8?B?d3lkRmN0dE96TFdOaENheGN3NVFQSlZwaDZBUVFNbHlvaGxVTFhDR0pSRytK?=
 =?utf-8?B?VDhuWW0zL3FPSCszZTJLSnpmaHpzTEV5ZzNTUjVnYkRQNjZsK09wR2JoUlBB?=
 =?utf-8?B?Q0FkWW8rZ04ydXJqbHdsQ0tlSFRhcFpraHhEQW1YcnFmWGJlVVQ5ZG9wMm5j?=
 =?utf-8?B?ZzIrZklIbzZDTGxaZUZXUW9rYi9hamYxUjU4VGpacDRhaVJ1YkorT2hWODB1?=
 =?utf-8?B?cjlicXdQR3VTSXZseGo4N3dnc21rU0Q5OVhTbTJoVnJvLzFoNWZmSmphRW8w?=
 =?utf-8?B?RllVMVA0dHRnRmpRMVpqN3l2blhOb2lZNTk5L09mMzI0bkIvKytwNzkvNnJl?=
 =?utf-8?B?TW01S0hWL2JMek91SWFMby9YMkI2VUhSbHpDSlIwTXMyWFowdGtnYlIvL1pk?=
 =?utf-8?B?bURGb3k0eGMveWhMK0FOenEvLzJ5MU4zSXhYSitaVjFxc2JHZ0JPZDAzWm1R?=
 =?utf-8?B?T214Q0V5YTJyRUU3ejFYZEZUR05YV3NjNElFM0d4VjVaQ2ZzVWQ0TFA1L0tM?=
 =?utf-8?B?VjJTeXE3SXJiOTh1WWFuMFQzb3p3NkVLdU1ZMVpFZlV1TjFKVEYxaFpRN1ZN?=
 =?utf-8?B?Zk9EZmp4YjNkOC9sbzlaMWgyN2RMWVZ4MVBwSjJQYXlxZkhIeUg5QTVYRyto?=
 =?utf-8?B?dmtGZDk5SUxSTFp3NnBYOGV5L3k1NXNnNkpMYmdjSWlqUmpJTVo0UFlpYnR4?=
 =?utf-8?Q?2hgCWZvTq1nGTlCaEGKc3L32NqJnsH6C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzV5U0pSaHhwN2xFV2dXWURXYkE2M0RDZ3VsK3VOalBIcUxhdGo0U1cwZEdG?=
 =?utf-8?B?WSt2T3FiWElES0hkelVDVVdRZ1doNUNzdnN4TGhVMFNFQnBlMUNoc2hycHo0?=
 =?utf-8?B?S3F0Q2pleHJ0a2pZRndMaVNjeWpCaEpLTkR0enVKYWQ5Z1lJL0plMzd5RmRN?=
 =?utf-8?B?cjUwcHg0Q0NISEw2MGVMMHVmQmorRlB2RFVlNWJuSmZ1MkRwU0RtcjI5dmhr?=
 =?utf-8?B?ZlRpcnBhT0YzdVcwMGpPdVJBRVVNQ1REdDNQcyt5aTFualdYeDVRRXFOMGpq?=
 =?utf-8?B?cmlQMlVxZW91bW5lb1ZMQzdYOTBzbCtGdWsvR09NQXltUmNiSWlFQUl6d3Fy?=
 =?utf-8?B?NHQzRXlrWERHQlpWd2NjZldpTWUxSUhJWHpNUEh2bS9JK1NWLzVBQWZCTjVE?=
 =?utf-8?B?OWhNL0hadFF1OUVqbVNWQWxuRlFmNWw5djgrMjd2N2tUUTJjTEJRcVFoQi81?=
 =?utf-8?B?blBTNmZ0SU9TMWVZTjNhMTlJdkZpUmRZeGhZeEVhZEFLcW5ucDNZdkpqTSsw?=
 =?utf-8?B?YUM5ZWlSdU4wcUQ0bktHMnFVZFJoM0ZObGZIN3pqenArNEJCWGVMbnZBTWVX?=
 =?utf-8?B?UzVUVUZVUlRjdkU2WGRxaVVMOTVrdDgzYmJOTkxhVEdZVlRsNVhsL0pBNHBI?=
 =?utf-8?B?NUd3WllDdkdiU1k5ejg4VmxOa3p3YSs4WFZ4RmRaa3doeGo4djEyYVJqQmxI?=
 =?utf-8?B?VU9RdFBWZHBCZC8wVVMwSERqMVlGRS93VWlXd1A4QUhVbEYzMkdMb1Z0bE5S?=
 =?utf-8?B?NkJyaG1qKzVoS3g3SmdCb3J6eTFaQnl2OEFmd09yNmQ3Qk4xVWlIdFAxVXBx?=
 =?utf-8?B?d3RzRjJhTnlDQTlOekI1OHJGbDYwSXltVVJiU1ZuVnN1VnpzdE1ScnpGWEZF?=
 =?utf-8?B?MXFmTk1DUkZOMWxvdWUwUy9zQlhHTkZ6aVAySzM5VkZybWNMNWZabGk2dHZs?=
 =?utf-8?B?VjcwR0IwU1ZzYmk2Z3hwbktsZDdvVXdadmlMNFpFSHdaRGhSVXNwNDl3MWZn?=
 =?utf-8?B?UnpJV0pPTjhVR01YaDZnbStBbmp1T1VwajArQXlYTm9oRmVRMmFkK1hzVXRa?=
 =?utf-8?B?bEV4OTZDaWVzU0xmR3IxTXF4UDc0WTlIY3Uyb2lYMnNQQjBsRTF4MGtpc3BM?=
 =?utf-8?B?aFhYNzJPN3hSZ0o5SHJHN09wZmpRSzZQVEhRbzNqK3BKaGtzbnI4VC9ybVVs?=
 =?utf-8?B?bzlpelljb28xSm4rcVhPVHk0VXd2TWRMMkJOWklheVlSc0d1NnNKOC9zc0tJ?=
 =?utf-8?B?MHByajBNWlJmTENlNnNvbFNOSWV0RGV5ckpKazd6RXJYeFNCVE9Hc2R6a1cz?=
 =?utf-8?B?UFRma3U0R0FTNDZtdU02VjhraWtMY1B0aDUvWXlkUzJTS2loUlMzVkdmdldJ?=
 =?utf-8?B?aThFVXd0NDd3K042VWlLTGN3K25SRTgrazI0bEtrd292NG8xcHB1RTl1U2V2?=
 =?utf-8?B?VVNoQUxMcjlkYWU3QzRENWdCclVCRzNFT1RMNy8yRW9FaStGU0xQbTBzTlhw?=
 =?utf-8?B?S3pwV1NndVhIbFpsVUljemJFb3hQVjdvcWloUW1EcFFqMXJBWjZQeDVsNVRt?=
 =?utf-8?B?MHJ4RVZ0TzJ1K0RWL29pTWIzTVJ5VldGZWdLVzBzblJGb1dPb1JqclVpVWJC?=
 =?utf-8?B?Z2FFVnpuZkorWDZuTEhTbzZUZTJJdU8rRjlWdCtwWTlFVUZwM24rWWp1RVFw?=
 =?utf-8?B?dEhnNERSSVlDVlFUYWxQRTRiZkZVaTRhU1R6MGE3SHY0U0JpZFErdFZJMnRP?=
 =?utf-8?B?eHoyRW1wczRsVlAyY3h3L2pFTWdvdnZINGlBQkp5SE45NEo3amhWbUtoem1L?=
 =?utf-8?B?TXc3ZmNiSGVRRTV3VmNNQWdSeUtMVmlMdXBMZXFjMEVaZGt2YU1jQmNyYWRo?=
 =?utf-8?B?TGJhbFk3M3pJMWlOOVBMa3p5WlBUTlhLd3pDZmYyejB3dUZQeURwOE0wRC90?=
 =?utf-8?B?ajdzSXRXUzU0MWJ2dVZYdE55T3h4K3pGdkJFN2FCOHIzV1BxRFNzV1lUN0w3?=
 =?utf-8?B?YjFWN0RsZTRqRjI4eFVJWmovTmlpVkdaemNxbDNMb2ZidTg5MWVLVmRtUFdR?=
 =?utf-8?B?NElJbDVza0hIb2dNT1cwcEwvUkdORG5kMlJGVWNoTzJnVWxjcWtyY0hzWHYw?=
 =?utf-8?B?RTJTbWo3VnZnOE16RGM4TU0raFNVcTV1VGdacjUzRnR5cWN5RUdWclRBOWFQ?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a100b239-5209-44ce-4228-08ddfd0ae638
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 14:42:21.2337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E42QmSQeITpXMkA0mYojQcm1QzK1wOh5y67UrgUodBR0OD5UcMdtiTehNbHMu868k/ZlaXVGqfzE8KZDkpFOBtFXM/DuFWqMV8qNZT/6ZGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8411
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

On Fri, Sep 26, 2025 at 12:04:20AM +0200, Michal Wajdeczko wrote:
>Populate new per SR-IOV function debugfs directories with next
>level directories that represent tiles. There are no files yet,
>but we will continue updating that tree in upcoming patches.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/Makefile                   |  3 +-
> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 14 +++
> drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 98 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h | 15 +++
> 4 files changed, 129 insertions(+), 1 deletion(-)
> create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
> create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 534355c23e80..00f7ce8e926d 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -175,7 +175,8 @@ xe-$(CONFIG_PCI_IOV) += \
> 	xe_pci_sriov.o \
> 	xe_sriov_pf.o \
> 	xe_sriov_pf_debugfs.o \
>-	xe_sriov_pf_service.o
>+	xe_sriov_pf_service.o \
>+	xe_tile_sriov_pf_debugfs.o
>
> # include helpers for tests even when XE is built-in
> ifdef CONFIG_DRM_XE_KUNIT_TEST
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>index b2088b6dc23f..291960c23507 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
>@@ -6,12 +6,14 @@
> #include <linux/debugfs.h>
> #include <drm/drm_debugfs.h>
>
>+#include "xe_device.h"
> #include "xe_device_types.h"
> #include "xe_sriov_pf.h"
> #include "xe_sriov_pf_debugfs.h"
> #include "xe_sriov_pf_helpers.h"
> #include "xe_sriov_pf_service.h"
> #include "xe_sriov_printk.h"
>+#include "xe_tile_sriov_pf_debugfs.h"
>
> static int simple_show(struct seq_file *m, void *data)
> {
>@@ -37,6 +39,15 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
> 	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
> }
>
>+static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
>+{
>+	struct xe_tile *tile;
>+	unsigned int id;
>+
>+	for_each_tile(tile, xe, id)
>+		xe_tile_sriov_pf_debugfs_populate(tile, dent, vfid);
>+}
>+
> static void pf_debugfs_available(struct xe_device *xe, struct dentry *dent)
> {
> 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>@@ -89,6 +100,7 @@ void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
> 	pfdent->d_inode->i_private = xe;
>
> 	pf_populate_pf(xe, pfdent);
>+	pf_populate_with_tiles(xe, pfdent, PFID);
>
> 	/*
> 	 *      /sys/kernel/debug/dri/BDF/
>@@ -103,6 +115,8 @@ void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
> 		if (IS_ERR(vfdent))
> 			return;
> 		vfdent->d_inode->i_private = (void *)(uintptr_t)VFID(n);
>+
>+		pf_populate_with_tiles(xe, vfdent, VFID(n));
> 	}
>
> 	return pf_debugfs_available(xe, dent);
>diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>new file mode 100644
>index 000000000000..4445824499ad
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>@@ -0,0 +1,98 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include <linux/debugfs.h>
>+#include <drm/drm_debugfs.h>
>+
>+#include "xe_device_types.h"
>+#include "xe_tile_sriov_pf_debugfs.h"
>+#include "xe_sriov.h"
>+
>+/*
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov		# d_inode->i_private = (xe_device*)
>+ *      │   ├── pf		# d_inode->i_private = (xe_device*)
>+ *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
>+ *      │   │   ├── tile1
>+ *      │   │   │   :
>+ *      │   ├── vf1		# d_inode->i_private = VFID(1)
>+ *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
>+ *      │   │   ├── tile1
>+ *      │   │   :   :
>+ *      │   ├── vfN		# d_inode->i_private = VFID(N)
>+ *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
>+ *      │   │   ├── tile1
>+ *      :   :   :   :
>+ */
>+
>+static void *extract_priv(struct dentry *d)
>+{
>+	return d->d_inode->i_private;
>+}
>+
>+__maybe_unused
>+static struct xe_tile *extract_tile(struct dentry *d)
>+{
>+	return extract_priv(d);
>+}
>+
>+static struct xe_device *extract_xe(struct dentry *d)
>+{
>+	return extract_priv(d->d_parent->d_parent);
>+}
>+
>+__maybe_unused
>+static unsigned int extract_vfid(struct dentry *d)
>+{
>+	void *pp = extract_priv(d->d_parent);
>+
>+	return pp == extract_xe(d) ? PFID : (uintptr_t)pp;
>+}
>+
>+/**
>+ * xe_tile_sriov_pf_debugfs_populate() - Populate SR-IOV debugfs tree with tile files.
>+ * @tile: the &xe_tile to register
>+ * @parent: the parent &dentry that represents the SR-IOV @vfid function
>+ * @vfid: the VF identifier
>+ *
>+ * Add to the @parent directory new debugfs directory that will represent a @tile and
>+ * populate it with files that are related to the SR-IOV @vfid function.
>+ *
>+ * This function can only be called on PF.
>+ */
>+void xe_tile_sriov_pf_debugfs_populate(struct xe_tile *tile, struct dentry *parent,
>+				       unsigned int vfid)
>+{
>+	struct xe_device *xe = tile->xe;
>+	struct dentry *dent;
>+	char name[10]; /* should be enough up to "tile%u\0" for 2^16 - 1 */
>+
>+	xe_tile_assert(tile, IS_SRIOV_PF(xe));
>+	xe_tile_assert(tile, extract_priv(parent->d_parent) == xe);
>+	xe_tile_assert(tile, extract_priv(parent) == tile->xe ||
>+		       (uintptr_t)extract_priv(parent) == vfid);
>+
>+	/*
>+	 *      /sys/kernel/debug/dri/BDF/
>+	 *      ├── sriov
>+	 *      │   ├── pf		# parent, d_inode->i_private = (xe_device*)
>+	 *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
>+	 *      │   │   ├── tile1
>+	 *      │   │   :   :
>+	 *      │   ├── vf1		# parent, d_inode->i_private = VFID(1)
>+	 *      │   │   ├── tile0	# d_inode->i_private = (xe_tile*)
>+	 *      │   │   ├── tile1
>+	 *      :   :   :   :
>+	 */
>+	snprintf(name, sizeof(name), "tile%u", tile->id);
>+	dent = debugfs_create_dir(name, parent);
>+	if (IS_ERR(dent))
>+		return;
>+	dent->d_inode->i_private = tile;
>+
>+	xe_tile_assert(tile, extract_tile(dent) == tile);
>+	xe_tile_assert(tile, extract_vfid(dent) == vfid);
>+	xe_tile_assert(tile, extract_xe(dent) == xe);
>+}
>diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h
>new file mode 100644
>index 000000000000..55d179c44634
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.h
>@@ -0,0 +1,15 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_TILE_SRIOV_PF_DEBUGFS_H_
>+#define _XE_TILE_SRIOV_PF_DEBUGFS_H_
>+
>+struct dentry;
>+struct xe_tile;
>+
>+void xe_tile_sriov_pf_debugfs_populate(struct xe_tile *tile, struct dentry *parent,
>+				       unsigned int vfid);
>+
>+#endif
>-- 
>2.47.1
>
