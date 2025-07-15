Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481C8C83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F7710E0BF;
	Tue, 15 Jul 2025 21:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGjLkdV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6002110E0BF
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752616426; x=1784152426;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mw1unW2eG9H3N/mxJZsHIeGjduAmjawH4ZeiKqv1wAA=;
 b=jGjLkdV46/1z9uY0ZdTFXq0O9uKFMArQOtTTgxwrIHds7pdFYPeRfN4N
 WFQ4Neewzc2hjNxUVPRMSlfKD51ysQ5Uc8Ik/aylYJWrCtkDZPYk8V7Ik
 3JxfydOMUkjgodQAh3UurBK+Dksf71tZmBjqa/D+TjXCrmI92v4soY6Yn
 7tW0yRk1lQGTVJAxJDwNvnaJlMFKIG9okn5XtNqumnPxL0hKZjFUqHKvk
 3t7Qb79ECEe9KKpSNz1M+MOeqXwPVRJKoVMHwlZMlyoLlMeU2ni3FFj40
 Ki6D+kk0l8yGLY3GKFHOH3t9L0/pKvtPZSSIc5m/c4BNq8LiC1VxDwDpZ g==;
X-CSE-ConnectionGUID: lXyI4X6jRUq70l3mqyaQVg==
X-CSE-MsgGUID: kZSnKFYdT4Gth9tXpnJlXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58618086"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="58618086"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:53:45 -0700
X-CSE-ConnectionGUID: 7iin05nkQ66cfixRBYi2BA==
X-CSE-MsgGUID: ULZWKLijQTO109D7UT9WlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="161354343"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:53:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:53:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 14:53:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:53:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeDPo4nX8TWI9egnzswoPzmpxadNkeHxpS7u0+va8+QUK+OrpVaCQvMePBIxTFTjdg8K8xgI5IIo178rvmPN89AKa+HYPXAL3/Fm5DgRzXjUhvQeYvK9XkUJV75dKLMjyqZoFHk9n+1Vb+rDw7Qc5WGtzRrkpF/YuK/XmjSxHckeKedOO/gYZM6rzkjl3jfLSoYJfvCk1Cued7bXEGi+PNyJ26EcCR+HAzO9NUeEaYfOZuUZFLGbRGqN1nv1CU/OoKx588AJ1lwDUD9a5SrhD/HFdJIbIjxYVS10RZbE1Hdb/TJEdQI6dsxeoJ44piQzXzCR6e2tDI6mzEEMcqA2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mw1unW2eG9H3N/mxJZsHIeGjduAmjawH4ZeiKqv1wAA=;
 b=GPCCG4SVqJVOP1EAkaRf6+XpV49jhtzxPCCI0YJJYddDH65jhSyArAISSSHORRGzAFNdjv8Ib+jY5D82UA4VjDBHEjjndhEpOcP3ZlOoLACM7m2gdBhDTVjOQDkG2eDTb5j/VVPMNrdhT4ED7a+eExuDPpDFKjVSUcS9VNv/31ggyeLizHPkvHAUJgEl+Xj2lP7ept3ms/lTOwOalJiT4XDmxIRvcBAr3vUrWh3+HIq7W9BN3tVZdrAe/f87UH8kHRr+Sip0W5nrc3R5pJdx3g5yMk5pWZTHmneogfaxeCAoUNXJCOhZU0mNQ8ovKGSqChWwv18oR3Isu3fRnDFZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.27; Tue, 15 Jul 2025 21:53:28 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 21:53:28 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Thread-Topic: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Thread-Index: AQHb66rFqWVNaJhCZUCtVTNEzEJrsbQzySWAgAACsYCAAACBgIAAAcMAgAAAWQA=
Date: Tue, 15 Jul 2025 21:53:27 +0000
Message-ID: <0a2e487bff470dd4184b2e044853ef730928e5a6.camel@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-6-matthew.brost@intel.com>
 <f70aa0a14c0a4c0e3fdc1570f42ca804705191c4.camel@intel.com>
 <aHbLpWs+xQT68C43@lstrano-desk.jf.intel.com>
 <a5faff54361576d0ba2eb30001122479f91a5756.camel@intel.com>
 <aHbNjNGwbz+GRy76@lstrano-desk.jf.intel.com>
In-Reply-To: <aHbNjNGwbz+GRy76@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN6PR11MB8241:EE_
x-ms-office365-filtering-correlation-id: de9245fa-184b-4086-d045-08ddc3ea07f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Um52ZDVRYTQvZWI2S0wxaFkzTGNVM3pPMUtwZktHV25HUFNlcUd2bnU0TjJk?=
 =?utf-8?B?aVp0THRNME5nejRVaWp0Um5palRLR2owcU1RRklMeUpJTFVpOFNmSTkrUVps?=
 =?utf-8?B?N3pjcDhFTEowMER4QlFQTnVrSWhKV2JGTHNFOG1CVU5lVlFNUEdkYW9GSHBE?=
 =?utf-8?B?cmU2YnpsMjV5VzJTajQxeVFMcUNlZG9GQnk4SCtrMGxwS052VXl6aC81bXNP?=
 =?utf-8?B?YmRkNE5PR0tKb0x1MEJVYW42Y2U0RDlyaGIxMFZXRzlDajRJWUJyY1AwbnZQ?=
 =?utf-8?B?RFJHU1J4cG5TemUxdVdVTzdYUEVrVW4vWWhIUnNtOVBucWZybDU0NUpQbFor?=
 =?utf-8?B?MjRPdkhkWTJyWlM3U21xRmpMMTVJYnBOWDRDUG9ra3UybmRwR09oVDlaVTdY?=
 =?utf-8?B?dlZDbnFXMkt6N3Zxc3BhYjVRZ2IvcnJhcW1vQTBCY0VTQ1BlL2RmbWp6YkJU?=
 =?utf-8?B?ejF2NmVhTlVaeXdzUTR6S3NISlg3VE1hTy95M3k4a3RRd0tLUlR0SHp0MUk0?=
 =?utf-8?B?SHZidVhmajk3MkFXOHNCbzdIUnBOQ3NxQWhxZnNILzFma1FDT01ldEtocVFj?=
 =?utf-8?B?VXI2ZHlLUWI3YUNxejZKN1QwT2grSjlJOTZadUFKVEs3TGVneVpLVWQ0S2x6?=
 =?utf-8?B?QlJOaFJkTXA3Y0pmeHhaVDdxbTVpWnVsN1lNSnU1Nlg1L2NtZnVBdnltWVph?=
 =?utf-8?B?bjR2V0ZCazErRmNacS80M3BBTm1Ha2NieWRrcWt1N2dlOXFyOXYzb0RSU0pl?=
 =?utf-8?B?R3QyMW5wcjA5QVVlL3BvMkQ2cG0ydHpYazNuTm9LdnNKM3pMdFlCTTdtOFBi?=
 =?utf-8?B?enFCS2RIakpFOS9qYy9LWjdITmNKenhZcC9SRFk0ZW9nLzlLeU1SQnpSTkk2?=
 =?utf-8?B?b2VwQUFsTnBHRUw1WmlVVmtxZXZOdC9OY0Q5azJyYTV2VE01dHJXVzYyWVps?=
 =?utf-8?B?NVBDTmN2MU5JSVJobk9oT21sT1Axb2d2UCtaME1WVEFYM1dCbzkvc2pGQ0pz?=
 =?utf-8?B?M3pNWUVtUUJFbzYrMVRrR2JUb0ZFMGQwWHhrSDU1R0U2TnFaRDFLejZ1VnpK?=
 =?utf-8?B?S2ZObk90VTJhajVoMnpSWkxXQldLU2Qzd3ZMaE15UnR4NUtQUDdvL1lrdmdM?=
 =?utf-8?B?M2ZOWW1TTGxDUk5hSUFTdVZhbkpiRmxXdlZXazhxYXdpS2RHSkRJMjFtWk5N?=
 =?utf-8?B?OEF6bXV6dkxCS3FmdnZrMVYwZ1BOdFlyWG5hcHhlUGx6MDNidlFQdlFtTEN1?=
 =?utf-8?B?d3J5c0FGdkZLa3JiTndlWEYrNEtqT0VrbFR3ZWcxNHpRMlpxSkFhdEo1VU81?=
 =?utf-8?B?TG5EdGpxem1vK1FaMXVZRTNvQzRLSGNJZHMzbkZ1c0FPZzF6SkNDT0MrMXNv?=
 =?utf-8?B?cUVOWnF0Z1RGSDFOL3ZUblFVandDVmVBMGQ3QlpCRzM2bnZDWTBhSllmTm1s?=
 =?utf-8?B?S24xMVZ6L3BGS3VYYnNUYzFnZTBTb2V6b29BSk90QkE0NnJGeFBEUEdWZ011?=
 =?utf-8?B?WlVCeWlFUjNYYndZVlU0aDNhUGxPYWxKLzl6cllnVEpvUU9RQjNVNVdVb3d5?=
 =?utf-8?B?NzM5ZXd0dEkvRWRDMGgwSzVydk9BMjVua2pxMkpobmZlUEE3NHpIUkt0SzhK?=
 =?utf-8?B?YXZXK2tqSEQ5R0pPUWNsbGZRU0tNUTBEYnZaZ3FsWGxpeHJLbHdvcmU2T0ow?=
 =?utf-8?B?OVZxejRySC96QXJMZ0pLWEVIS3NYUUhjME4yRjJURjFxMk9zRDlncFJIbnNk?=
 =?utf-8?B?b3Y1N3JVRXc4b2pQOUNlV05oaUhTZFg2Ykl3eVg4dVYxemorOVVRd01YY0ts?=
 =?utf-8?B?ZmhhcmgvWWdTdk0wWU9yTUthbnFEc0oxQXRHTWVvQjJVZnJnQWxSdWVyaklC?=
 =?utf-8?B?VnVGbm4zUlpLNXFHZDJLK1Y4OXI4dHRFMTJtVTZHMGU5YWYxNmc0UEJhTThh?=
 =?utf-8?B?L3JRMytEd0lybXExaHBhUGs2d1JIMUx1eFY5UVk4TFV2RVdqK2p1aGI3UnBM?=
 =?utf-8?B?d2Jxa0N5UkdBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnovMGovSzlOcG1SQUR5eDgvMDZsMEFWVmNTMDgrNWs0NEJIeGxFZm05UFAr?=
 =?utf-8?B?SnhLYnFRQVAwcURnL1ZOQlFJazB5eGttdjMyVTM3alFMMnN6ckxXcHlraTNv?=
 =?utf-8?B?UktEQmN5OXhZdXFCQXZ1aWFxbTgrTXByYnViZ2dWSjdoNnQ1bVRYZU9WaEQz?=
 =?utf-8?B?V0lSUk44ZFBwcDF6L1Y0MVorQUFoUEZpK2lyQUg4UFVsQjVsNjROV2d2Q29G?=
 =?utf-8?B?YmpwcTI0WXpzck5PNHRQcG9lUkd2bGw5U09LZEJDaHFkVUdGVWg5UTlNZnFN?=
 =?utf-8?B?TURVT2hSOHkwRUxSRjJwclVyb1NVeDRsUzVpemp2VjVzbElEVk9kbVBLM1Ez?=
 =?utf-8?B?MHUyV2hyTHFCS0pVekhHa2ZiZzlyemRRMis5d0xyZGlSNkI5WnJQYkVkTXFo?=
 =?utf-8?B?V3F2RDVRdU85UXZTbHpSZDlOZ3FHdkIwNmpwRHhyeHJqM2k4ODI4bUc1cHlE?=
 =?utf-8?B?Ni91cFhJdjB3ME9oSm1oYnV3RFdTSUFTQjBsdERIa3loRS9yVjRueHRIcWJi?=
 =?utf-8?B?OHBMUEl4d0FRMm9vUlJ3N0JZK0pxUTZpNzkzd3VLMXJveENTQ3ZiUzRrRUZU?=
 =?utf-8?B?c1hZK01acnJ6NTBwUXUyUUFDTXhvZ0U4MEZJbTFJQTg2MnFLdWFSY29YQldH?=
 =?utf-8?B?Rmg3aUtDVE9XdzBTUFo2ZmpsblI3REt5ZzNvVXdHNkEyRDZzQzMvMFk0YXgw?=
 =?utf-8?B?Q0FpVnYwSUtkeTltWDNNTXBKTWNnRTNGVnZaWUdIeC9IZWJXNFRqRUNRNktt?=
 =?utf-8?B?MUpQQTBqVkNObUJ0V3IvcllOSExjMUtDaWR3L2ZDVUY1NnB5NkdLZE84VFFJ?=
 =?utf-8?B?VWUyVnU5eHAxY3pHQWxyUWpIV0FXYmhDWVptaE1YZ0lPTHY2SCtSWjVUTkRK?=
 =?utf-8?B?eU81N0ZXSklqekNraW5qN2hRSlFhaGhNbW5DekxJRlo4eUJSNU5PTE9mZEt5?=
 =?utf-8?B?QjQ4cTNzZk1iaHE3R3I4cmwzVUtWKzArS2NQS1dubTIwMXk2YTFSTmVrbU1w?=
 =?utf-8?B?WnJlSDRNbG1UaWkxcFpJV3RzUVppdFFabUwwZ3I0ZWtYSjN6VWhpdEtaUFVF?=
 =?utf-8?B?TElsUTdEaDRpZ200dnJxeVFWcDY2N0NUTzFocmZySUQ1cEFJVTNuZllndXVv?=
 =?utf-8?B?Mnd0OEtpYVRsZDh5UVB6M2RwODE4Z3dmQ2ZDZkpWTW9xRWdXM3BVNjFSUTlU?=
 =?utf-8?B?eCtjeUsyMW41M240MDV1a2FlZlBGZ3ZwRzJuMjVlL3pTemVNaXAxeERVeXBG?=
 =?utf-8?B?MW92YlQ0V0dReS9QSk0zS1JtdlMzR1NKZ1pTUUF6c0c0ZkhGYTV3cHdDRE5O?=
 =?utf-8?B?VkJkRHF3MVl2N3lVNGpEU25LQllaYWIyaldzMmhxNkZ2eGhYYmQ0dGdtMWd3?=
 =?utf-8?B?L1padmN1WGV3eEViTXVrb2JzWkd1NXlCdEJrblMwV2kwVkYwZVYvekxHRjNI?=
 =?utf-8?B?MjR4Z1QzOFp2RWZGaWYvNERTRjlGVngxamhtMG03UStLbVJqYSs2a0dKcVdL?=
 =?utf-8?B?Sk9tSVBWWXJGZkthRE5GYUpnbzB5aXpZNEl4UDlTRDhiK3ZvWmVtdFlyTS9i?=
 =?utf-8?B?ZHc4SUEreXJpeEJaeWZCNkJKTjkrSTNDdnpIcUUxWG1XWHdDTWYyOEg2UkVa?=
 =?utf-8?B?TXhXMHpTbWtsR0E4TXlvVTZJTmZiR1BXWGd5eC91WjdZYmk4SDY5UUswZDZN?=
 =?utf-8?B?LzdZSFU3di9CRmdpYndya1k5N1ZtRVlHRGtlWlZXV2JqQWRCTTlKa3A4V2ZS?=
 =?utf-8?B?eDJmdXNESEd4WmhHQWNTMTAzQ3ZXU25yTVQ4ZmcwY1N6clZMeElCb2lubDhV?=
 =?utf-8?B?NVFpMk9qTXU5eGhWekxMTGVPcktUbWc0VmljbmpKcFBLUHBXYzNRQ1BMbU9I?=
 =?utf-8?B?NGE4MERKOU9CM2JtS2RIQVJBUjdrN1VFTkJjRjBGeFlQcGxJTGp2d2ZzbWJC?=
 =?utf-8?B?YlZLZzdUMWU1bVR5eldXRWFXeXNHeElldUZJNzE4azM5MjJVSTJRNGVNbU1y?=
 =?utf-8?B?MFBhSityNFRGY2hHdWg2QUczQTcvcG9yRWF0cXJVaS9WenhFeFQ3enVMVm1Q?=
 =?utf-8?B?cnBFdWZCZUZPekdmNkk2WkdMa2trTFhxR0piRHQyTHJNMHNoTE1aTW9jL3Vk?=
 =?utf-8?B?OXpWOWVKOGtFcnQyZ2VON0ZlamxCbnV0ekN4LzczcHFCTkNHYTJsb3VQWmd5?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27D6FA6BDF321848966B2BDCECB1F2BC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9245fa-184b-4086-d045-08ddc3ea07f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 21:53:27.9503 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qUZcqFVU/LNxNHLCR2FdD+dORabtLEbh2KCpQkvexGUF8/hB9fGq8pXZyPubEokXnVhDB32tY03MVktsCnXKSa4xzymQZuVRA/y/7jhU27M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
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

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDE0OjUyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDE1LCAyMDI1IGF0IDAzOjQ1OjU1UE0gLTA2MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+IE9uIFR1ZSwgMjAyNS0wNy0xNSBhdCAxNDo0NCAtMDcwMCwgTWF0dGhldyBC
cm9zdCB3cm90ZToKPiA+ID4gT24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgMDM6MzQ6MjlQTSAtMDYw
MCwgU3VtbWVycywgU3R1YXJ0IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgMjAyNS0wNy0wMiBhdCAx
Njo0MiAtMDcwMCwgTWF0dGhldyBCcm9zdCB3cm90ZToKPiA+ID4gPiA+IEFkZCBhIGdlbmVyaWMg
ZGVwZW5kZW5jeSBzY2hlZHVsZXIgZm9yIEdUIFRMQiBpbnZhbGlkYXRpb25zLAo+ID4gPiA+ID4g
dXNlZAo+ID4gPiA+ID4gdG8KPiA+ID4gPiA+IHNjaGVkdWxlIGpvYnMgdGhhdCBpc3N1ZSBHVCBU
TEIgaW52YWxpZGF0aW9ucyB0byBiaW5kIHF1ZXVlcy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gdjI6
Cj4gPiA+ID4gPiDCoC0gVXNlIHNoYXJlZCBHVCBUTEIgaW52YWxpZGF0aW9uIHF1ZXVlIGZvciBk
ZXAgc2NoZWR1bGVyCj4gPiA+ID4gPiDCoC0gQnJlYWsgYWxsb2NhdGlvbiBvZiBkZXAgc2NoZWR1
bGVyIGludG8gaXRzIG93biBmdW5jdGlvbgo+ID4gPiA+ID4gwqAtIEFkZCBkZWZpbmUgZm9yIG1h
eCBudW1iZXIgdGxiIGludmFsaWRhdGlvbnMKPiA+ID4gPiA+IMKgLSBTa2lwIG1lZGlhIGlmIG5v
dCBwcmVzZW50Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIEhlbGxz
dHLDtm0KPiA+ID4gPiA+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29t
Pgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1
ZXVlLmPCoMKgwqDCoMKgwqAgfCA0OAo+ID4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPiA+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmggfCAx
MyArKysrKysrCj4gPiA+ID4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQo+
ID4gPiA+ID4gCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4
ZWNfcXVldWUuYwo+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5j
Cj4gPiA+ID4gPiBpbmRleCBmZWUyMjM1OGNjMDkuLjdhYWY2NjljZjVmYyAxMDA2NDQKPiA+ID4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMKPiA+ID4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMKPiA+ID4gPiA+IEBAIC0xMiw2
ICsxMiw3IEBACj4gPiA+ID4gPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiA+ID4gPiA+
IMKgI2luY2x1ZGUgPHVhcGkvZHJtL3hlX2RybS5oPgo+ID4gPiA+ID4gwqAKPiA+ID4gPiA+ICsj
aW5jbHVkZSAieGVfZGVwX3NjaGVkdWxlci5oIgo+ID4gPiA+ID4gwqAjaW5jbHVkZSAieGVfZGV2
aWNlLmgiCj4gPiA+ID4gPiDCoCNpbmNsdWRlICJ4ZV9ndC5oIgo+ID4gPiA+ID4gwqAjaW5jbHVk
ZSAieGVfaHdfZW5naW5lX2NsYXNzX3N5c2ZzLmgiCj4gPiA+ID4gPiBAQCAtMzksNiArNDAsMTIg
QEAgc3RhdGljIGludAo+ID4gPiA+ID4gZXhlY19xdWV1ZV91c2VyX2V4dGVuc2lvbnMoc3RydWN0
Cj4gPiA+ID4gPiB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZQo+ID4gPiA+ID4g
wqAKPiA+ID4gPiA+IMKgc3RhdGljIHZvaWQgX194ZV9leGVjX3F1ZXVlX2ZyZWUoc3RydWN0IHhl
X2V4ZWNfcXVldWUgKnEpCj4gPiA+ID4gPiDCoHsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlu
dCBpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8
IFhFX0VYRUNfUVVFVUVfVExCX0lOVkFMX0NPVU5UOyArK2kpCj4gPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHEtPnRsYl9pbnZhbFtpXS5kZXBfc2NoZWR1bGVyKQo+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9kZXBfc2NoZWR1bGVyX2ZpbmkocS0KPiA+ID4gPiA+ID4gdGxiX2ludmFsW2ldLmRlcF9zY2hl
ZHVsZXIpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICh4ZV9leGVj
X3F1ZXVlX3VzZXNfcHhwKHEpKQo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB4ZV9weHBfZXhlY19xdWV1ZV9yZW1vdmUoZ3RfdG9feGUocS0+Z3QpLQo+ID4gPiA+ID4g
PnB4cCwKPiA+ID4gPiA+IHEpOwo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChxLT52bSkK
PiA+ID4gPiA+IEBAIC01MCw2ICs1NywzOSBAQCBzdGF0aWMgdm9pZCBfX3hlX2V4ZWNfcXVldWVf
ZnJlZShzdHJ1Y3QKPiA+ID4gPiA+IHhlX2V4ZWNfcXVldWUgKnEpCj4gPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKga2ZyZWUocSk7Cj4gPiA+ID4gPiDCoH0KPiA+ID4gPiA+IMKgCj4gPiA+ID4gPiAr
c3RhdGljIGludCBhbGxvY19kZXBfc2NoZWR1bGVycyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3Ry
dWN0Cj4gPiA+ID4gPiB4ZV9leGVjX3F1ZXVlICpxKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV90aWxlICp0aWxlID0gZ3RfdG9fdGlsZShxLT5ndCk7Cj4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpbnQgaTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBYRV9FWEVDX1FVRVVFX1RMQl9JTlZBTF9DT1VOVDsg
KytpKSB7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X2RlcF9zY2hlZHVsZXIgKmRlcF9zY2hlZHVsZXI7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpndDsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqd3E7Cj4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGkgPT0gWEVfRVhF
Q19RVUVVRV9UTEJfSU5WQUxfUFJJTUFSWV9HVCkKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3QgPSB0aWxlLT5wcmltYXJ5X2d0Owo+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiA+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3QgPSB0aWxlLT5tZWRp
YV9ndDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAoIWd0KQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjb250aW51ZTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB3cSA9IGd0LT50bGJfaW52YWxpZGF0aW9uLmpvYl93cTsKPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ICsjZGVmaW5lIE1BWF9UTEJfSU5WQUxfSk9CU8KgwqDCoMKgwqAxNsKg
wqDCoMKgwqDCoC8qIFBpY2tpbmcgYQo+ID4gPiA+ID4gcmVhc29uYWJsZQo+ID4gPiA+ID4gdmFs
dWUKPiA+ID4gPiA+ICovCj4gPiA+ID4gCj4gPiA+ID4gU28gaWYgd2UgZXhjZWVkIHRpaHMgbnVt
YmVyLCB0aGF0IG1lYW5zIHdlIHdvbid0IGdldCBhbgo+ID4gPiA+IGludmFsaWRhdGlvbiBvZgo+
ID4gPiA+IHRoYXQgcmFuZ2UgYmVmb3JlIGEgY29udGV4dCBzd2l0Y2ggdG8gYSBuZXcgcXVldWU/
Cj4gCj4gU29ycnkgbWlzc2VkIHRoaXMuCj4gCj4gTm8uIFRoaXMgaXMganVzdCBtYXhpbXVtIG51
bWJlciBvZiBUTEIgaW52YWxpZGF0aW9ucywgb24gdGhpcyBxdWV1ZSwKPiB3aGljaCBjYW4gYmUg
aW5mbGlnaHQgdG8gdGhlIGhhcmR3YXJlIGF0IG9uY2UuIElmIE1BWF9UTEJfSU5WQUxfSk9CUwo+
IGlzCj4gZXhjZWVkZWQsIHRoZSBzY2hlZHVsZXIganVzdCBob2xkcyBqb2JzIHVudGlsIHByaW9y
IG9uY2VzIGNvbXBsZXRlCj4gYW5kCj4gbW9yZSBqb2IgY3JlZGl0cyBiZWNvbWUgYXZhaWxhYmxl
Lgo+IAo+IENvbnRleHQgc3dpdGNoaW5nIG9yIG90aGVyIHF1ZXVlcyBhcmUgbm90IHJlYWxseSBy
ZWxhdGVkIGhlcmUuIFRoaW5rCj4gb2YKPiB0aGlzIGEgRklGTyBpbiB3aGljaCBvbmx5IE1BWF9U
TEJfSU5WQUxfSk9CUyBjYW4gYmUgb3V0c3RhbmRpbmcgYXQKPiB0aW1lLgoKR290IGl0LiBTbyBi
YXNpY2FsbHkgc3VtbWFyaXppbmcsIGlmIEkgd2VyZSB0byBzdWJtaXQgMTcgVExCCmludmFsaWRh
dGlvbnMgYXQgb25jZSAoYmVmb3JlIGhhcmR3YXJlIGNvbXBsZXRlZCBhbnkgb25lIG9mIHRob3Nl
KQp0aGVvcmV0aWNhbGx5LCBmb2xsb3dlZCBieSBhIHN1Ym1pc3Npb24gZnJvbSB1c2Vyc3BhY2Ug
b24gYSBuZXcKY29udGV4dCwgdGhlIHNjaGVkdWxlciB3b3VsZCBzdGlsbCBhY2NlcHQgdGhlc2Us
IGJ1dCB3b3VsZCBvbmx5IHN1Ym1pdAp0aGUgZmlyc3QgMTYgdG8gaGFyZHdhcmUuIEl0IHdvdWxk
IHRoZW4gc3VibWl0IHRoZSAxN3RoIG9uY2UgYSBoYXJkd2FyZQpzbG90IGJlY2FtZSBhdmFpbGFi
bGUsIHRoZW4gZmluYWxseSB0aGF0IG5ldyB1c2VyIGNvbnRleHQuIElzIHRoYXQKcmlnaHQ/CgpU
aGFua3MsClN0dWFydAoKPiAKPiBNYXR0Cj4gCj4gPiA+ID4gCj4gPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZGVwX3NjaGVkdWxlciA9IHhlX2RlcF9zY2hlZHVsZXJfY3Jl
YXRlKHhlLAo+ID4gPiA+ID4gd3EsCj4gPiA+ID4gPiBxLQo+ID4gPiA+ID4gPiBuYW1lLAo+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgTUFYX1QKPiA+ID4gPiA+IExCX0kKPiA+ID4gPiA+IE5WQUwKPiA+ID4gPiA+IF9KT0JTKTsK
PiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGRlcF9z
Y2hlZHVsZXIpKQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gUFRSX0VSUihkZXBfc2NoZWR1bGVyKTsKPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBxLT50bGJfaW52YWxbaV0uZGVw
X3NjaGVkdWxlciA9Cj4gPiA+ID4gPiBkZXBfc2NoZWR1bGVyOwo+ID4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgfQo+ID4gPiA+ID4gKyN1bmRlZiBNQVhfVExCX0lOVkFMX0pPQlMKPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gPiA+ID4gK30KPiA+ID4gPiA+
ICsKPiA+ID4gPiA+IMKgc3RhdGljIHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpfX3hlX2V4ZWNfcXVl
dWVfYWxsb2Moc3RydWN0Cj4gPiA+ID4gPiB4ZV9kZXZpY2UKPiA+ID4gPiA+ICp4ZSwKPiA+ID4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0Cj4g
PiA+ID4gPiB4ZV92bQo+ID4gPiA+ID4gKnZtLAo+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIKPiA+ID4gPiA+IGxvZ2ljYWxfbWFzaywKPiA+
ID4gPiA+IEBAIC05NCw2ICsxMzQsMTQgQEAgc3RhdGljIHN0cnVjdCB4ZV9leGVjX3F1ZXVlCj4g
PiA+ID4gPiAqX194ZV9leGVjX3F1ZXVlX2FsbG9jKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLAo+ID4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcS0+c2NoZWRfcHJvcHMucHJpb3JpdHkgPQo+ID4gPiA+ID4gWEVfRVhFQ19R
VUVVRV9QUklPUklUWV9OT1JNQUw7Cj4gPiA+ID4gCj4gPiA+ID4gV2Ugd2FudCB0aGVzZSB0byBi
ZSBoaWdoIHByaW9yaXR5IHJpZ2h0PyBJLmUuIGlmIGFub3RoZXIgdXNlcgo+ID4gPiA+IGNyZWF0
ZXMgYQo+ID4gPiA+IHF1ZXVlIGFuZCBzdWJtaXRzIGF0IGhpZ2ggcHJpb3JpdHkgY2FuIHdlIGdl
dCBzdGFsZSBkYXRhIG9uCj4gPiA+ID4gdGhvc2UKPiA+ID4gPiBleGVjdXRpb25zIGlmIHRoaXMg
b25lIGlzIGJsb2NrZWQgYmVoaW5kIHRoYXQgaGlnaCBwcmlvcml0eQo+ID4gPiA+IG9uZT8KPiA+
ID4gCj4gPiA+IEknbSBzdHJ1Z2dsaW5nIHdpdGggZXhhY3RseSB3aGF0IHlvdSBhcmUgYXNraW5n
IGhlcmUuCj4gPiA+IAo+ID4gPiBUaGUgcS0+c2NoZWRfcHJvcHMucHJpb3JpdHkgaXMgcHJpb3Jp
dHkgb2YgZXhlYyBxdWV1ZSBiZWluZwo+ID4gPiBjcmVhdGVkCj4gPiA+IGFuZCBpcyBleGlzdGlu
ZyBjb2RlLiBJbiB0aGUgY2FzZSBvZiBiaW5kIHF1ZXVlcyAoaS5lLiwgb25lcyB0aGF0Cj4gPiA+
IGNhbGwgYWxsb2NfZGVwX3NjaGVkdWxlcnMpIHRoaXMgbWFwcyB0byBwcmlvcml0eSBvZiB0aGUg
R3VDCj4gPiA+IGNvbnRleHQKPiA+ID4gd2hpY2ggcnVucyBiaW5kIGpvYnMgb24gYSBoYXJkd2Fy
ZSBjb3B5IGVuZ2luZS4gCj4gPiA+IAo+ID4gPiBkZXBfc2NoZWR1bGVycyBkbyBub3QgaGF2ZSBw
cmlvcml0eSwgYXQgbGVhc3QgdGhhdCBpcyB1c2VkIGluIGFueQo+ID4gPiB3YXkuCj4gPiA+IFRo
aXMgaXMganVzdCBzb2Z0d2FyZSBxdWV1ZSB3aGljaCBydW5zIFRMQiBpbnZhbGlkYXRpb25zIG9u
Y2UgdGhlCj4gPiA+IGJpbmQKPiA+ID4gam9icyBjb21wbGV0ZS4KPiA+ID4gCj4gPiA+IHdydCBo
aWdoIHByaW9yaXR5IHBhc3NpbmcgbG93ZXIgcHJpb3JpdHkgb25lcywgdGhhdCBpc24ndAo+ID4g
PiBwb3NzaWJsZSBpZgo+ID4gPiB0aGVyZSBpcyBhIGRlcGVuZGVuY3kgY2hhaW4uIFRoZSBkcml2
ZXIgaG9sZHMgYW55IGpvYnMgaW4gdGhlIEtNRAo+ID4gPiB1bnRpbAo+ID4gPiBhbGwgZGVwZW5k
ZWNpZXMgYXJlIHJlc29sdmVkIC0gaGlnaCBwcmlvcml0eSBxdWV1ZXMganVzdCBnZXQKPiA+ID4g
c2VydmljZWQKPiA+ID4gYnkKPiA+ID4gdGhlIEd1QyBvdmVyIGxvdyBwcmlvcml0eSBxdWV1ZXMg
aWYgYm90aCBxdWV1ZXMgaGF2ZSBydW5uYWJsZQo+ID4gPiBqb2JzLgo+ID4gPiAKPiA+ID4gVEw7
RFIgbm90aGluZyBpcyBwYXRjaCBjaGFuZ2VzIGFueXRoaW5nIHdydCB0byBwcmlvcml0aWVzLgo+
ID4gCj4gPiBZb3UncmUgcmlnaHQgSSB0aGluayBJIHJlYWQgdGhpcyB3cm9uZyBzb21laG93IDoo
LCBpZ25vcmUgbXkKPiA+IGNvbW1lbnQhCj4gPiAKPiA+IFN0aWxsIHRoZSBtaW5vciBxdWVzdGlv
biBhYm92ZSBhYm91dCB0aGUgbWF4IG51bWJlciBvZiBkZXBlbmRlbmN5Cj4gPiBqb2JzCj4gPiB3
aGVuIHlvdSBoYXZlIHRpbWUuCj4gPiAKPiA+IFRoYW5rcywKPiA+IFN0dWFydAo+ID4gCj4gPiA+
IAo+ID4gPiBNYXR0Cj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiBTdHVh
cnQKPiA+ID4gPiAKPiA+ID4gPiA+IMKgCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAocS0+
ZmxhZ3MgJiAoRVhFQ19RVUVVRV9GTEFHX01JR1JBVEUgfAo+ID4gPiA+ID4gRVhFQ19RVUVVRV9G
TEFHX1ZNKSkgewo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9
IGFsbG9jX2RlcF9zY2hlZHVsZXJzKHhlLCBxKTsKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoZXJyKSB7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9feGVfZXhlY19xdWV1ZV9mcmVlKHEpOwo+ID4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
RVJSX1BUUihlcnIpOwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0K
PiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+ID4gPiA+ICsKPiA+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqBpZiAodm0pCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHEtPnZtID0geGVfdm1fZ2V0KHZtKTsKPiA+ID4gPiA+IMKgCj4gPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaAo+ID4gPiA+ID4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5oCj4gPiA+ID4gPiBpbmRleCBh
YmRmNGE1N2U2ZTIuLmJhNDQzYTQ5N2IzOCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgKPiA+ID4gPiA+IEBAIC0xMzQsNiArMTM0
LDE5IEBAIHN0cnVjdCB4ZV9leGVjX3F1ZXVlIHsKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IGxpc3RfaGVhZCBsaW5rOwo+ID4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoH0gbHI7Cj4gPiA+ID4gPiDCoAo+ID4gPiA+ID4gKyNkZWZpbmUgWEVfRVhFQ19RVUVV
RV9UTEJfSU5WQUxfUFJJTUFSWV9HVMKgwqDCoMKgwqAwCj4gPiA+ID4gPiArI2RlZmluZSBYRV9F
WEVDX1FVRVVFX1RMQl9JTlZBTF9NRURJQV9HVMKgwqDCoMKgwqDCoMKgMQo+ID4gPiA+ID4gKyNk
ZWZpbmUKPiA+ID4gPiA+IFhFX0VYRUNfUVVFVUVfVExCX0lOVkFMX0NPVU5UwqDCoMKgwqDCoMKg
wqDCoMKgwqAoWEVfRVhFQ19RVUVVRV9UTEJfSU5WCj4gPiA+ID4gPiBBTF9NCj4gPiA+ID4gPiBF
RElBCj4gPiA+ID4gPiBfR1TCoCArIDEpCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqAvKiogQHRsYl9pbnZhbDogVExCIGludmFsaWRhdGlvbnMgZXhlYyBxdWV1ZSBzdGF0ZSAq
Lwo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHsKPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAvKioKPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKiBAdGxiX2ludmFsLmRlcF9zY2hlZHVsZXI6IFRoZSBUTEIKPiA+ID4gPiA+IGlu
dmFsaWRhdGlvbgo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGRl
cGVuZGVuY3kgc2NoZWR1bGVyCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICovCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhl
X2RlcF9zY2hlZHVsZXIgKmRlcF9zY2hlZHVsZXI7Cj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqB9
IHRsYl9pbnZhbFtYRV9FWEVDX1FVRVVFX1RMQl9JTlZBTF9DT1VOVF07Cj4gPiA+ID4gPiArCj4g
PiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLyoqIEBweHA6IFBYUCBpbmZvIHRyYWNraW5nICovCj4g
PiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHsKPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgLyoqIEBweHAudHlwZTogUFhQIHNlc3Npb24gdHlwZSB1c2VkIGJ5
IHRoaXMKPiA+ID4gPiA+IHF1ZXVlICovCj4gPiA+ID4gCj4gPiAKCg==
