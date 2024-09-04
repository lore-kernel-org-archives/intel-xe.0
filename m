Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD06CD3431
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 10:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4112310E740;
	Wed,  4 Sep 2024 10:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hus+1Xfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301DE10E740
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725444765; x=1756980765;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lvw5Zo1txzALFvqeJwlek3gk42gyjTT1WfPYYATidps=;
 b=Hus+1XfwF/CAW691a9dYUWOdG9DhXuH6/G7zfvp8hxCrGha52y694f1o
 H/IED8zFrYTSO6y66EgPcHcgED8O55kdvGDsJrG3MpL+XFnG/I4dzyHb/
 DPNKcWO4XDWrBfviwI3HidxzNizVS8Ix5EGLFFZaaj1wzuEJfaUmaSLyD
 23jfVq7WsO9cpPdgzfUMsPZ84dN1UhtI27vS3bKF4fmezQfAalrCIlIjj
 L/bkXt7g10RpFtZSpjBNQH05CpwMRbrQuR64MltuKQmBAH3lt8HaPZUnD
 tYEJg01lTRwc+C6WVM+NomURPYEUaH9EPuTm83jdYYzQDbYMgUomIXha2 w==;
X-CSE-ConnectionGUID: BVN+TfrVT2CP4W3Itt/JMA==
X-CSE-MsgGUID: AAQ0XzIFQ+mBh1TyKN92vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35484260"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="35484260"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 03:12:45 -0700
X-CSE-ConnectionGUID: 7U2kwQa4RQG5oSuorUkZNg==
X-CSE-MsgGUID: me0eFmsSS3qcB37Ccw1Ejg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65054828"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 03:12:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 03:12:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 03:12:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 03:12:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 03:12:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xG6TvGxAXdpbSWfExdLvGVNdUz6wgJiqYJecwgA0Eu65BczFuigPj/RfIiQQbAbYvuI6dUTLbGmGYKDRSe3HZOSBIfdoGJSeTIJ47GB6RsdBOoLoJCrp1AEjZg89hgS937qPdYYP4lod+0itjpaXw9oye0MCGzy5KE3ChAbgEeNorqWZxVrLXl6nxwuMIz4Vrve7t8fuB/lJTl3tVgvXyi0jSy3s320diTUWaTV9zldHyCLwxbQl/4cLchQwSywZwgGkH8PqZZ5M6et0TDUcGTZZCAMj4EUFw0YzVRbqDLfZWNKOAOTCr/LyKiTNrBOBr91FZPJnJr204rw7S3SKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bdh1ZYOjEmurdgKMwud1ix7Wo2m9musEGJlh2i2+zM8=;
 b=dmJUQWw9N+wC1mGOHWWKm+uNs5dmxI8myi9zZxfC5GkIo93/zTRQZSkRl6zWnhYuWSFN+6P9dsKw6cH6Gbtv9D5SYWEMccLW4qbZBUnzW808OTlFpyL7OAn88Sn3220qIJCOhrBuMqCUF84Rm67wOd1WN7bAfKzQY+CXcPJYbFuVnIFfnrPhjOBte86i1Pk9ynVavHbW6MaXDf4TWj+O8oCdYBTGKJ+cShD3l/0VJBLD4UEcq6EIi7Hq6pOtFMDzMugaJiggUKC16+0yA/ASNlz2WSXa2JRdBHphrzCHIQGBWi/PHHOwXTe4eI89/AQZ+0bKpqCIXCCgzSEBfE886Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 10:12:41 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 10:12:41 +0000
Message-ID: <1d92dd5c-79b4-4a74-be9b-3e2bf7440d82@intel.com>
Date: Wed, 4 Sep 2024 15:42:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/xe/xe2hpg: Add Wa_15016589081
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>
References: <20240904101333.2049655-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240904101333.2049655-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f71c314-6eb2-4366-d5bf-08dcccca1ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHF5azhLa2RBbVRwaTNRUzhsYVdqOGVpMWs0Z0Q0WTlCc1c2dDB6SXgwODM4?=
 =?utf-8?B?RXhrL2UwNTRqdm5MODNydElJWlR0VzRhWnZjaGY2S1U2dDdGUFRPampYcU9V?=
 =?utf-8?B?ZmFQajhybjVINzhod3hmSUJya2kxN2ZON3JtbGdpUU9ZZDFZclU2VlJTc0Zm?=
 =?utf-8?B?elk2R0l2Qk56eW1uL3puWG01Yy94K0laVjE3TktTR3NoN1JzbUo4MmFnU3Ra?=
 =?utf-8?B?WXRDV2lOSXk4UE1HUE9kTVZIMW9mcE1rYWdvWHBIVVlrUjRYWFFXMk1nek5B?=
 =?utf-8?B?N0xldUExRURoR2F1UnBFODM2djlKSFFtcC9LZlRGVEJuVlo5QUhBN1pwbnFK?=
 =?utf-8?B?cVhjVkN6dXp2MHBYbVhkSjhQN0pZY2JrV1hxMldkdjQ2U2R5dXBoZVhMdmhN?=
 =?utf-8?B?TllPNXlVYUFHOFNsWTUvYWQ4VWU5RXlEWGRtRmhybCs1SDVSK01DeHRUNEVB?=
 =?utf-8?B?WEhrMlpFa3V1b0VyZVNnYVJwQU14YU1jUGF2TVU2V2x6bE90OS9ubVpsMW1y?=
 =?utf-8?B?L0pNRnBHQ3V3Zk5tUllrb1V5UHY1bE5OMkZkMjhvQVZ6K2tidjR4NDlncjQ0?=
 =?utf-8?B?Z1JLdTRxTFZGelJSck5aQW5pOFFnNDIvMzU5djBEMzJ3Q1lLYitMMm8xWEM0?=
 =?utf-8?B?Zi9zRTRpUUJGdElseGV0SjNGRXRFTk9zazF1bEVZQS8vSHNIaVNKeGNSb21F?=
 =?utf-8?B?RVZPZ3p4YVpBMDhVcjJDKy9wWWlvVlFrMFdUWXg3VGxKQUVRZjE4ei80N25R?=
 =?utf-8?B?T0wwK29XbE4wNndaZUI5U2k5d3A5YVBnd1FlMmh4N0UzRncxbG5wRitlQ29N?=
 =?utf-8?B?azNSRGx6K3pxQ3JFcXI3TGJKYkpJS3psblpqL0o1N0gzVVNxZUVJanV6aTlk?=
 =?utf-8?B?Z01kbWR2VnZjRmRWMXVHU3VITUFPNTJET0F5TjZKMXo3c0o4a2Y5QzkyQWI2?=
 =?utf-8?B?S2JTWDFQM1hkRDMwdGkxa1NEeVFuQlo0a0pMenZpREhsNU1na1RudzhDc1Nj?=
 =?utf-8?B?Yk1LajZ3RkU1ZkNOcXRmdnpHNm1TcWVnRzRhOUpndFF5K1BsVGZhSEoxc0Ju?=
 =?utf-8?B?ZEhOUHVaOGEwMU44SHJCNUU4K1pEdzJGT0ozOS9scWo5NEprekhKTEN0WTA2?=
 =?utf-8?B?RXM1ZHRzeGhIQTIxL3dkRzBUWWtMd2ZuNXl0aHNLS2hST0RZVW9Fb3BQcU5T?=
 =?utf-8?B?UGtMZU04Wm5KcTJsWThCVjhXL3k1YlhDNkJHYU11VFQzdTZpQWRoM1dIMHIx?=
 =?utf-8?B?MDVLYXdFYUtLdW9XTUxGc25Da3YzSGNYSTF2L1I4M3pDaFRyeWFVa2h0U1FD?=
 =?utf-8?B?Z2dpdi9zQW1CZFpTQkdWajB3ZkR6TWRkYng3eGhhWWd4MTkwQzZqNklKOWtq?=
 =?utf-8?B?SHk2YXphUkMwL3lXSEJBUDVyL09MRG9tV3pjN2E4QW84ajQxa3NDWktDRzF0?=
 =?utf-8?B?VjR0amdzd1VCRzlJM3RMU1FzV1JjZ05KS3J6ZWticHd6TDZ2RDhwOW5YaXNp?=
 =?utf-8?B?K0JJV0FzRUZ0Nm1BeGZ5OVBLbHZoZ05pZTg0ZWF6UkRrWHBxOUFkS1o2NEIz?=
 =?utf-8?B?YzdxcHhRVnJnQWJPQXM4elJMaS9iSDUzUHNFNXpJNDQwd2N5bkVtNERqM0dq?=
 =?utf-8?B?N0V2NVVNaEJxZ0gzdkM1NUJ5UThzUW82dENEbFlrMTZROUpqUWhIZS9vN2h6?=
 =?utf-8?B?S2czTEM3ZHdlL2h5Qmw3ZXRXMlBnZHYyR0lMOWNvSWpFUFgzRGo1anhYVGRq?=
 =?utf-8?B?ZDlSczlNMDhvK3dGdUMyYVc1alUva3FJdEZTOVNRK01LaWlqMlk5MGpmS04r?=
 =?utf-8?B?d2RHcHVVaEdxVkR4Z09QUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFRKcXVQN2hWNGVZYmYvS2hxNHJxbTZJa2gvSGFJRVRrV2NzUHBmOW45eEpF?=
 =?utf-8?B?US9ZeGgrazM1ZkxKV0xkRG54cUFoeXlMbFZ6WmR2aE1XSmt1WGl3c0F5M2FF?=
 =?utf-8?B?bmZ1MkFIYitjdHJUNmhFWTNoVkU4ckpET0c2UTU5MWlwSHFsWjNJWE5PZTNx?=
 =?utf-8?B?VTJBWFI2ZVQ2WjhBalJodWk4Smx2QnpqQ084dUhURkFWN3VzZ0hQd2NWc1FU?=
 =?utf-8?B?RllhOXN1SHIzczk2cVRvYU9KSVptdjQ4T01tdzlzQjlmeFRzdHExQkF2RGNZ?=
 =?utf-8?B?YXFKNnNUZnAwajFQRTUrb0lhcHovUmQwL2E5dllCSVV6Y2taV2Zqd05nNi9q?=
 =?utf-8?B?TlRTN2xXNlMrb2xCK2NzM1laS3VONkw4cnpEYUJxMWk2ZTAyNkVORER0VUxq?=
 =?utf-8?B?WlVtdmJMV3VHSG84dk9WSlpUN0sxeER0TXRkeStibDFmVitiNE56ZkFCUENr?=
 =?utf-8?B?Uml1U2xUR3pqRGZSeVZxc2liVmprbGNYUkJXMDhtWHg1OUF6TDhJREVpN2Vo?=
 =?utf-8?B?VXB0Zy8xQS9xcUhMTG9WVFRpUE1CQ0hEdS94c2luQ2x6eFFlYVpyWnc4a3RB?=
 =?utf-8?B?SXhCYWtNVStoeDcxZUI1ZWhPK1Q3ajE4ZGcvY01qUHRhQWlwV290RFI5aDBE?=
 =?utf-8?B?R0hHdGRGNTZVTFVTWjY4OHAwdGJMQ244UXNMaUlpclZ1a3JrVjk4Wm8wNU1P?=
 =?utf-8?B?NWU1aVhGTlN3eVF3THAzMWJZRnhjT0lCZENyb085a295azdnL2lGQ29hWi96?=
 =?utf-8?B?TGxXTDUvNWs5Y25HRUg4M0ptZThTa0g2NGtCcnNhMXVqQ3dsNVFkU0prWUdV?=
 =?utf-8?B?ZmFDVHV5TGkzQkNQZ2RUNjl6WERXaWlzNWFGR2ZPOC83d2FOZm5tcFQzVndz?=
 =?utf-8?B?ZGFXVUhPbXRtbFRBR2F1SWwwcEhKWXJ0MnR1VmFXUGluQnRCOWE3WmRuZ0dI?=
 =?utf-8?B?ZmJtakdjbFQyNUVzY3BQNE5UcCtqTmdwTjdIVkN4K2tBUFJNa0V3ajFseDha?=
 =?utf-8?B?R0dEVjNuNzFzbk04S3ZuUTZPS3FjS015UmZXWHR6YzcvdE5ZamNtNVl3bzRV?=
 =?utf-8?B?bk1VclhYTEhDaXhZc2h5SkN4L09QbjFaRWE4Z1BWSFB4bzNhY1JyUHlHbE1W?=
 =?utf-8?B?eXozUGNTWGxQTm5oU3Q2YkxQWHY4akFZck0xcUE5ZExJR29WdlFLdWRIQ0Fr?=
 =?utf-8?B?VXJDaTdCWG9RdGhPRDdSMldEdm1ueURlVms1NXZLNGFTTkdsTjNhT2NjMjVu?=
 =?utf-8?B?d25WVmF2VEhhNEJ1R2hyVTVPU1VDQndGQmk4ODhmdmk4M3dSSjEyS2ZQOUp5?=
 =?utf-8?B?aE94R3dpZU94aFJlODJBNkI2bnZZMUpNS0h3ZU92NkdROUJWdkpVb2M5LzYx?=
 =?utf-8?B?azJiN09jUXJqRnNIa0E2MlEvK1ArdENHY2ZsY3RkTi9Ya1pHVGVIckJ3NklF?=
 =?utf-8?B?Tm16U0cyaGV1c3RNZXFJeXU4cnF5NlZ5Z3Z1L3FmUDVIK0lIZUpnS2JYQkto?=
 =?utf-8?B?aWxQbzRRZzUxbTdibUFURnVXTmdlYmR2S1JwT2NXcWdnWFo0QlROMlhGa09j?=
 =?utf-8?B?SUhOZG9PRU9WdXBnRUZnaWJZZkUrSkNxek1YSkJUL0RydEduVEJ1UmsxYjJG?=
 =?utf-8?B?S2Z5SlBpWFhMcjFrMUhHemJMcmhwb05zcVhEbnVJaHRuQnZYdWl2dDlqOXNt?=
 =?utf-8?B?V2tYWFc4ekx1RWh4blIxQmdkRU1hajdpRFQzR0N2eFFhRjNzTGk1Nkl4blVX?=
 =?utf-8?B?NSs3bllQWVdRbHlYUFFzT21nSHU1Z3lRRnFWQXZHRllHQTJkaG5hMGhwMzU4?=
 =?utf-8?B?aWN4VWNRY3Q4elZpWU5qTUFhWVpkYU9BY0I1TmJ3bDd6WlJ5ZWNyRGdNbHVO?=
 =?utf-8?B?eXRreTFMeXRkVThuKzdmcVBDelBXVG5LeE9uUExHa3BRMitkemxWN05yL1R0?=
 =?utf-8?B?VS8yOU5qcmZ6czRzMndjM0x0emdhSDNvWFRGUUhoRmhzUWdMcVZHMHozellO?=
 =?utf-8?B?eVdQbjRmS1pnY3FKNjZ2ZXd2dWE0Y0JHanFlN2lzZ1ZlVm1tams5VklKSFNV?=
 =?utf-8?B?MHRUQmp3Tkt6aGYvN0I2d1c2aW9rUUpEVW5nRWRkMnJNZmNLU3NEQVBydE5z?=
 =?utf-8?B?K0IreloxcTdpZ0dEK1ZTa1dzcmxveE9lWFh1eGlhZ2ZVcUpNeXdtK0Rtai9Z?=
 =?utf-8?Q?6mqVH3/4qQQMI7AeB2DXDYA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f71c314-6eb2-4366-d5bf-08dcccca1ca9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:12:41.8924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLPyCrEm1XMaElfU5aly0/raxyT/brsLdyii+Gobm+p9JOt8A/m+rF9Lj4eIBQ4ffTsHqHI3Ld2QQL6Z9q4qsIQqL+dHnOSVJx12+quOnHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
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



On 04-09-2024 15:43, Tejas Upadhyay wrote:
> Wa_15016589081 applies to xe2_hpg renderCS
> 
> V2(Gustavo)
>    - rename bit macro
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>   drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d1a4a9f4e11..660ff42e45a6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -105,6 +105,7 @@
>   
>   #define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
>   #define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
> +#define   DIS_CLIP_NEGATIVE_BOUNDING_BOX	REG_BIT(6)
>   
>   #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
>   #define   TBIMR_FAST_CLIP			REG_BIT(5)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 28b7f95b6c2f..d424992514a4 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -733,6 +733,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>   			     DIS_PARTIAL_AUTOSTRIP |
>   			     DIS_AUTOSTRIP))
>   	},
> +	{ XE_RTP_NAME("15016589081"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
> +	},

LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   
>   	{}
>   };
