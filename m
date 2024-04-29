Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAD4C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF5A89143;
	Mon, 29 Apr 2024 20:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JyhUb4qA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA9610E3A6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714421546; x=1745957546;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fMHYDD9A+lR6571wOPRuTYkJlFlXCyA97piZGjRGtAE=;
 b=JyhUb4qAm3PtKKXH9MwmAvFDRSlwS6N2HDN2nsCF0jiJgC3OdX5nXdKu
 7SPoOi9ATwWoVbJAeA7a6ER7lSVcRpepDaFIeVX9vrHEa3HKF0nliBlDb
 2EJOnYEKeJAatZYvDntGpeV8g77KMLnvHi6/e45D6+fM/1rGYtc8Sb0/L
 NaodCU5ExGuJywb19w+BAHNxMTagm+AEK28Y3cWLjHR7+/WSTjSk/bb2t
 hoU1wvyeV/nh8tbhMEA1ibUl9pI0jw2M/1Mv6HCSQJDmPvoeLCVdnhAWO
 RR+I/4umHIIJtQwI6Kxkz/I7ytH+gq33HT5+89rwMkwE0XwjiiIYsocSn g==;
X-CSE-ConnectionGUID: 3pIXEt1AQGKjaceGEGzsXw==
X-CSE-MsgGUID: x319lhHHTPOnSX/8QeQ4nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10640278"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="10640278"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:12:25 -0700
X-CSE-ConnectionGUID: ptTZ59FKSJGc/B8nNZUuLg==
X-CSE-MsgGUID: Tdun/zpGQ72RZ2+Xwge3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="30860756"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:12:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:12:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:12:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:12:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:12:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9Ik3InMuARmZ3bX/CQeGJmI3kuCPRRuh+jPTZncqoplezMKQ/0G+Zgr3PP25xLrehM2mYYVv9+5Do2Vhl5Ow1pMgeloejfL+6WXXihn9RExDzPAY+jTz7NurcNEsIL5A7GpiScG8P3D+9C6vD4vwg/bP3G/EEXm+Sh1OGj8QqfSK36ywTi3fAsGdksJuokJrGJ27cXn7LThqKdpXmTTAF6XzdGynPzjJsa61qQqIWOXXdnz++SZRvzHgX+I+g01ta/JGvaSlb3DLbif1E2hp7b2aIniqV0nuodt4JHofKGE+tUISch185M9ZSY747myLL3yS9WF0eAMuLJc37N1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMHYDD9A+lR6571wOPRuTYkJlFlXCyA97piZGjRGtAE=;
 b=c4maC41uXXjhGNz1ubssyYF50jfnsIKD3w3EeywpD8QYrDQT4uY/Vx0L0g288KngoFfxt8nbef6sfpRjTBQZ2ncUWvWDypqVZbNYJNcH5EdknTabiZCovpgnBtzYC7A+48ipZdqchdi8MlzWwXcEH7VQNaWu383FN+f2fFL34Bj5lRt7BX6yasnCpuaOKCQCRXqqcV0nty2T3/+87h+StYku4N3dJfTazBD8dp97HCN/NwCRXNDzEHDh6sAB9I30/WxbQ+8hjgJdOx74crqdnGnrg2rnlOY3r8dBE+1lo86M6Q9fp62+hdw385jGXb6t9XnUiN6GZxKO96saKCbeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 20:12:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:12:20 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freexdesktop.org" <intel-gfx@lists.freexdesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 10/10] drm/xe: Kill xe_device_mem_access_{get*,put}
Thread-Topic: [PATCH 10/10] drm/xe: Kill xe_device_mem_access_{get*,put}
Thread-Index: AQHacCSxCMVz78Qd8k2ljxyZG7vuCbF7pMIAgAReBgA=
Date: Mon, 29 Apr 2024 20:12:20 +0000
Message-ID: <a14fbbfdd570713660666b96b78eccef9d3a7577.camel@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
 <20240307001554.162153-10-rodrigo.vivi@intel.com>
 <85r0ery4l7.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85r0ery4l7.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.0 (3.52.0-1.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|PH7PR11MB8249:EE_
x-ms-office365-filtering-correlation-id: eaa4b1a2-280f-40ad-ec17-08dc6888acfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?TTdpOHdjSi83MHhqaU43MlMwc0JYSkxpTjRMZVIrOXNWVitnUG43dXErWHVu?=
 =?utf-8?B?TjN1Z25ldVNPbFR0SmZMRHdnaURNS3ZDMWtmeGRKV3JadDVtTk54VTlGZXlX?=
 =?utf-8?B?VFNrb2VYQUdNSlJjV2dKaStza0hNWFRMY1ExNmIxeURkSEpJbTZMVUtPQUY2?=
 =?utf-8?B?TytMUzRPcU5XZkw5UWhLSm5RdEJNRkpBNkplZ2liV0MxRnN0QTVkaE16a3NE?=
 =?utf-8?B?OTVyN1lVdXlRMWNUYkprL251SDFCN3JMd3lJMzFaQ2puMXZyNllLZXh4WERy?=
 =?utf-8?B?OFBnNGRZN25rMkhTVUV6Sm1KRHRHTVhEbW1LVXZWQm51dzN3TDhKdFRKZHVy?=
 =?utf-8?B?T1BjWnVpS2F5UksxUFFKNVBrbFhqK1BLOGk5VlhOM0QwQ2V4SVdJTUNBdm1h?=
 =?utf-8?B?TzFkdVRZSEROTERTYTN1OGxsT0ZtK3F5cm9RbVN4WVFrYkdaSzhkdXdWUHVK?=
 =?utf-8?B?SnJ1eHJkSEF6QzJBd1UvQ2tDcFE5WCs5SnlRbVBOamRpNmlVY1MvcW9USWRR?=
 =?utf-8?B?VFB0NHc3RjJjYjFpTGE2REVMbDlVZGZEbU91N0syZllzbHdmQ0FodTdUN2U1?=
 =?utf-8?B?STV1WVdpYkt0cnV6TVpqSFc5dXh6Zlp2bkcvZlB2NjMrMzZLUVBWMFZNUkl2?=
 =?utf-8?B?Uk52TXJPRHpaM3ZrYUVtMU1Pb0lRUENQb2VtNW5ZOTduUStwTU8zblJ5cm40?=
 =?utf-8?B?SzBkeEltb0hhN05oOVREVUszQ0hYSjRmbHdQWExmbDlmdUNZeEJKcUtCWjFy?=
 =?utf-8?B?aTJESHRmU3pRK2J6WXBzeitySTdwejgwd1BpYkZMVlEyUmhDc3BxT2Z4eCt3?=
 =?utf-8?B?UjdlaXV2VEhmZkhWdHlzcnNhRk0zL1dMak1zaHRiY1BKVkRBOXVHQ3J1cmo0?=
 =?utf-8?B?YXFQOGNIek5CYTZYU0l1Wk5BMUNRcitmc0pvclhzd09kbzFvQlZEK3JuWjAx?=
 =?utf-8?B?VFVWeDJweGVxNG5Jazk5dzUwUzFPV3MvSVdXL1ltMlJzOUxOU0xicUY5MUEw?=
 =?utf-8?B?dWhOWXgvUno3Smd0U1FBQ3g2R2lyU2xIMzhUZklEYmFlTkpuYllQVEdYaVNL?=
 =?utf-8?B?UVNRWWo3N1pXKytmTjlxU2h0S1hNNGphYnQyWkRFNEZvY1pRVG9VMERQSFJk?=
 =?utf-8?B?Sll6ODI5L1VZRzkrckpWZFB4UDIzdnRsNTFwcjlkeVgwV0JveVlHaXVQa1dF?=
 =?utf-8?B?b1ZDeVZSZE9FT2RCbEFWb2ZncWF3TC8xU2pVK2JtMEF6bXlGUXhKcFR4MlFJ?=
 =?utf-8?B?eXh4RSt6TEdZeUs0SCt6YzhUalRCVHhvcW5kTGJCY0pycGtudCt1Q0w3dW8y?=
 =?utf-8?B?ajZwRHlIKzJ0ZTFzdXJxVFQ4THgxd1VZWkFtNGowOWNmdi9IbXZ3d1l1UUYr?=
 =?utf-8?B?NTZLdTU2cGVpcW9sYTNiQVZLTE9pa3h1S3puOTZjZW5jOWYwRVR3dTJFbXhU?=
 =?utf-8?B?YXM2TWVya0pRdUo0ZTBlZUZQZEVWdStVVTJCQUlQUm4yeDRWemVGeWk2NjB3?=
 =?utf-8?B?RXJsTGJQbzl5UXh3N2RkQUpycktrRWcxYVhhQ3lzOU1rYzlIOWJ1VnRka2JJ?=
 =?utf-8?B?VEpaeDViOVhoejhCQ1IxTk9tRGxtMDAvWnI4SUFJdmNKQU55MENlZlZ3MDI5?=
 =?utf-8?B?ZUtDOGJ3YWJXcGZNZU8vYlVoMzBUOGFKZEZFZ2s4V1I1SHFkdCs2cHNWSkha?=
 =?utf-8?B?dmxZQ2pZTjhNYThCZHl3QUtuZFNhMjFrdklRYy96TkE5MVR4S3UvWERBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0dURlp3RndsSTZwYVNmcHlzbDlaeFRMN2RuWSs2V1J4a2w4Y1ZZaHVYWWN3?=
 =?utf-8?B?UHBiZEFiU0lWRmp1UCtVOW5IMUcvbGx1aE43b3ZCOE9YbmRTUWp0OXIvbktY?=
 =?utf-8?B?cXRkRTJydVJ1N09iOHZUNUxDUlA0VGlkM3hwemNQaHpRVnNEVzQ3ZXJwaVhU?=
 =?utf-8?B?dERsV1c3RGxYQThqcitmd2ZiRmZWRjFxSjlER2VzbHRLZlBUcGRaUy9sTXQ5?=
 =?utf-8?B?RjNhWmtaV2gzWFU3ODVaMkk3TUNDTGFOWEpHM2lKS3ZMOHpYeTJTL200Y2VX?=
 =?utf-8?B?QUphRnNGUzJqNGNQSVVPbFEwaUhrNnpmT1RRUld1Z3JaTEtRMnRZZUtaTjlQ?=
 =?utf-8?B?NUZ6bGJlcS91dU5telk0VkE0OEJMeU5NUFlxaXdFREplcHRKY0dXYm51UFpa?=
 =?utf-8?B?L3Z4YkMwTS8raWVGdFdtcDVWSTl3b1hoNW1DcUIrUkZBaCtpbDcwOU5xczJ0?=
 =?utf-8?B?ZTNZdnlYVUZVTjZBTWhYNVU2b1ZlcFR2d3ZOWU5oSDZ4Mm1HMDRhRlNpZWts?=
 =?utf-8?B?NTU3TjNVclpNZjlURUlNWVJQNEl3ckVtVjFsQ3ZOU0lRNGlqbEdtWTU3Nllp?=
 =?utf-8?B?OGNFRDhOWENPZFNBWmx0ZnY4SW1Md25Oa2JPMGw2dkVqbjk4Wld5d0c3T0NM?=
 =?utf-8?B?L1Q4SU9HZnM4NkFDYk1VQjNMMzRnWXpyTlUvRjJrNmlVZGJlR0VuZWtHcnJT?=
 =?utf-8?B?ME05KzNCYUVIdGZuc1Jrd1NUZVVJaUNhcUt3T1NINGlXeGIxSGg5eE5jMHFU?=
 =?utf-8?B?RHlIY3lOTUVkSEF4UXN1MVNMQTVLYkVESDF1Z2YrYWYwdDRLY3hiSXRHZVlG?=
 =?utf-8?B?dlNPeC9iWUN4UDRLVXRyUng1ak9HOFRIM2g4OWxZUUZnaTZOY1JRbHd3QXMx?=
 =?utf-8?B?bzlXeHViaEFCQXgvRVpJVk5FRmp5Ni94UEJKbVZXUThaRGV2U0wyaHg0SHI4?=
 =?utf-8?B?ajVzdVE1Zk9aK1hFOGZhNTVjRlF2aUltNC9ZcENVSVJYRjRpNTgwVFpyZUdq?=
 =?utf-8?B?bWRnNis2WUY0QzMvVWh5SFpIby94d1FhZHM1UGNQTzdxT242ZmlWOXpUUlUw?=
 =?utf-8?B?cUJ5RUpnSkRkSENIa0lxS3p4TDBzUjJDbEdVZzlPK2tyVmlsMlc5cmxDYmJl?=
 =?utf-8?B?c0piQVhzRWQ5Um1QNHdpckY5aVgrM2xMMDBaZmJIdjdyZGFzOGEwMm5sNlNN?=
 =?utf-8?B?VWxJWVEvR0xwNEhxWU96YTMvZmVwQ05Cck9oN1ZlMHQ0azl5T3NHaUE5ekNl?=
 =?utf-8?B?MGlMVlpVd3MxV01DY2c0cytNUVlaRnhqc0NOQ29ORTkycGlVejNDblRieitS?=
 =?utf-8?B?SWxaVDcxczdNRjhsd3orS1JSZ29IOXF1alBmUWx4QWRWcWV3K1k5RSt2Yk9p?=
 =?utf-8?B?WlQ0K2lnMDdNN25sSktQc2JqNWhWSWx1NWVQcUxVS1YzUTlyTVpObmY1M3Ay?=
 =?utf-8?B?YTBvNlE2R0gyRW13UVl3VHN2RWVNNkJwZk5mUjF0MUZtTXBzZ3NiZnhqVWpC?=
 =?utf-8?B?cnc0VDI5VmhiaXpEUUhBSkY4MUp1K0o2Z25sQWhIdjU0aDcrMkJkVWF2cCs5?=
 =?utf-8?B?YVNxMkJmSlpVZTUwVmsyMHhveG1yYXZlR0lWeG8xeVRVOTNJOGhJMkdqaVhq?=
 =?utf-8?B?dW02OUNVQSt2YktMelVkOCt4L1Vrak8xb1dpQlpmTHRCYVlXQWJCRW5VZmhE?=
 =?utf-8?B?ajdVaUVmbGVWaUJLeXlydzEvNlAxdktaMDJOSlhYSHJERkg0TEdjZGxDQ2cw?=
 =?utf-8?B?NFFPQ0xXcFdmaEJwNnlmVDVRNm9mOVFHZGF2eDN3Z0dXeU9mU3NXNndFV0Qz?=
 =?utf-8?B?WUx1NitvRVNFZFBjVXVWOVVzOWJOOURmNCsrRTZFdVJKeUJZOE9lK0E2THZI?=
 =?utf-8?B?VDhpb0U3VXVucUdIVXNZVWF0eEsvTUhReEMvWkk2aFkxbXJhRmhnUzB3UkNX?=
 =?utf-8?B?OC83T2xYYitiQ0tZRzBybWRVVTRka3JRb1Q5QUxoRjZrSkFwY0Z5TmFwUk1I?=
 =?utf-8?B?blNlMjJ4ZDZ4eGNpZUdMelNWUlRkUFFheVZIVEFKY1A0bE00Mk5LMEtHQlZ2?=
 =?utf-8?B?ZTR2TXNZejJERzIyeGFpNWZ3eWMwZCtQYXpvOW9YeDdIZlJYa2ZRTGdBeWVE?=
 =?utf-8?B?dTVtcFZOTGhKMjFUSTA3N3lXTThYTEpsclczVWpQRjhxVk8zUnEwRGViMWll?=
 =?utf-8?B?MEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20F6224140F1924BB5DB725F0F784CE3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa4b1a2-280f-40ad-ec17-08dc6888acfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 20:12:20.6297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aaLoJvElZ26+D3zv+zCR5qQCxpLIvSI4NKy7a5B10LCk9SDoyExRXR/meql8pTv18vOozfysvXOrUiVaXvWJFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
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

T24gRnJpLCAyMDI0LTA0LTI2IGF0IDE4OjMwIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFdlZCwgMDYgTWFyIDIwMjQgMTY6MTU6NTQgLTA4MDAsIFJvZHJpZ28gVml2aSB3cm90
ZToNCj4gPiANCj4gDQo+IEhpIFJvZHJpZ28vTWF0dCwNCj4gDQo+ID4gQEAgLTQwOSwxNCArNDEw
LDE0IEBAIHN0YXRpYyBpbnQgX194ZV9nZ3R0X2luc2VydF9ib19hdChzdHJ1Y3QNCj4gPiB4ZV9n
Z3R0ICpnZ3R0LCBzdHJ1Y3QgeGVfYm8gKmJvLA0KPiA+IAlpZiAoZXJyKQ0KPiA+IAkJcmV0dXJu
IGVycjsNCj4gPiANCj4gPiAtCXhlX2RldmljZV9tZW1fYWNjZXNzX2dldCh0aWxlX3RvX3hlKGdn
dHQtPnRpbGUpKTsNCj4gPiArCXhlX3BtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKHRpbGVfdG9feGUo
Z2d0dC0+dGlsZSkpOw0KPiA+IAltdXRleF9sb2NrKCZnZ3R0LT5sb2NrKTsNCj4gPiAJZXJyID0g
ZHJtX21tX2luc2VydF9ub2RlX2luX3JhbmdlKCZnZ3R0LT5tbSwgJmJvLQ0KPiA+ID5nZ3R0X25v
ZGUsIGJvLT5zaXplLA0KPiA+IAkJCQkJwqAgYWxpZ25tZW50LCAwLCBzdGFydCwNCj4gPiBlbmQs
IDApOw0KPiA+IAlpZiAoIWVycikNCj4gPiAJCXhlX2dndHRfbWFwX2JvKGdndHQsIGJvKTsNCj4g
PiAJbXV0ZXhfdW5sb2NrKCZnZ3R0LT5sb2NrKTsNCj4gPiAtCXhlX2RldmljZV9tZW1fYWNjZXNz
X3B1dCh0aWxlX3RvX3hlKGdndHQtPnRpbGUpKTsNCj4gPiArCXhlX3BtX3J1bnRpbWVfcHV0KHRp
bGVfdG9feGUoZ2d0dC0+dGlsZSkpOw0KPiA+IA0KPiA+IAlyZXR1cm4gZXJyOw0KPiA+IMKgfQ0K
PiA+IEBAIC00MzQsNyArNDM1LDcgQEAgaW50IHhlX2dndHRfaW5zZXJ0X2JvKHN0cnVjdCB4ZV9n
Z3R0ICpnZ3R0LA0KPiA+IHN0cnVjdCB4ZV9ibyAqYm8pDQo+ID4gDQo+ID4gwqB2b2lkIHhlX2dn
dHRfcmVtb3ZlX25vZGUoc3RydWN0IHhlX2dndHQgKmdndHQsIHN0cnVjdCBkcm1fbW1fbm9kZQ0K
PiA+ICpub2RlKQ0KPiA+IMKgew0KPiA+IC0JeGVfZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KHRpbGVf
dG9feGUoZ2d0dC0+dGlsZSkpOw0KPiA+ICsJeGVfcG1fcnVudGltZV9nZXRfbm9yZXN1bWUodGls
ZV90b194ZShnZ3R0LT50aWxlKSk7DQo+ID4gCW11dGV4X2xvY2soJmdndHQtPmxvY2spOw0KPiA+
IA0KPiA+IAl4ZV9nZ3R0X2NsZWFyKGdndHQsIG5vZGUtPnN0YXJ0LCBub2RlLT5zaXplKTsNCj4g
PiBAQCAtNDQ0LDcgKzQ0NSw3IEBAIHZvaWQgeGVfZ2d0dF9yZW1vdmVfbm9kZShzdHJ1Y3QgeGVf
Z2d0dCAqZ2d0dCwNCj4gPiBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUpDQo+ID4gCXhlX2dndHRf
aW52YWxpZGF0ZShnZ3R0KTsNCj4gPiANCj4gPiAJbXV0ZXhfdW5sb2NrKCZnZ3R0LT5sb2NrKTsN
Cj4gPiAtCXhlX2RldmljZV9tZW1fYWNjZXNzX3B1dCh0aWxlX3RvX3hlKGdndHQtPnRpbGUpKTsN
Cj4gPiArCXhlX3BtX3J1bnRpbWVfcHV0KHRpbGVfdG9feGUoZ2d0dC0+dGlsZSkpOw0KPiANCj4g
RG8gX194ZV9nZ3R0X2luc2VydF9ib19hdCBhbmQgeGVfZ2d0dF9pbnNlcnRfYm8gbmVlZCBhIHJ1
bnRpbWVfcG0NCj4gcmVmZXJlbmNlDQo+IGhlbGQ/DQo+IA0KPiBJbiB0aGlzIHNlcmllczogaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjEwODQvDQo+IA0KPiBJIGFt
IG5vdCBob2xkaW5nIGEgcnVudGltZV9wbSByZWZlcmVuY2Ugd2hlbiB0aGVzZSBmdW5jdGlvbnMg
YXJlDQo+IGNhbGxlZCBhbmQNCj4gaXQgd2FzIGZpbmUgd2l0aCB4ZV9kZXZpY2VfbWVtX2FjY2Vz
c19nZXQvcHV0IChzZWUNCj4geGVfb2FfYWxsb2Nfb2FfYnVmZmVyL3hlX29hX2ZyZWVfb2FfYnVm
ZmVyIGlmIG5lZWRlZCkuIEJ1dCBhZnRlcg0KPiBjaGFuZ2luZw0KPiB0byB4ZV9wbV9ydW50aW1l
X2dldC9wdXQgSSBub3cgZ2V0IHRoaXMgV0FSTjoNCj4gDQo+IFsxMTYxNC4zNTYxNjhdIHhlIDAw
MDA6MDA6MDIuMDogTWlzc2luZyBvdXRlciBydW50aW1lIFBNIHByb3RlY3Rpb24NCj4gWzExNjE0
LjM1NjE4N10gV0FSTklORzogQ1BVOiAxIFBJRDogMTMwNzUgYXQNCj4gZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3BtLmM6NTQ5IHhlX3BtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKzB4NjAvMHg4MA0KPiBb
eGVdDQo+IC4uLg0KPiBbMTE2MTQuMzU2Mzc3XSBDYWxsIFRyYWNlOg0KPiBbMTE2MTQuMzU2Mzc5
XcKgIDxUQVNLPg0KPiBbMTE2MTQuMzU2MzgxXcKgID8gX193YXJuKzB4N2UvMHgxODANCj4gWzEx
NjE0LjM1NjM4N13CoCA/IHhlX3BtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKzB4NjAvMHg4MCBbeGVd
DQo+IFsxMTYxNC4zNTY0MzddwqAgPyByZXBvcnRfYnVnKzB4MWM3LzB4MWQwDQo+IFsxMTYxNC4z
NTY0NDJdwqAgPyBwcmJfcmVhZF92YWxpZCsweDE2LzB4MjANCj4gWzExNjE0LjM1NjQ0N13CoCA/
IGhhbmRsZV9idWcrMHgzYy8weDcwDQo+IFsxMTYxNC4zNTY0NTFdwqAgPyBleGNfaW52YWxpZF9v
cCsweDE4LzB4NzANCj4gWzExNjE0LjM1NjQ1M13CoCA/IGFzbV9leGNfaW52YWxpZF9vcCsweDFh
LzB4MjANCj4gWzExNjE0LjM1NjQ2MF3CoCA/IHhlX3BtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKzB4
NjAvMHg4MCBbeGVdDQo+IFsxMTYxNC4zNTY1MDddwqAgeGVfZ2d0dF9yZW1vdmVfbm9kZSsweDIy
LzB4ODAgW3hlXQ0KPiBbMTE2MTQuMzU2NTQ2XcKgIHhlX3R0bV9ib19kZXN0cm95KzB4ZWEvMHhm
MCBbeGVdDQo+IFsxMTYxNC4zNTY1NzldwqAgeGVfb2Ffc3RyZWFtX2Rlc3Ryb3krMHhmNy8weDEy
MCBbeGVdDQo+IFsxMTYxNC4zNTY2MjddwqAgeGVfb2FfcmVsZWFzZSsweDM1LzB4YzAgW3hlXQ0K
DQppbiB0aGlzIGNhc2UsIGFwcGFyZW50bHkgeGVfb2FfcmVsZWFzZSBpcyB0aGUgcmlnaHQgcGxh
Y2UgdG8gYWRkDQphIHhlX3BtX3J1bnRpbWVfe2dldCxwdXR9IHBhaXI/IQ0Kb3IgbWF5YmUgc29t
ZSBwbGFjZSBldmVuIG1vcmUgdG8gdGhlIG91dHNpZGUNCg0KPiBbMTE2MTQuMzU2NjczXcKgIF9f
ZnB1dCsweGExLzB4MmQwDQo+IFsxMTYxNC4zNTY2NzldwqAgX194NjRfc3lzX2Nsb3NlKzB4Mzcv
MHg4MA0KPiBbMTE2MTQuMzU2Njk3XcKgIGRvX3N5c2NhbGxfNjQrMHg2ZC8weDE0MA0KPiBbMTE2
MTQuMzU2NzAwXcKgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDcxLzB4NzkNCj4g
WzExNjE0LjM1NjcwMl0gUklQOiAwMDMzOjB4N2YyYjM3MzE0ZjY3DQo+IA0KPiBBbHNvLCB0aGUg
V0FSTiBhYm92ZSBoYXBwZW5zIG9ubHkgZm9yICdmcmVlJyBidXQgbm90IGZvciAnYWxsb2MnIChz
bw0KPiBub3QNCj4gc3VyZSB3aG8gZ2V0cyB0aGUgcnVudGltZV9wbSByZWZlcmVuY2UgZm9yICdh
bGxvYycpLg0KPiANCj4gSG9sZGluZyB0aGUgcnVudGltZV9wbSByZWZlcmVuY2UgYWNyb3NzIGFs
bG9jIGFuZCBmcmVlIHNlZW1zIHRvIGJlDQo+IGZpbmUgYW5kDQo+IG1ha2VzIHRoaXMgV0FSTiBk
aXNhcHBlYXIuIFNvIG1heWJlIEkgc2hvdWxkIGp1c3QgZG8gdGhhdD8gSnVzdA0KPiB0cnlpbmcg
dG8NCj4gY29uZmlybS4NCj4gDQo+IFRoYW5rcy4NCj4gLS0NCj4gQXNodXRvc2gNCg0K
