Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF58C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 21:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6DF10E2DB;
	Fri, 11 Jul 2025 21:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Br5gSJdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206F210E2DB
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 21:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752268416; x=1783804416;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nhUvBpGvzNlT6QWHhm1ldubJ7KZ+ZSDv2ian5k9bzPQ=;
 b=Br5gSJdRhI9CEeeKD0SLaQIQaVRj9c/1Uex1BP5/hYramSaQx2JAkYB8
 w1q2dXKOqrQ2vOkjkBULgr+ynyOh+fX03Mxr9/q0wq0pl45pJltBkdgtD
 qGaza6+c29A9DraE+omp34WNz9cJmSReS2z517yaev3QJuSs+v0EXJ2ad
 eBc3+XUElufHcKKDxkLkdNWRbrshN75NQKDawUDivUMpMt88Cx+KV+geh
 5kg33exeJAgd+tFDj7IEIG7ZmwGHm4OdSjBNxlU75Gcq585HHv9Vq5FUg
 x+BfBmBo+UddC/tAweRuss6AEW9rdMFB1jDgBXcD4VeXwjobmfe8Gffik A==;
X-CSE-ConnectionGUID: ggqXzhiOT16bELjnnOkPRA==
X-CSE-MsgGUID: 1/Hii1LaQtSFeJ0Bpd4JWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72153427"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="72153427"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:13:35 -0700
X-CSE-ConnectionGUID: EoBqgEZzRY692kpLG94SrA==
X-CSE-MsgGUID: ELxLj5CLQRGio1n7ocSjMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="160787296"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:13:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 14:13:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 14:13:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 14:13:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCgte7xBACHIC/XcY/ExXZsEpy7UUY/NJQvzh51dvoN7j49/3mGZYTHd34eUw/jqWijALN3EafOovuxsWlCX9e9jitPSfCzxP7LUR2Yszgigzu74EUFzsfcb0SxEYrD7VAO/0zA8Hsnq/joTMWXzhC7xBh0cCdZzPR19OqyXCyTCZkWl0JyAZB7LGdryfHjh9WuIuhJAIRujEgUhRF9eYyHx5W44yYFCivlTlEkcCE8Rms12X9On8Bz7dURH9aQdmOGeH/ebJz1hirzvffLka4uiIBUUyP6zVg4iCkW5sYts0Cfcc1dNgldKqLHqzjtwm1YhjpSC6KsXiVHRSFdIUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhUvBpGvzNlT6QWHhm1ldubJ7KZ+ZSDv2ian5k9bzPQ=;
 b=sEv6h1mvjVf9ZNlns1MV3Y55V8GOLn1Ut2MhxuVB3V53Sp9S7kjQSgP00eyGJClG5T8kpqKCbNXstOeHsd8V+oLa7YdQX2GHJvilTJlcBajzbngRegBKxalZsWExkhdBIQUVa7sZ2iKUBb7/B7hNdWRgdOcPQliEzrNObHsM1URBy+UczZ3H8y1/sjJHUXohte4jWjHtKLPbizZb8po5D9xoYC2hcsFNqL90S78LI4z866kLo4wR2m1kM19NLbflMF2EJBiOxdAhiJucvQJ0IZsc6BfHeTTs9A2u4NofLguCsrpA72jCa43KRGdSjCunm6ng9qcSdkEIlbk5wvUuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 21:13:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.025; Fri, 11 Jul 2025
 21:13:05 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 9/9] drm/xe: Remove unused GT TLB invalidation trace
 points
Thread-Topic: [PATCH v2 9/9] drm/xe: Remove unused GT TLB invalidation trace
 points
Thread-Index: AQHb66rJcXToyg2+qkKvpH6QTnX9BbQtedYA
Date: Fri, 11 Jul 2025 21:13:05 +0000
Message-ID: <cc1826d95e9ba16402f340e463c6a2c838efbbeb.camel@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-10-matthew.brost@intel.com>
In-Reply-To: <20250702234222.3278264-10-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB7017:EE_
x-ms-office365-filtering-correlation-id: a82b7e72-d5b8-4770-8f5c-08ddc0bfba4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZE9GVDRaVXBqaHl4MFdjYTYvTU9ka3l0cERjYjJkSm5zelp0c09vV3pHaVo2?=
 =?utf-8?B?c01vbzVoVDhhdjZxQXlOWWJkb3p1ZU5yU2hqR1J4dWlYbkpLcGIyMkRnaElB?=
 =?utf-8?B?NUNXVExFVnlhSXFyM3RtRVppc2YwbzBWTVRLRFcwSGlWL2JZNWJmOFA3dzRS?=
 =?utf-8?B?Q0xZa0c2RS9nRzlucDdTaFVxRUdJSDFKWG0yS3RoZTV3YjMzUXgycktQNVUx?=
 =?utf-8?B?VXVXNldOTXV5YWpDNHE4aS9qT09BamU1dkV2M1hoMjFIWHFyMUhkako5aFJS?=
 =?utf-8?B?b1lmL1VUTXZCZmdydE5ScU5lSGVNOVIxdk9TVERLZDZhV1docC9Ua3RuTEpX?=
 =?utf-8?B?bEZLcGpJVjlpQ0JEWXBTU0h1cUZnNG5iZ2ZhU1kyWW9jTnJyY0pDUzlUZU41?=
 =?utf-8?B?SFFxbGNlZ0ljWlgzVGRuYnU0WjJjUFQyQlVQVk9IMnVSZzM5enpuK1R0Y24x?=
 =?utf-8?B?YzZxeG1jVStLOW9TdWZIK2Yza3czNnMwUjhOaXhMdTkrck96MUpCTjJMc3ox?=
 =?utf-8?B?ajZLbGUzdFBVUEdaL0VPL3hyVHd2bURjVkpPcXJ4RExqdHkra1VUeDYxazVi?=
 =?utf-8?B?VHA1Ri9iVEpkVjgycXRhVG5nZWk5RmJPQVhkQVBOZGU0WXdaOTJVdE1relBG?=
 =?utf-8?B?RU9DU0VpYkFHNG0wOHJ6RnlDaGlhN21Pb3h5Vjh6M0NDQjBGbE5CYXd3V3Nx?=
 =?utf-8?B?U3pPemg3TmJ5Q0VjaDljRzlOTlV1L01keGl5eVlRb2F4bUZaQllaUWJtRXVq?=
 =?utf-8?B?MlVVYVI1YzdOUXEzZStEM2RreURPVnJIMXJ1N2VMUkc2eElOMVo5ZW00RldF?=
 =?utf-8?B?WlJabnNvL3pXYmVKaHV3SXNDZWx1Nlpla3p6eUdlMmtEL2VORlN6V1VWajdo?=
 =?utf-8?B?T2dGYmxPNi9jUHdoVkUza2Yzblg1U0sxeElYT0grMXpQTnlGUENTVW5hcnVB?=
 =?utf-8?B?NFB5U1lMVVFBcG52dTl1VWhCb2s2M3JoZ3pwZjRrbDJ6RjBtR2JGQUNmcjZM?=
 =?utf-8?B?bUxIT0wydTVUdVE1WDh3ek12UGtZN2hDM1RHNnYzQ0U5cjFhanEyc1RXZVFN?=
 =?utf-8?B?SzNOYWRPQ3BIejZrNmJ6ZkQ5T2xjN0lkZnZNbUQ3Z1FSTFEwTmpQK3JoM1Mz?=
 =?utf-8?B?b21qclJxWUxlRjhrd3lqcjRUdjFhV0NLU1BBRU9HamY0dVIvK3JSZmkrclFh?=
 =?utf-8?B?VW9FUVJLdXkyUjh2RUFKYlJ5T0V0UUY1eVJtSlNCSlJNNzZlaVFPdktvRDkx?=
 =?utf-8?B?S1FrNWl3NG9OTnp2UFlxRkVQQ0MrY0RBQVdFa2lpeHhXYTFreU1YRlJOT3R2?=
 =?utf-8?B?S3pxaXM1bkFSa0RIMGNmSk91Rzc1dlQ2bnBVc2Q0RURLODVsWk1uVHJiWEQ5?=
 =?utf-8?B?S2NNbkhmSGM0ang4ZnlrYWJtM3AwTlZMSHNYTllvQk5ZVTg2elo1ZitaNXhV?=
 =?utf-8?B?ZDBJaksxSkVsTEJoTFZad3BwcUdxMUZ3NW9pNVk1QVNhdUZnQWJFZ2VNVWVM?=
 =?utf-8?B?YnpFdThmbTlVQkxTKzFRbkRrem9lRGU2SWZOVGhvR3ZEUmZ4aWs5VWVQWWVm?=
 =?utf-8?B?SVMrVHVOWDYyaW1tSmx4ZHNrTGVFcTBKZjA5WEY2QWdOVTFaL0YzYjVrMVRV?=
 =?utf-8?B?aWI1NGlOMFZFeStyZkt6V0UyNmlCQzRLakhhY0M0SW43SEhDNTJBQ3RLYlNB?=
 =?utf-8?B?c0xHZG5aS1VYRE5PWndwdFhNUnlvQlZ2ZDZLR3MyQTZpNmdGY0doSnRPTlRV?=
 =?utf-8?B?bXJMYnZpZ0Vsd1dqbTRTY1ZMRFh5QVREdy9kTFVON3dxRzAxVXluWThUUnRP?=
 =?utf-8?B?bys1VmdKOFAzb1kzQjkxcG9HMGc0MWhySXQrdndDL0lkVXFaclZpellqV2dF?=
 =?utf-8?B?alRsaWVlejR5TStTSGlKYnhyZ0dodERFaGU1cnJZRjhqNHV2RURWYUczYUtO?=
 =?utf-8?B?dnlVc0JkY2YvWkpMMFAzc0JOa0dJOEljMXEzbGlERm9BelpBeDNRbkpscDhI?=
 =?utf-8?Q?Tx0Agouoffm2wnR9QhOqVh6cDVFn1E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cExxM0p6Zm5aM0cwT0tlY0VLZzFXNGVtRnVDTlhYU1VxWWVRZUZsYzRKL3RD?=
 =?utf-8?B?Ri93OFN3VmNBNWQ2VmR0UVpsTDh3U0hyTEdBZlZpRmNKS2w4b21LK1dsZTh3?=
 =?utf-8?B?dTlQaTgwcHlDd0ZiU3ZMTk5oSllhM0hlOWR6c3dqbWZxcTBmaGNzdXpEOHpX?=
 =?utf-8?B?MFVTQUdLOU9xRlZxdVk4U0t0NzMvTzNSLzBGMmxFY3VSQXpsUDJqRHd5YjBw?=
 =?utf-8?B?N3dNdHVzcXcvT0RFWmRuU1dJL0J4Y0tnUkhaeDF6OWVtWE95Y0lGM2hxZS9y?=
 =?utf-8?B?KzNYMGdRdHZBQ2p6QWlGUDRsY1gvSjdqcklnVktZS2ZJb0lIQzZXSlRtb1Mx?=
 =?utf-8?B?YzJkdCtlU2t6MU1NZzM0RWI5bEJjclE1ZzNqVFJJek5HdmNRN3o5dHFFaVg1?=
 =?utf-8?B?enplQ0pkcGlCQUVVMmYzWGVDcWVVQThyWXFMb1o5MTZDVU9JZGlHVDBBN1JI?=
 =?utf-8?B?TldlaVA4elZlcVozT1c3cVBZUHJ4ZHJ5WmZqTVNzSXFPdm5wVEtrSXlialhv?=
 =?utf-8?B?MktmK0gzTkt1R1FNSVVISVE5N0MxVGtYaU9WUkRwNzU4MmRXNll4UU13WWhL?=
 =?utf-8?B?cHVPeG9NRmZmWVZhVTlSVkQvbFhManNJWWlKUEsxVTN4bDFZeXMzWmVrekpL?=
 =?utf-8?B?ck9jYjRWR0xka0ljWGE1SzBiNFdlZ3dQQmdlbEo2M1BuVXhmeGJaNEIvUHA0?=
 =?utf-8?B?SmkrQXN0OEhoZFcza2tmV2VPUnV4QVVIbTBrZTlFS3JDMWFqOWNxNGJvZ2VZ?=
 =?utf-8?B?MFRteVRCSnpMNnNmRVd6c09KV0hMSEMzb3JMU1dJOFJQaDBGUDJ5QVZ6RkE3?=
 =?utf-8?B?RHFNL1Bta2piSFovVzk3WlNiQWxmVHFmV0R3RTNSWk9uR0hISXd3MEx6M2pD?=
 =?utf-8?B?MFJSUWF4bFJuMU5lajhFVyt6dWhuOE40WCtobHNORXNBUXpPcnUwb2xzbHZF?=
 =?utf-8?B?Y29uNlFqaHBib2QxR1cwWHVkeXNXQVZlWGdJQThyVytxT1VQaFNFNFpWVzl1?=
 =?utf-8?B?K28waHdzSnI1eDhlVHE2dUtPekxxVFdnaldGRUVEaG04NUpUcVM0ZklSOW9a?=
 =?utf-8?B?anB2cEh5UjdvNmtrbDgvdFNEa0Joakc1ZTVXRWViaWVHbVVtQ1l0bHIvcHIz?=
 =?utf-8?B?empESEpROXNYOGRqUEpvcG55MjR3d1RZMHQwVk40NlF2OFRvTHRoanY3eEtj?=
 =?utf-8?B?RFFGTWovWHVXaG40VTdEb2JtT1NyK0o5NTRhbjJXWnlqWnl4YTVHTS9QaWdx?=
 =?utf-8?B?QVVEUEJvM3QyMXYvdmxnY1pPV1lTNEpoaDN1MzMvM1Awdzk5bWI2ajBtZ3Vo?=
 =?utf-8?B?TVlMVmo4aUVTZDI0WHBwaG9aTm0rRGJyazYyV0s2YzZ0RlpEbGljeXkrOU92?=
 =?utf-8?B?YWUvTzgvd3FGYXJPbndNYkFkVkRzK2hCb0tlUE54R1ZoVENyOW9DaUtuRDBO?=
 =?utf-8?B?Q25oZHgzUy9sWWpWWlpCK2h1MnBIaDRkRVVBakhlZnR1ZitOS3NDd1JuYzJK?=
 =?utf-8?B?cWdXRFlFNE1seHFiemFqNWtmcmJzbDBCWWI1WGNnK2tESFpGaHREdmJwSW9F?=
 =?utf-8?B?MkhvU1FKNWU3MGUrSklBYU03RnlSQ0ZXWmpNTE5xZVFlUkE2QzdsME5UVElp?=
 =?utf-8?B?SlJGM1RvK3gxcWZ1K3BNZjErdnhVaFIvYS9kTnlGWlpsQ2ZReHIwQ0lNcHJz?=
 =?utf-8?B?bXJGSTNiWmpINWtNMGlHZm01UkRWTm4vbnRYQ1llLzVlSlk0RkZkLzFoMGh1?=
 =?utf-8?B?dVVUTndLVGN5RVhEWkFmTEYwRWNGSnlURG4vOXJkMmlnSTQ3U0hpQ0c2ZFd6?=
 =?utf-8?B?QU5vS2tacWk1S1VvdE1tSmNRNkNkRVdBTW1EQzlWUldMVm4vd1BaWTRYTldy?=
 =?utf-8?B?MFFmRzZKcFZUWjI1OVZwZXBTMG0zUVJ3enBlNHpxWEZKSytPam94VGhxOVY5?=
 =?utf-8?B?TFFYdk5KWXdKRmZMZkFKSHpqWGx4NTkyZHBQeHBscW5ua2hLcTZyYVRrSlBY?=
 =?utf-8?B?ZFJZRFRwbGJJeVlUVCtVTW1wWS9KYThmNkNRRkp0QkE4SFVhTGNGbDNhS3lF?=
 =?utf-8?B?NzdMcXE4QmRzWWFYbmxZdUIrcG9BQVBOc1JXVGVQZFBWc1hNVkcvM0VqVUJq?=
 =?utf-8?B?bGZ6UGxXNjdZZGRuZVN0YnJmRjBGNFdqNkNEZEZldU1uUkhWaTErbSs5MVJT?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F344294A740B9647A71300E1F8A782C5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a82b7e72-d5b8-4770-8f5c-08ddc0bfba4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 21:13:05.2919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hiysFM5x+Sw11W0yHeXijvrVkoyH2tLuzNh2EVIEbQq5iKYbwrdOO1/NWWo7v4mL+vr7Qrsb5lYc/UnB3abi8GVceuWwfevTmSAW0cpa2rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7017
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

T24gV2VkLCAyMDI1LTA3LTAyIGF0IDE2OjQyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBSZW1vdmUgdW51c2VkIEdUIFRMQiBpbnZhbGlkYXRpb24gdHJhY2UgcG9pbnRzIGFmdGVyIGNv
bnZlcnRpbmcgdG8NCj4gdXNlZA0KPiBHVCBUTEIgaW52YWxpZGF0aW9uIGpvYnMuIFRyYWNlcG9p
bnQgcmVtb3ZlZCB3ZXJlIHVzZWQgZHVyaW5nIGVhcmx5DQo+IGJyaW5nIHVwIG9mIHVuc3RhYmxl
IGRyaXZlciwgd2l0aCBhIHN0YWJsZSBkcml2ZXIgbm8gbmVlZCB0byByZXBsYWNlDQo+IHdpdGgg
bmV3IHRyYWNlcG9pbnRzLg0KDQpNYWtlcyBzZW5zZSB0byBtZS4gSU1PIHRoZSBnMmgvaDJnIG1l
c3NhZ2VzIGFyZSBtb3JlIGludGVyZXN0aW5nIGhlcmUNCmZvciBkZWJ1ZyBhbnl3YXkuDQoNClJl
dmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmggfCAxNiAtLS0tLS0t
LS0tLS0tLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3RyYWNlLmgNCj4gaW5kZXggYjRhMzU3N2RmNzBjLi4yMTQ4NmE2ZjY5M2EgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV90cmFjZS5oDQo+IEBAIC00NSwyMiArNDUsNiBAQCBERUNMQVJFX0VW
RU5UX0NMQVNTKHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fZmVuY2UsDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19nZXRfc3RyKGRl
diksIF9fZW50cnktPmZlbmNlLA0KPiBfX2VudHJ5LT5zZXFubykNCj4gwqApOw0KPiDCoA0KPiAt
REVGSU5FX0VWRU5UKHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fZmVuY2UsDQo+IHhlX2d0X3RsYl9p
bnZhbGlkYXRpb25fZmVuY2VfY3JlYXRlLA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9Q
Uk9UTyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0DQo+IHhlX2d0X3RsYl9pbnZhbGlkYXRp
b25fZmVuY2UgKmZlbmNlKSwNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfQVJHUyh4ZSwg
ZmVuY2UpDQo+IC0pOw0KPiAtDQo+IC1ERUZJTkVfRVZFTlQoeGVfZ3RfdGxiX2ludmFsaWRhdGlv
bl9mZW5jZSwNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVfZ3RfdGxiX2ludmFsaWRhdGlv
bl9mZW5jZV93b3JrX2Z1bmMsDQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX1BST1RPKHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QNCj4geGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9mZW5j
ZSAqZmVuY2UpLA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUUF9BUkdTKHhlLCBmZW5jZSkN
Cj4gLSk7DQo+IC0NCj4gLURFRklORV9FVkVOVCh4ZV9ndF90bGJfaW52YWxpZGF0aW9uX2ZlbmNl
LA0KPiB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX2ZlbmNlX2NiLA0KPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBUUF9QUk9UTyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0DQo+IHhlX2d0X3Rs
Yl9pbnZhbGlkYXRpb25fZmVuY2UgKmZlbmNlKSwNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
VFBfQVJHUyh4ZSwgZmVuY2UpDQo+IC0pOw0KPiAtDQo+IMKgREVGSU5FX0VWRU5UKHhlX2d0X3Rs
Yl9pbnZhbGlkYXRpb25fZmVuY2UsDQo+IHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fZmVuY2Vfc2Vu
ZCwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRQX1BST1RPKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlLCBzdHJ1Y3QNCj4geGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9mZW5jZSAqZmVuY2UpLA0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBfQVJHUyh4ZSwgZmVuY2UpDQoNCg==
