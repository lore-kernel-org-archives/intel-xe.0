Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE883C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 14:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8298E10E18B;
	Fri, 31 May 2024 14:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TRbRk+dU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF0810E18B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717166071; x=1748702071;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=5nH7U3ZVzdAA68B1znawLDgNRqGfCwhfaJz7N3Uacc0=;
 b=TRbRk+dUYi+JOZLs2GD5uLmtalJHtECNhbg1gexAyKYKKu9w1k86AfH2
 55a8tltTmHQ0ikpR9lgIRTejr/M7MU+DBJr5YmZZ1Rd4j6IbtKkIzRq5K
 UXUPkW/BIC09YxOR6xbsKUIkeXGXl9rHgpE3I87JnuJPkvdwHmloA5sJ7
 gJ3qa5OD3GumGmQfUhPE+0YXuls3n1FlslaCrxdLNX/rQObv0U3p9TPw9
 prwT7jkjdc8IkV1i0g+6667HsS3AzJ5Rv9a6+NQHH2a8F1N4XRI2QFYi7
 wHn4Jo2RH85u7w1oaIWDTfHHzyPgxEUMkKqgWdVt1iu+njr6PWDvsmNBT w==;
X-CSE-ConnectionGUID: VWKxedS1TIuGW9hAMREuqQ==
X-CSE-MsgGUID: lZSWVVcrTSiD1pAzm/LuUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11839403"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="11839403"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:34:30 -0700
X-CSE-ConnectionGUID: tKVFm7RVRjyBJpYrGSHxlQ==
X-CSE-MsgGUID: qipScyMLRyS+EgmqgBqilw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="41096562"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 07:34:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 07:34:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 07:34:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 07:34:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 07:34:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZY424HAPMtdw1go/MH8qJ0X85Yf3Bv82OSNj8o/K5hneFhOhwMfehlstNA/gSMW2sgcqX9lNmBHO07hkq9ej/3SXcHPEdlSFgDmVA/a3Y2UMFkGhIkAlns5HZgpj44D5J0wXR/nCq8T8cn07fBeu+3DlMQ5w+RAtr2UDqrfUcFvPpfs/itZstSA4msCg395Am3N5sDndSWL6A1y+4tGf+MOXuCC27ghCdCfqzDdwXQXzKkQvmGQfKUlpvLLkOmiZaBZXNL2kf5Q+V8eSJM1dSkzxZzFVq9uCCvWbasvwyRDp5OgsSGrysrbkxlrvbuXnquW7YYzPHRJN8aqWIalig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nnFqc2AIALFgbUXXp/6V+oCI4VcrgfgTsXeyXqKuNs=;
 b=Zb48T/774xN/I1kxYeOxRaYDOZCRnjKiwokmrWwCvvfHvvKEf20hr42RjPTGz1KyNFJY4JS2U7hy87A1sIdDqVdGQ3SuHdg0yHuFOz/ElFrc9SoSPss9tBRnIiYfa4eh+nlBFxY7zl0voFB4xKt7UfZGsr+ZbeKwRlg9kUtYvTgi1myF4/uR19Yl6wnYoWWYKobsj9YMZJqWKLk9u3IwOQ4sHxBqVbUnLy+AzlFdJyFmexf+j75aYJ6taGJ7PcGwqv9EuH+hULNpa0ofetLVIkVtw+rxkk5G2/2L30A4Fuh8CuuntJwOSYzBoDen8uefcBUogOxqOSul9PFoEZdTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 14:34:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Fri, 31 May 2024
 14:34:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240530151313.2284182-3-radhakrishna.sripada@intel.com>
References: <20240530151313.2284182-1-radhakrishna.sripada@intel.com>
 <20240530151313.2284182-3-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v3 2/6] drm/xe/trace: Extract guc related traces
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>, Jani Nikula <jani.nikula@intel.com>
Date: Fri, 31 May 2024 11:34:23 -0300
Message-ID: <171716606385.5017.5467907168383575126@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY3PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::22) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a78230-c66c-4115-b8c3-08dc817ec675
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmRyajRtVnNnNFZSY0JTcUp1VG83Vm0yWUsyaGNwU0NjLzRhTXc0SWJzN21L?=
 =?utf-8?B?OWJrb0hMcUh6M1ZEajhrYW10UEFmcGdialBDZXpRRDZONzFyZkl1dDVpbkU0?=
 =?utf-8?B?b1hsbDNWOGVpOHhoeWhWWFFVTDRuMTlpei81dUxaR2tYRHl4Z3pLUTliNEpK?=
 =?utf-8?B?dFhMbndJV1NIeXhGanJmVGYxN1Rrd2FCK3lPMUJOQVoxZzJ2WE82dzlFRllE?=
 =?utf-8?B?N25iUllhRXlQREhQeEtQVkYvckc5aTI2TkRreVJqS2M0Wmhvd2tpR3ZqN1J3?=
 =?utf-8?B?NkdvS3lUZ3ZmYmRlbnNsTStQR2x4WDFvMjEwMG9PZ0NCWTM0a0JnRVl6blR6?=
 =?utf-8?B?dTdsbFV2VE5oQVFEdEYvRmxvREFBTWozWDFkd0FBaEVBV25WekNtTk1oMmc1?=
 =?utf-8?B?c2dvUGtWRVM3azFsdHhaMFdmc1RGbjVZTXpiakxyTUJyY0FkalQyRUl6TkNx?=
 =?utf-8?B?M3NrNXlyZjZTdGF4SHlEd05uRndiQU5RSVVLZE9FRUhiZVBOL3ZMM3BPUkhp?=
 =?utf-8?B?UEVHVFo2SWhwa2NRZHpSQVl0V3ZEbGRVb2VYTW55TDdndnBPU3RtaXdpbzN0?=
 =?utf-8?B?ejhpVTBhdkZDakFSekdJNGx4cS9xdzVmY05YLzdPZytobVVOczhRaldTRjVq?=
 =?utf-8?B?eHExaGhOV01OV0pNak9BK1B3NVdSRjBGQkJtR3BaMGtZV3JHRmNoWTFEdVM5?=
 =?utf-8?B?NW9RVy9DdXQwVTBZeTRzcm9FM3dWWm5SNm1lTkRTbm5RN2o3RmxrSGhoU2lK?=
 =?utf-8?B?Vlh3Um50aWFqWmQ0Qjg3UzJmVHBRRmtldUpzOG4wSldPbUpDMU1JdFZjOWxI?=
 =?utf-8?B?NjRHQmtZbktrSFNjRW5uZEhCWHpmUTJKUUJXbldSaHBWRzNmWGVLUWk1WWpQ?=
 =?utf-8?B?ZTFwOFBac1g2NzhGRDN6RUd6RnRjQjhOSHBTWDZ1dGdWaTMrazVhOTNlbGc0?=
 =?utf-8?B?OFQ5Rk0rdVo5WFErV0VwWmwzU3ljSG8zYTd2YnBIQ1JCYUg5Sms1ckIrVUl4?=
 =?utf-8?B?UDdCeCtieGpRdzNla2pXMGdxdVN1Q3lVb2JvemhlTVlaeXBoczFHOUNKNFFE?=
 =?utf-8?B?bXM2SGsxaENzd1JxZ3drWEhQNDhmSk1GMGJsY1Bsdlpyd1dqS1p0eFA3MDJp?=
 =?utf-8?B?cVdTZmFJZ2xmTEpwdCsxVFU4WHFIQWRSYWRyc3g2K2RxUjNjTjZhM1ZDOS9I?=
 =?utf-8?B?a1B5bnhwNTRUS3htaldaTHVURkcyWXNlRVo4YWN3bGtWNFJ4bXUwOGZJbTN4?=
 =?utf-8?B?R1ZHZmx3NmFjWk43d2p5UXdjczRxaC92QWRKM1pob1hrM3VlQk9GQjRISEdm?=
 =?utf-8?B?YjYrdUxCd0Y2cisxVG5TcUtpcHR5dkxKODA5N0lONUNiM3VEODQybTJvYWF2?=
 =?utf-8?B?RFRZblMrb3lTRU1wTWJwVXNZRzBNbFNlSjBMd2ExSmFMK0NoNXZ6dFhXUGhq?=
 =?utf-8?B?SElaRkljWFFSaXg4ZGl6bG1RaExnNVBIcFNhTWIrRjhoRHpXUGpYdVUyWHBM?=
 =?utf-8?B?Yk5QRTJ4eVVmZm92TVJCNXB4QmthWTdCY20zd1FmN25BTDNkZXB6dk1WUnNH?=
 =?utf-8?B?Vks2bjFGZzhVZE5FWTRmOWYxZSt1djlQeXg4aThNdkV4emtEOHZWakFGRUlG?=
 =?utf-8?B?b2Q0dTdSL3pNeHZXZzFJM3FNVmJTUlFNemxSMERnMVlPdktjUkN6NnVxcGNt?=
 =?utf-8?B?a0t1SHJSb2djWThxU3cyM21haHRScGVNczBiZlByRkdob2tFY05zSm9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWloQm5ZblNRenhQOHlMOVZEYXNMaHNxdzlsUERuRTNTaWdhZ2srR0Z2QWdq?=
 =?utf-8?B?RzVaUXY4NXZTbVFaSGJyaVh4UzEvbGdqTEJXS2pQRzlZbjRKNzgrNTNhenY4?=
 =?utf-8?B?MEhFejZiVjh0Nm9mMnZ5VSs3MEdPb0NGV1NHVDhTTExPeW1lV3hmSXQzbE53?=
 =?utf-8?B?czZlNTVSSmdodEx4RkFTWXdnYy9YVCsvcGUrRmEvNHpZMjBKMURTdFdqUitl?=
 =?utf-8?B?SDdVODluVEZrRC9DUmtUbi9TRjlrZXFiL2tGeFQ0UVU0SGpEVEgvM3M4ZEVa?=
 =?utf-8?B?N2RuR3QreE05Y3F5eWlDWmJ5L1hqVFdQMWxDdHFNNS9UWnk5cXRYc0FOUWd3?=
 =?utf-8?B?MDEzcjFWZVlVWUxmNmtZSmZEZmJ2SzhXV0ViUHpQaEEvZnBPU3lXalk4RFRz?=
 =?utf-8?B?dGZaRDlBQXZ6anYyLzZIYUY1N005SlFtTVF6NEFYV01SUGp5M0doSTR3aHhs?=
 =?utf-8?B?NXppN1pLZU9mOUVWVnNNUnUxYndRcFkvYUp3OHZxd3ZHYVJwOFhRY2lLZFdS?=
 =?utf-8?B?SEJnbW41djlRQnBxblVOZm0xWFdxem80aGIxK0h1MCtHSkRMMUhrUTRuWkdG?=
 =?utf-8?B?NWt0MlMvLy9PTlArY3JYci84NDFIa3hKTlgzeG9uSFMvRlZGQ09kSmlJQXVi?=
 =?utf-8?B?d01tcEVOcVBRZ1FGek1wWUFHaHRNa1R2MjFFUVBMekd2Y3k1MVFSZzVleis4?=
 =?utf-8?B?ZjV2SThXVEtBWHhtZk9aNFlmRWlJSW16eDhLcWxNemRzSURlTFlKOXN2aW1o?=
 =?utf-8?B?ZXA5VFQ5N3B0NExNNENhejFJRDRzTFlGUEsxM0tzRGRLOFE1UTdTM1pxVWFr?=
 =?utf-8?B?UWFUbk5OcGJPbWsrNnkyam1MQXlMMW5KOVRRZzZzUkZRSStZcHkrQlEvT2l4?=
 =?utf-8?B?ZzQvTVRjK3hsdzI3UFBNOUdDazE0T2pKbkdQVnIrOG5KeHV6V095WDdQRnQ4?=
 =?utf-8?B?RXk3UUtFMEo0Q3p5ZGo2OUE2dnpJUHRkcmQ3Sk0yYmY5UTV6eE5YTGF0UFRv?=
 =?utf-8?B?WjNOU29CZXZTZC9OVGNUWVhQVVp4RFJ6NXNVbEVWbFZEQVNhc3M4T1dFTm5y?=
 =?utf-8?B?Zzl3WGhReFhvenF4eHlHU0VGbXFZWDEwb1k5ZHMxcFlCcG1qeGtsV3J1Q1lr?=
 =?utf-8?B?ajZSMkRCN3ZMOGdSUVhHY24rWlNpMjNML2dhaGxpZ2NKa2NwQVRYYXU3Z2xP?=
 =?utf-8?B?Y2VpSGFMYTBMVVE2TzFxZ1pJT2VDRExxSk43K2dVOHBLbXVFUWJnOFA2R0x1?=
 =?utf-8?B?YUlZMHNFWW5oSngxVWFPbGxiZnBQdnpzUGx0Z1FpMVdLeVNkRVEyc2dyTlJQ?=
 =?utf-8?B?UGtpOTNYSjdsT1RCaytjTFM3VWNYQmZ5VGpOeUp1Q0ZQdlRhcGpieTFYN3l2?=
 =?utf-8?B?TnM0MTE2Sy9aUFErNm44T04xeVlhbEhRK2dSM0V4bGFjTng2eGIyRWphaE9U?=
 =?utf-8?B?UHFMRXBkcVpmZ0ZnS0xLSDNON3JmZ2lrdEFGdGZ6aG1VT1NyZ1ZTeGg3dWt2?=
 =?utf-8?B?S2pZZTZIcWYrTEE2V3ZNbFQvQjZqTjVEbmlEaTVvOWtWcVEzYXJHTzR3QTFr?=
 =?utf-8?B?TzJsMHFQTlIyS29RV0VQd3NQdXJuclg3NHhrbmtTamNjRVB1WnNHQ3hGZGll?=
 =?utf-8?B?dmQ1SThxd3RPS0t6OCtXa091QXJGODlhWEdHUU1JZmNXeWthSmJwaXlkeHY0?=
 =?utf-8?B?aG1UWUtLSzl2UVM1OFhScmMxRUVnTmZZNDRoVFJFRE0wUTJWOGRLVS9sRDQ3?=
 =?utf-8?B?L1g3dmpCN0ZRbzZEaGRUd0F4OTdpOUZxSUk1YUwyc2djRTBSOW9peTZXK1NG?=
 =?utf-8?B?WnpxWDlHOXhlUXovdkZWVXZKYkMvYjAvcUR5ZmhHdGp0aDhrck5hNGVWL09Y?=
 =?utf-8?B?RTg5Nmh1cnlQY1ZRSFZwQ2c4V2RSVjFWWnRCa3pHbjV4K3Voc2F3U0FSWDZr?=
 =?utf-8?B?NEt0aGJ1Nk5YWjM4a0hUYUU1dlVrR2E3SWlzSWhweDlrbEFkYWFkL2hCeEhv?=
 =?utf-8?B?ZzF6QllKWWd0M28rckNYaFc1M0gwUlpJc0diMlZqTngyay9KdlllNkxZbTcz?=
 =?utf-8?B?V3ZPVkFtb1ZMbG5jNlVMcit2bndwaWU5R3pJckpTSysya3VmK1kyTlYyNGtP?=
 =?utf-8?B?MFArbFU0NjFGdVMxWHc0OFdWYTFPWDl0OXlIektpMTFOdmVTZ1gzVnNJdi9S?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a78230-c66c-4115-b8c3-08dc817ec675
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 14:34:27.8277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wC6DoUXhxGxikvKBrhIyqEkabPKtarYjufX8vz49Q89H1mdce8Tjd3tQ8lRCSX4PKcEyJVKdg8LuDLHZ+U9+cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
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

Quoting Radhakrishna Sripada (2024-05-30 12:13:09-03:00)
>xe_trace.h is starting to get over crowded. Move the traces
>related to guc to its own file.
>
>Suggested-by: Jani Nikula <jani.nikula@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/Makefile       |   1 +
> drivers/gpu/drm/xe/xe_guc_ct.c    |   2 +-
> drivers/gpu/drm/xe/xe_trace.h     |  80 -----------------------
> drivers/gpu/drm/xe/xe_trace_guc.c |   9 +++
> drivers/gpu/drm/xe/xe_trace_guc.h | 103 ++++++++++++++++++++++++++++++
> 5 files changed, 114 insertions(+), 81 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.c
> create mode 100644 drivers/gpu/drm/xe/xe_trace_guc.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index fa9960acfe53..db77b9823f7c 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -136,6 +136,7 @@ xe-y +=3D xe_bb.o \
>         xe_tile_sysfs.o \
>         xe_trace.o \
>         xe_trace_bo.o \
>+        xe_trace_guc.o \
>         xe_ttm_sys_mgr.o \
>         xe_ttm_stolen_mgr.o \
>         xe_ttm_vram_mgr.o \
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct=
.c
>index c1f258348f5c..78f79df638d5 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -29,7 +29,7 @@
> #include "xe_guc_submit.h"
> #include "xe_map.h"
> #include "xe_pm.h"
>-#include "xe_trace.h"
>+#include "xe_trace_guc.h"
>=20
> /* Used when a CT send wants to block and / or receive data */
> struct g2h_fence {
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 9493cc3d6d82..8e00f0cdeb75 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -332,86 +332,6 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
>              TP_ARGS(fence)
> );
>=20
>-/* GuC */
>-DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
>-                    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u=
32 len),
>-                    TP_ARGS(_head, _tail, size, space, len),
>-
>-                    TP_STRUCT__entry(
>-                             __field(u32, _head)
>-                             __field(u32, _tail)
>-                             __field(u32, size)
>-                             __field(u32, space)
>-                             __field(u32, len)
>-                             ),
>-
>-                    TP_fast_assign(
>-                           __entry->_head =3D _head;
>-                           __entry->_tail =3D _tail;
>-                           __entry->size =3D size;
>-                           __entry->space =3D space;
>-                           __entry->len =3D len;
>-                           ),
>-
>-                    TP_printk("h2g flow control: head=3D%u, tail=3D%u, si=
ze=3D%u, space=3D%u, len=3D%u",
>-                              __entry->_head, __entry->_tail, __entry->si=
ze,
>-                              __entry->space, __entry->len)
>-);
>-
>-DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
>-             TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len)=
,
>-             TP_ARGS(_head, _tail, size, space, len)
>-);
>-
>-DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
>-                   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u3=
2 len),
>-                   TP_ARGS(_head, _tail, size, space, len),
>-
>-                   TP_printk("g2h flow control: head=3D%u, tail=3D%u, siz=
e=3D%u, space=3D%u, len=3D%u",
>-                             __entry->_head, __entry->_tail, __entry->siz=
e,
>-                             __entry->space, __entry->len)
>-);
>-
>-DECLARE_EVENT_CLASS(xe_guc_ctb,
>-                    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u3=
2 tail),
>-                    TP_ARGS(gt_id, action, len, _head, tail),
>-
>-                    TP_STRUCT__entry(
>-                                __field(u8, gt_id)
>-                                __field(u32, action)
>-                                __field(u32, len)
>-                                __field(u32, tail)
>-                                __field(u32, _head)
>-                    ),
>-
>-                    TP_fast_assign(
>-                            __entry->gt_id =3D gt_id;
>-                            __entry->action =3D action;
>-                            __entry->len =3D len;
>-                            __entry->tail =3D tail;
>-                            __entry->_head =3D _head;
>-                    ),
>-
>-                    TP_printk("gt%d: H2G CTB: action=3D0x%x, len=3D%d, ta=
il=3D%d, head=3D%d\n",
>-                              __entry->gt_id, __entry->action, __entry->l=
en,
>-                              __entry->tail, __entry->_head)
>-);
>-
>-DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
>-             TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)=
,
>-             TP_ARGS(gt_id, action, len, _head, tail)
>-);
>-
>-DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
>-                   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32=
 tail),
>-                   TP_ARGS(gt_id, action, len, _head, tail),
>-
>-                   TP_printk("gt%d: G2H CTB: action=3D0x%x, len=3D%d, tai=
l=3D%d, head=3D%d\n",
>-                             __entry->gt_id, __entry->action, __entry->le=
n,
>-                             __entry->tail, __entry->_head)
>-
>-);
>-
> #endif
>=20
> /* This part must be outside protection */
>diff --git a/drivers/gpu/drm/xe/xe_trace_guc.c b/drivers/gpu/drm/xe/xe_tra=
ce_guc.c
>new file mode 100644
>index 000000000000..f2e2b6bd165d
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_trace_guc.c
>@@ -0,0 +1,9 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+/*
>+ * Copyright =C2=A9 2022 Intel Corporation

s/2022/2024/

>+ */
>+
>+#ifndef __CHECKER__
>+#define CREATE_TRACE_POINTS
>+#include "xe_trace_guc.h"
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_tra=
ce_guc.h
>new file mode 100644
>index 000000000000..fb4976499812
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_trace_guc.h
>@@ -0,0 +1,103 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+/*
>+ * Copyright =C2=A9 2022 Intel Corporation

s/2022/2024/

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+ */
>+
>+#undef TRACE_SYSTEM
>+#define TRACE_SYSTEM xe
>+
>+#if !defined(_XE_TRACE_GUC_H_) || defined(TRACE_HEADER_MULTI_READ)
>+#define _XE_TRACE_GUC_H_
>+
>+#include <linux/tracepoint.h>
>+#include <linux/types.h>
>+
>+#include "xe_guc_exec_queue_types.h"
>+
>+DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
>+                    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u=
32 len),
>+                    TP_ARGS(_head, _tail, size, space, len),
>+
>+                    TP_STRUCT__entry(
>+                             __field(u32, _head)
>+                             __field(u32, _tail)
>+                             __field(u32, size)
>+                             __field(u32, space)
>+                             __field(u32, len)
>+                             ),
>+
>+                    TP_fast_assign(
>+                           __entry->_head =3D _head;
>+                           __entry->_tail =3D _tail;
>+                           __entry->size =3D size;
>+                           __entry->space =3D space;
>+                           __entry->len =3D len;
>+                           ),
>+
>+                    TP_printk("h2g flow control: head=3D%u, tail=3D%u, si=
ze=3D%u, space=3D%u, len=3D%u",
>+                              __entry->_head, __entry->_tail, __entry->si=
ze,
>+                              __entry->space, __entry->len)
>+);
>+
>+DEFINE_EVENT(xe_guc_ct_flow_control, xe_guc_ct_h2g_flow_control,
>+             TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len)=
,
>+             TP_ARGS(_head, _tail, size, space, len)
>+);
>+
>+DEFINE_EVENT_PRINT(xe_guc_ct_flow_control, xe_guc_ct_g2h_flow_control,
>+                   TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u3=
2 len),
>+                   TP_ARGS(_head, _tail, size, space, len),
>+
>+                   TP_printk("g2h flow control: head=3D%u, tail=3D%u, siz=
e=3D%u, space=3D%u, len=3D%u",
>+                             __entry->_head, __entry->_tail, __entry->siz=
e,
>+                             __entry->space, __entry->len)
>+);
>+
>+DECLARE_EVENT_CLASS(xe_guc_ctb,
>+                    TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u3=
2 tail),
>+                    TP_ARGS(gt_id, action, len, _head, tail),
>+
>+                    TP_STRUCT__entry(
>+                                __field(u8, gt_id)
>+                                __field(u32, action)
>+                                __field(u32, len)
>+                                __field(u32, tail)
>+                                __field(u32, _head)
>+                    ),
>+
>+                    TP_fast_assign(
>+                            __entry->gt_id =3D gt_id;
>+                            __entry->action =3D action;
>+                            __entry->len =3D len;
>+                            __entry->tail =3D tail;
>+                            __entry->_head =3D _head;
>+                    ),
>+
>+                    TP_printk("gt%d: H2G CTB: action=3D0x%x, len=3D%d, ta=
il=3D%d, head=3D%d\n",
>+                              __entry->gt_id, __entry->action, __entry->l=
en,
>+                              __entry->tail, __entry->_head)
>+);
>+
>+DEFINE_EVENT(xe_guc_ctb, xe_guc_ctb_h2g,
>+             TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32 tail)=
,
>+             TP_ARGS(gt_id, action, len, _head, tail)
>+);
>+
>+DEFINE_EVENT_PRINT(xe_guc_ctb, xe_guc_ctb_g2h,
>+                   TP_PROTO(u8 gt_id, u32 action, u32 len, u32 _head, u32=
 tail),
>+                   TP_ARGS(gt_id, action, len, _head, tail),
>+
>+                   TP_printk("gt%d: G2H CTB: action=3D0x%x, len=3D%d, tai=
l=3D%d, head=3D%d\n",
>+                             __entry->gt_id, __entry->action, __entry->le=
n,
>+                             __entry->tail, __entry->_head)
>+
>+);
>+
>+#endif
>+
>+/* This part must be outside protection */
>+#undef TRACE_INCLUDE_PATH
>+#undef TRACE_INCLUDE_FILE
>+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
>+#define TRACE_INCLUDE_FILE xe_trace_guc
>+#include <trace/define_trace.h>
>--=20
>2.34.1
>
