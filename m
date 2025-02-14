Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF39C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 17:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E92510ED1D;
	Fri, 14 Feb 2025 17:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilhuksbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F38E10ED1C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739552548; x=1771088548;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+NJjmkJYTGcqKRkTgcjD1GgDyIjpPtRIn2n2gZV+o+E=;
 b=ilhuksbGE3JCwjg1fZkut5FwqQ4QkNwEpmZPyXCMvii9C3TmXELt0HHq
 X5lg+Au7K9XOK4IgZ1HIaGxczHEirDsZi2dFSvUaZfdvBaA8u3X5O7HHd
 rBhClCMEon5alSlFF+6SsR2iMrxmh2CRs+ExjI9yASiNjMJNh2jHP+RYk
 S+huLDSrnU0DNIZVoIpo7rzc8CyfVSw+owGFXfqi00V4gOyXSzO3QRXHy
 dpRpwi5+tp1nlvASc1UFjX7tZtYansmHxbfIWmNjYF3PqdqTxuAs2OS5s
 ThG8dhCv9c+VRFZFrx5jWjb/RXiuR0U38KiGb1/mn8YqxX+cYVIYbEHpJ g==;
X-CSE-ConnectionGUID: vH322uLxTke2wH1iXT0fJQ==
X-CSE-MsgGUID: iivsEPCGR5WiBhBzbKCTFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57839268"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="57839268"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 09:02:28 -0800
X-CSE-ConnectionGUID: e9cNOdzbQj6+aE2NGkrDHA==
X-CSE-MsgGUID: iaEEvr9wRPyh2ttjyTEYKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113705981"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 09:02:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 09:02:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 09:02:27 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 09:02:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3d1do61Cnidav/sXN97OLe+tgbbWRuCZPHa2NCybMVgKITZVC7iidiBbDLz6Qtdh1uCHNQnrrONwfWMSg1I4JJiXOONEwWlNUmi17rDsYmxzdb+XcnDXwUBlAJXVqeNloexNbyn2UlHJc6oYQKHHokx57ACQCPIPshe2GuoiV2XNMgjlXw9YAJ/UMpmgM5MyPQs2S5jECrHI08yYvfHOBmEIUwKw6c32tZ3saxnBRIO8aCZCY1khU9D6eYzsJj4yEvvXbGJPLfPZJirqpAz8t/1ewZMPcTAde/SrSKAhp7FQQYMqy7sxlDEFLuIjTVJ/I5YZ+EmLbiarVaOeEa0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NJjmkJYTGcqKRkTgcjD1GgDyIjpPtRIn2n2gZV+o+E=;
 b=pkTsJKXw0sH8MejoSErDYRS5ImurvBjwk3SZ8dIbCWm9IHi0c1zQKAfUH19iY24HHvN+uVJFo2sVxEaYdyECvJ+DMv5/nahqSERw2WvVFENBCbRSDItSdgRSd2lPjuBgmv/XkkEOghMSjiXef3m2B/maHoY5FFCH8vUZj4LTiGgnpCynLrVuhKJl0gCEj8FTa4nx0x14Wxt10ZEL3ByinOzt2BA00KRqDXSz+uAOETc7PluTC7MGGie4xAG91LAw+33naH/AgRzESdtr6Qczk9L8jUk4osTFp/aT4dYsafdQJrBViHafgt1lS5JX+0eLEHxxtQjpeqMwD/lbk3SPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CY8PR11MB7732.namprd11.prod.outlook.com (2603:10b6:930:71::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 17:02:18 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 17:02:18 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Stop reading masks from device memory when
 populating the ADS
Thread-Topic: [PATCH] drm/xe/guc: Stop reading masks from device memory when
 populating the ADS
Thread-Index: AQHbfmAGSIawuFQ92Umujcx4xF9GdbNGjtIAgAB14ACAAAK0wA==
Date: Fri, 14 Feb 2025 17:02:18 +0000
Message-ID: <LV3PR11MB8695E7C1A6A8FA4806CDCCFDF9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
 <LV3PR11MB86959FA32C69826118242F65F9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
 <c6affc31-830c-4c17-a653-55ae81bf0587@intel.com>
In-Reply-To: <c6affc31-830c-4c17-a653-55ae81bf0587@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CY8PR11MB7732:EE_
x-ms-office365-filtering-correlation-id: 6c9fd352-1ef7-46d0-986e-08dd4d1956ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ck5hSVVWS3FoL3B1UU9HdzJJc1l4enpuQjM0Y0JCY2x6WUFITVRWQUFlVkRI?=
 =?utf-8?B?Q2lJMThDU0JtVndGUkxtRE51aFV5eXVsNjVXWU9QTGFYaVVEeHJlS3JKSjR2?=
 =?utf-8?B?QjFyL2VjK2VkNkNyUXpLNmVkaWltZEh2N1lBdnNkWnJzdEJFbk9kWU03eUNO?=
 =?utf-8?B?cVF1U0FJdUlvQ1h0RTBsdlFHc25ZVnV2S3lCbTRGZ1l4TmNBRGwzcEpEWE5u?=
 =?utf-8?B?SGF5bE5leENONTdKblpjTTkwZ280TEdRQ00rM2dYV0UzTjMzbXlRTlpmWG5P?=
 =?utf-8?B?SGllZ0c1dUtQRC8xaTJLcU1BcFdXQ200QkFoNmhpdXJkOVZtSHEzb0xEWGpO?=
 =?utf-8?B?S3ZiU1BVZ0xtY1Vkekh4M0FRTXNzWnBHZTRVTjN2YTVBUFRvL1pNMjdvblFl?=
 =?utf-8?B?L1A1R0NsVmZJQzdUaUtmN2JHeitpRitwVncxR1pURzljWjI3NWVnRGgyMURr?=
 =?utf-8?B?ZGhkMmZrL1lVUlFHMm1HbmJ5VWpxcmppQ2N0QmFjRFF3MmVaMFBSTDduTnFt?=
 =?utf-8?B?WlQwemF2Q0VhbWJ3U0VVVVIxMVNMcDh4YzBnaGNmZE9MT2JKaFlxc3BTWk9C?=
 =?utf-8?B?SnNaOTdYY0FhKzVuL1hIOGVOQTQ3M05sRUJPSUc1OEdwbWh0SzRwTEE5dkFK?=
 =?utf-8?B?SjRZNzlvVGt4WEU5ZjhxVXdrWGs3dExkQWJySkQvMjdzNWNUS3dkeVRFZUJR?=
 =?utf-8?B?bkwrNGE5S1kzTDdYYVF4WjBhZHlhVzgxcnIvMnV4RUU0L045QzkreVViZjkv?=
 =?utf-8?B?ZzZBZ3lZb2xDZkJhVzBHK28zc1M5cjZCQnVvRFJDNHNvdEFaQU1iQkY2L2hL?=
 =?utf-8?B?K0lGTWxZamJwdE91R3pmZDJJMGJTeU04QlFwS1VoRGx2R0JlazIvWHl1WkR2?=
 =?utf-8?B?bjQwM09MOTVSZGtmMGxWYVlid25LZkV4dGlTaE9nVjI1ZEVxSmUrQ2k1dGFl?=
 =?utf-8?B?bzVGVEwzdUNSQnNnaU5XMlpwRDZGZ052RG4zT05qS3lQSld1MDg1UWxadWJY?=
 =?utf-8?B?bmdPQVF4ZXZBVUJNdG53Sld6QmdXaVVPbHY4OFcwUytrbUVJMHJNVU5OQmRI?=
 =?utf-8?B?M0I5NXpSZ3IxK0RuLzNFRnZLWUdEeFNPTjdIMTZzTms1T2Q1Mkw1ZHI2aFg0?=
 =?utf-8?B?V2ZVVTlGUFM0S3NUcC9EZUxaREMrOTRXcVFvWTdrV3AzMVl3Q2xMcDkwK0hz?=
 =?utf-8?B?Zm5STGNoOXhhU084d1hLV1pNSlp0aUdGeWJVTWdSYWNHZ2Y5ZWFHVmJoOHFK?=
 =?utf-8?B?ZnF4dDE0aDdJTkNFb2hQMFpNN2tGTW5hMzBzWUtkNER3bldhYzRRZ3hBRzhG?=
 =?utf-8?B?YmN4dk1ORkJJOG1aODB4RDBpZ01ub2ZIZFc5OTZzTkZ5Z2ZjWGZzeEdKK25L?=
 =?utf-8?B?V1JCZWo1RnNpRVl4RFNGM0N2WEV3YzM1Tk5CelUrd2lmTDVQUkhIYlhxRnVx?=
 =?utf-8?B?NUNEczI1SGNUM09lVlJRVjh1Njg4V2VMMnVCeWwxUHgvRllLNXNVNkZKRmp0?=
 =?utf-8?B?MDQvaTloUHdpVGxyeXh1cFRiVmY0bWNMY1BVZVk2azYwSVRxakVaM25XTHlC?=
 =?utf-8?B?c0dMTzd1Ti80WUhLV3hQR3VqaHg4OCs0cXZHSTJTRGxsL2ZnTWhoU1RsZmll?=
 =?utf-8?B?N2hWaDlacEN5NTExVFJwb3cxRU1LTEc2VnFNejkwU0hJNGs5bE1ZM3dGQWVz?=
 =?utf-8?B?MjcrYzNIQTkxOE1pRFZUWWdwWWZSUGIvdnRqbHlrL1JHb1VwaGRKZnV5STZ4?=
 =?utf-8?B?aEZvd2Ria1ZOL3BlWkxwMkxNZDJ5OTFkNnNPWXNYVnM4SXkvLzNoa0RKSnR5?=
 =?utf-8?B?cVdwMzJYUXk4NzVvd253a2FSMitqNGpDOEhXRmtsZ0dXMEpDc2p0NjN3d0Q2?=
 =?utf-8?B?TnByZEpZZGljQ2k4ZzIvVXhtYk4wc05zTjlORlV3ek9yY2t2c255SDV2WnpM?=
 =?utf-8?Q?LIl3rVcKxsx9/wF64zJ84szhju3mhGum?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2tnNUx2VVZTVEI3K2pOdHZkWllPWG13cG5NaHVmWUNoMEtBbEQ5dHZoREQx?=
 =?utf-8?B?V0x2ckROU0xLZU02cWtFUlFZd1pTY2Nyb296VDZhbmpGQmRNazhiYUpSM0xn?=
 =?utf-8?B?Yzd5d1ZjUkhiWEpBOHJjZ0ZnQndVaWN3enI1aUM3bldFNnIrbVNKUFJxL0ds?=
 =?utf-8?B?dENPaG9JdXladk1xSHNrRkE5WHk2eXhlUFMyT0pidFpSd2Q1NzlHbGVnbmVM?=
 =?utf-8?B?V2EwK3ZUa2NyamdkVUVmdDVVM1ZBOWZtMzVqWktPR3pibWwwRmNRYUJVRStz?=
 =?utf-8?B?Ny9aL2ZoSERVZjgyWlhVTWhVWU1lTzhNMnN3Q3VHL1JHY2dmNHNnMWk5MWdq?=
 =?utf-8?B?U201b3VxQ3paanM1dE1TM3k4d3l2aGh4cVlOeGsyUWxGN2hGMWIxZ29xNWVR?=
 =?utf-8?B?SDBjSGJFTmJ4eG9sN0pjdkszNEdaU2txbFNmdC9MeUJ2dHByQzNSeS9SOHhx?=
 =?utf-8?B?WFlQd3huV1FicWd3WERBTDNFZGlFOXBKV0VDSGFVOWxoZXBWTFlpS2dEQkJY?=
 =?utf-8?B?TDY0U2VpK2JtSHlic1ZFeE5MQk1VSnRiYytOTlA4bXc4cWowUm15SHlRbHFx?=
 =?utf-8?B?MTdTdEdIVzRHUkpoVGhjL0dGZ3hpenJydi9WbXdOaC8zY3k4RVdKaEhSRmdJ?=
 =?utf-8?B?MkZCTnlISUhpTmc4TitaaDN5eGJ5TitYSTJDaURCUHUyL3N1VlpZQTZwRkJa?=
 =?utf-8?B?ZFZvNmtueFEwaHVNb3JxM0Rid0U5Vzc1bWRuWTl6OVh1UFNKT3VJL0Jja25N?=
 =?utf-8?B?OStqQzYzNVV0bGVBcG9kaUl5YU1vVE91L3FEWGVSTzVqSGc3cjVobGx5VFkr?=
 =?utf-8?B?cTZycTBQU0liWjhLZEZ4ZmlESlVSTVRjV2FBc1NBRUdmZ3NqV01UNlI2eDhV?=
 =?utf-8?B?b2hENVZjT2h4anh0M090MlVMYzNuYklkL2N6bE5HbUZld1dqZ25HNjlHNzJ6?=
 =?utf-8?B?RFo1ZkNyNHVqcjRjR253NmFXZFdIY0dkUVRWV05sV0doU3lOWEdaYURaNDBY?=
 =?utf-8?B?ek9kcCtMMzZjUlgxeXJ1YUNpWVc1QVg3YVpMcm81NDRyMnJRWVZ1RVhqN1N6?=
 =?utf-8?B?NWgvZEpTb3IrZVFwZ0xpZzZPR25CZXFrb2dVT2c2RlJxQXNWNk1QWFhkMVVR?=
 =?utf-8?B?WkR4RWpKTWd1dXU2bEIxYm0zMGNYNGpPZ1lTWnlqZmhwdXNvdHRVSDVDT05r?=
 =?utf-8?B?Y2x5RlhBTE1lSmdHdDBKYXVzNVQxbldSNXJFVEQxeHVsR0FHRHQ5Qm95Q3Y3?=
 =?utf-8?B?eWFXZkNZRmQ5VDRrdmFBZW1mUlEyZHVwZlhDdVhxdW9mckgwTEE2dUZwTENC?=
 =?utf-8?B?WDVSa3loMHB0ZzczaGVLNUUrWXFhUlg0RU0xaDhQbTZsY0gxM0ZiYlUxZmVX?=
 =?utf-8?B?ZjJ1MUh5cDZOMVhuQmFNQnA5Wm9wT1ltUVFQQ2k0eHg3RDZFbFpVeWxxY1lv?=
 =?utf-8?B?M0VEWExKQmZDYlhMUGNJbThzRkdkUWVLamFvVHlKWG05cmNHTkFSSXhPRFBG?=
 =?utf-8?B?aTl0bkJkOVpYUFJSdE51eHZmZlR6cktMaStmVFhib0dPVkEwVmtiT0FUeGVP?=
 =?utf-8?B?UXBPVkRBQmluMXA5YUhNa2FtMEg3N2J3M1crS0RQRXZkZHJ0UHdTdnh4S3Bw?=
 =?utf-8?B?YnJvek5Wc2NVSlhoZWVDUUdyZkp0bXovSFFDMW40UGJVS2ZJQmV2RUZaOHMx?=
 =?utf-8?B?eVpZeEp2VTd6SksvcTUrVHZsMHVEWW5XUGU5eWN6MEdGVXVRRldPTWZxaEFO?=
 =?utf-8?B?VmkyK3A0TDdlOXBXcDB6TnN4d3QvSlpWZ1FvK254OU90Z2sxVEc2NnVOajBl?=
 =?utf-8?B?YkNxaHJYOU1ucDlRRWZndnZrdisvOVQxWnUxekVRVzRsdXdvQ3J1OTNvM2lI?=
 =?utf-8?B?UW11VGRSM0xZbWl0STdvWEhrSE1wY0NUbWJZQ09BbHE5WjJBcUpuNnFTU00w?=
 =?utf-8?B?blR5cHh6NExKSVBSNDZDNmxWMVZpUXJsaVRoU2NRRmN2MGc2UWRvR3R1dlZT?=
 =?utf-8?B?MFV5WWc5UFN4VHdpSzd3b1pEellVaER6bS9PWUllY2tsNzNVV3c1aEZOWmtP?=
 =?utf-8?B?Ym85eERiNllmbHBlVVJ0WWF6TFJoeTdabWZzbGU3UUtsRjBtbXQ3WkFtUXho?=
 =?utf-8?B?RGt1M1k2VW9xbU5CZkJ1YklHQmQ4TEcvNVUzRjVFYXQ1TVB3WFFNWjIzaFB6?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9fd352-1ef7-46d0-986e-08dd4d1956ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 17:02:18.0661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bTRdu76lg1izQtYF33AgYbJxZPe9OCLVOtYRAit8anlMjHRQcqNdXydxIFMyqUbHDTykpdmzM7q8HKMeiOFZmObHxdXtuNcJiPntFlqNby4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7732
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDZXJhb2xvIFNwdXJpbywgRGFu
aWVsZSA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBG
ZWJydWFyeSAxNCwgMjAyNSAxMDoyMiBQTQ0KPiBUbzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNh
dHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogSGFycmlzb24sIEpvaG4gQyA8am9obi5jLmhhcnJpc29uQGludGVsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlL2d1YzogU3RvcCByZWFkaW5nIG1hc2tz
IGZyb20gZGV2aWNlIG1lbW9yeQ0KPiB3aGVuIHBvcHVsYXRpbmcgdGhlIEFEUw0KPiANCj4gDQo+
IA0KPiBPbiAyLzE0LzIwMjUgMTo1NCBBTSwgSyBWIFAsIFNhdHlhbmFyYXlhbmEgd3JvdGU6DQo+
ID4gSGkuDQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEludGVs
LXhlIDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
DQo+IERhbmllbGUNCj4gPj4gQ2VyYW9sbyBTcHVyaW8NCj4gPj4gU2VudDogRnJpZGF5LCBGZWJy
dWFyeSAxNCwgMjAyNSAzOjExIEFNDQo+ID4+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gPj4gQ2M6IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIDxkYW5pZWxlLmNlcmFvbG9z
cHVyaW9AaW50ZWwuY29tPjsgSGFycmlzb24sDQo+IEpvaG4NCj4gPj4gQyA8am9obi5jLmhhcnJp
c29uQGludGVsLmNvbT4NCj4gPj4gU3ViamVjdDogW1BBVENIXSBkcm0veGUvZ3VjOiBTdG9wIHJl
YWRpbmcgbWFza3MgZnJvbSBkZXZpY2UgbWVtb3J5DQo+IHdoZW4NCj4gPj4gcG9wdWxhdGluZyB0
aGUgQURTDQo+ID4+DQo+ID4+IElmIHRoZSBkZXZpY2UgbWVtb3J5IGlzIGNvcnJ1cHRlZCBkdXJp
bmcgdGhlIHN1c3BlbmQvcmVzdW1lIGZsb3csIHRoZQ0KPiA+PiBtYXNrcyBtaWdodCBlbmQgdXAg
YmVpbmcgcmFuZG9tIHZhbHVlcyBhbmQgdXNpbmcgdGhlbSBtaWdodCBsZWFkIHVzIHRvDQo+ID4+
IHRyeWluZyB0byBzZXQgdmFsdWVzIGZvciBlbmdpbmVzIHRoYXQgZG8gbm90IGV4aXN0LCB3aGlj
aCBpbiB0dXJucyBtaWdodA0KPiA+PiBsZWFkIHRvIGludmFsaWQgbWVtb3J5IGFjY2Vzc2VzLg0K
PiA+Pg0KPiA+PiBHaXZlbiB0aGF0IHRoZSBkcml2ZXIgZG9lcyBrbm93IHdoaWNoIGVuZ2luZXMg
YXJlIGF2YWlsYWJsZSwgd2UgY2FuIGp1c3QNCj4gPj4gY2FsY3VsYXRlIHRoZSBtYXNrcyBpbnN0
ZWFkIG9mIHJlYWRpbmcgdGhlbSBvdXQgb2YgbWVtb3J5Lg0KPiA+Pg0KPiA+IExldCB1cyBsb2cg
YW4gZXJyb3IgaWYgdGhlcmUgaXMgYSBtaXNtYXRjaCBiZXR3ZWVuIHdoYXQgaXMgcmVhZCBmcm9t
IG1lbW9yeQ0KPiBhbmQgdGhlIGluZm8gYXZhaWxhYmxlIHdpdGggZHJpdmVyLg0KPiA+IFRoaXMg
aW5mb3JtYXRpb24gd2lsbCBiZSB1c2VmdWwgdG8gZGVidWcgaXNzdWVzIChpZiBhbnkpIHdpdGgg
Y29ycnVwdGVkIGRldmljZQ0KPiBtZW1vcnkuDQo+IA0KPiBJIGRpc2FncmVlLiBUaGVyZSBhcmUg
YSB0b24gb2YgcGxhY2VzIHdoZXJlIHdlIHRvdWNoIG1lbW9yeSBhbmQgY291bGQNCj4gcGVyZm9y
bSBzdWNoIGEgY2hlY2ssIHNvIHdlIHNob3VsZCBlaXRoZXIgZG8gaXQgZXZlcnl3aGVyZSBvciBu
b3doZXJlOw0KPiB3ZSBzaG91bGRuJ3Qgc3BlY2lhbCBjYXNlIHRoZSBHdUMganVzdCBiZWNhdXNl
IHRoZXJlIGhhcHBlbnMgdG8gYmUgYQ0KPiBwYXRjaCBpbiBmbGlnaHQgZm9yIGl0Lg0KPiBBbHNv
IG5vdGUgdGhhdCB0aGlzIGlzc3VlIGlzIGxpa2VseSBkdWUgdG8gdGhlIG1lbW9yeSBiZWluZw0K
PiBub24tZnVuY3Rpb25hbCwgYmVjYXVzZSB0aGUgdmFsdWUgaXMgcmUtd3JpdHRlbiBhZnRlciBy
ZXN1bWUgYmVmb3JlDQo+IGJlaW5nIHJlLXJlYWQsIHNvIHdlJ3JlIG5vdCB0cnlpbmcgdG8gcmVh
ZCBhIHByZS1zdXNwZW5kIHZhbHVlIChJIHNob3VsZA0KPiBoYXZlIGNsZWFyZXIgb24gdGhhdCBp
biB0aGUgY29tbWl0IG1lc3NhZ2UpLiBJZiB3ZSB3YW50IHRvIHRlc3QgdGhhdA0KPiBtZW1vcnkg
d29ya3Mgd2Ugc2hvdWxkIGFkZCBhIGRlZGljYXRlZCBsb2NhbCBtZW1vcnkgaGVhbHRoIHRlc3Qg
aW4gdGhlDQo+IHJlc3VtZSBmbG93IGFuZCBub3QgZG8gaXQgYXMgcGFydCBvZiBHdUMgaW5pdC4N
Cj4gDQo+IERhbmllbGUNCj4gDQo+ID4NCj4gPiAtIFNhdHlhLg0KPiA+DQpMR1RNLg0KUmV2aWV3
ZWQtYnk6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29t
Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNl
cmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiA+PiBDYzogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhh
cnJpc29uQEludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19hZHMuYyB8IDM2ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4gPj4N
Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4gPj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2Fkcy5jDQo+ID4+IGluZGV4IGZhYjI1OWFkYzM4
MC4uMTBlMmFiNTc5MWI3IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX2Fkcy5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfYWRzLmMNCj4g
Pj4gQEAgLTEyOSw5ICsxMjksNiBAQCBzdHJ1Y3QgX19ndWNfYWRzX2Jsb2Igew0KPiA+PiAgICNk
ZWZpbmUgaW5mb19tYXBfd3JpdGUoeGVfLCBtYXBfLCBmaWVsZF8sIHZhbF8pIFwNCj4gPj4gICAJ
eGVfbWFwX3dyX2ZpZWxkKHhlXywgbWFwXywgMCwgc3RydWN0IGd1Y19ndF9zeXN0ZW1faW5mbywg
ZmllbGRfLA0KPiA+PiB2YWxfKQ0KPiA+Pg0KPiA+PiAtI2RlZmluZSBpbmZvX21hcF9yZWFkKHhl
XywgbWFwXywgZmllbGRfKSBcDQo+ID4+IC0JeGVfbWFwX3JkX2ZpZWxkKHhlXywgbWFwXywgMCwg
c3RydWN0IGd1Y19ndF9zeXN0ZW1faW5mbywgZmllbGRfKQ0KPiA+PiAtDQo+ID4+ICAgc3RhdGlj
IHNpemVfdCBndWNfYWRzX3JlZ3NldF9zaXplKHN0cnVjdCB4ZV9ndWNfYWRzICphZHMpDQo+ID4+
ICAgew0KPiA+PiAgIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGFkc190b194ZShhZHMpOw0KPiA+
PiBAQCAtNDkzLDEzICs0OTAsMTIgQEAgc3RhdGljIHZvaWQgZmlsbF9lbmdpbmVfZW5hYmxlX21h
c2tzKHN0cnVjdA0KPiB4ZV9ndA0KPiA+PiAqZ3QsDQo+ID4+ICAgc3RhdGljIHZvaWQgZ3VjX3By
ZXBfZ29sZGVuX2xyY19udWxsKHN0cnVjdCB4ZV9ndWNfYWRzICphZHMpDQo+ID4+ICAgew0KPiA+
PiAgIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGFkc190b194ZShhZHMpOw0KPiA+PiAtCXN0cnVj
dCBpb3N5c19tYXAgaW5mb19tYXAgPQ0KPiA+PiBJT1NZU19NQVBfSU5JVF9PRkZTRVQoYWRzX3Rv
X21hcChhZHMpLA0KPiA+PiAtCQkJb2Zmc2V0b2Yoc3RydWN0IF9fZ3VjX2Fkc19ibG9iLCBzeXN0
ZW1faW5mbykpOw0KPiA+PiAtCXU4IGd1Y19jbGFzczsNCj4gPj4gKwl1OCBjbGFzczsNCj4gPj4N
Cj4gPj4gLQlmb3IgKGd1Y19jbGFzcyA9IDA7IGd1Y19jbGFzcyA8PSBHVUNfTUFYX0VOR0lORV9D
TEFTU0VTOw0KPiA+PiArK2d1Y19jbGFzcykgew0KPiA+PiAtCQlpZiAoIWluZm9fbWFwX3JlYWQo
eGUsICZpbmZvX21hcCwNCj4gPj4gLQkJCQkgICBlbmdpbmVfZW5hYmxlZF9tYXNrc1tndWNfY2xh
c3NdKSkNCj4gPj4gKwlmb3IgKGNsYXNzID0gMDsgY2xhc3MgPCBYRV9FTkdJTkVfQ0xBU1NfTUFY
OyArK2NsYXNzKSB7DQo+ID4+ICsJCXU4IGd1Y19jbGFzcyA9IHhlX2VuZ2luZV9jbGFzc190b19n
dWNfY2xhc3MoY2xhc3MpOw0KPiA+PiArDQo+ID4+ICsJCWlmICghZW5naW5lX2VuYWJsZV9tYXNr
KGFkc190b19ndChhZHMpLCBjbGFzcykpDQo+ID4+ICAgCQkJY29udGludWU7DQo+ID4+DQo+ID4+
ICAgCQlhZHNfYmxvYl93cml0ZShhZHMsIGFkcy5lbmdfc3RhdGVfc2l6ZVtndWNfY2xhc3NdLA0K
PiA+PiBAQCAtNTQ2LDI1ICs1NDIsMjQgQEAgc3RhdGljIHZvaWQgZ3VjX21hcHBpbmdfdGFibGVf
aW5pdChzdHJ1Y3QgeGVfZ3QNCj4gPj4gKmd0LA0KPiA+PiAgIHN0YXRpYyB1MzIgZ3VjX2dldF9j
YXB0dXJlX2VuZ2luZV9tYXNrKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdA0KPiBpb3N5c19tYXAN
Cj4gPj4gKmluZm9fbWFwLA0KPiA+PiAgIAkJCQkgICAgICAgZW51bSBndWNfY2FwdHVyZV9saXN0
X2NsYXNzX3R5cGUNCj4gPj4gY2FwdHVyZV9jbGFzcykNCj4gPj4gICB7DQo+ID4+IC0Jc3RydWN0
IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7DQo+ID4+ICAgCXUzMiBtYXNrOw0KPiA+Pg0K
PiA+PiAgIAlzd2l0Y2ggKGNhcHR1cmVfY2xhc3MpIHsNCj4gPj4gICAJY2FzZSBHVUNfQ0FQVFVS
RV9MSVNUX0NMQVNTX1JFTkRFUl9DT01QVVRFOg0KPiA+PiAtCQltYXNrID0gaW5mb19tYXBfcmVh
ZCh4ZSwgaW5mb19tYXAsDQo+ID4+IGVuZ2luZV9lbmFibGVkX21hc2tzW0dVQ19SRU5ERVJfQ0xB
U1NdKTsNCj4gPj4gLQkJbWFzayB8PSBpbmZvX21hcF9yZWFkKHhlLCBpbmZvX21hcCwNCj4gPj4g
ZW5naW5lX2VuYWJsZWRfbWFza3NbR1VDX0NPTVBVVEVfQ0xBU1NdKTsNCj4gPj4gKwkJbWFzayA9
IGVuZ2luZV9lbmFibGVfbWFzayhndCwgWEVfRU5HSU5FX0NMQVNTX1JFTkRFUik7DQo+ID4+ICsJ
CW1hc2sgfD0gZW5naW5lX2VuYWJsZV9tYXNrKGd0LA0KPiA+PiBYRV9FTkdJTkVfQ0xBU1NfQ09N
UFVURSk7DQo+ID4+ICAgCQlicmVhazsNCj4gPj4gICAJY2FzZSBHVUNfQ0FQVFVSRV9MSVNUX0NM
QVNTX1ZJREVPOg0KPiA+PiAtCQltYXNrID0gaW5mb19tYXBfcmVhZCh4ZSwgaW5mb19tYXAsDQo+
ID4+IGVuZ2luZV9lbmFibGVkX21hc2tzW0dVQ19WSURFT19DTEFTU10pOw0KPiA+PiArCQltYXNr
ID0gZW5naW5lX2VuYWJsZV9tYXNrKGd0LA0KPiA+PiBYRV9FTkdJTkVfQ0xBU1NfVklERU9fREVD
T0RFKTsNCj4gPj4gICAJCWJyZWFrOw0KPiA+PiAgIAljYXNlIEdVQ19DQVBUVVJFX0xJU1RfQ0xB
U1NfVklERU9FTkhBTkNFOg0KPiA+PiAtCQltYXNrID0gaW5mb19tYXBfcmVhZCh4ZSwgaW5mb19t
YXAsDQo+ID4+IGVuZ2luZV9lbmFibGVkX21hc2tzW0dVQ19WSURFT0VOSEFOQ0VfQ0xBU1NdKTsN
Cj4gPj4gKwkJbWFzayA9IGVuZ2luZV9lbmFibGVfbWFzayhndCwNCj4gPj4gWEVfRU5HSU5FX0NM
QVNTX1ZJREVPX0VOSEFOQ0UpOw0KPiA+PiAgIAkJYnJlYWs7DQo+ID4+ICAgCWNhc2UgR1VDX0NB
UFRVUkVfTElTVF9DTEFTU19CTElUVEVSOg0KPiA+PiAtCQltYXNrID0gaW5mb19tYXBfcmVhZCh4
ZSwgaW5mb19tYXAsDQo+ID4+IGVuZ2luZV9lbmFibGVkX21hc2tzW0dVQ19CTElUVEVSX0NMQVNT
XSk7DQo+ID4+ICsJCW1hc2sgPSBlbmdpbmVfZW5hYmxlX21hc2soZ3QsIFhFX0VOR0lORV9DTEFT
U19DT1BZKTsNCj4gPj4gICAJCWJyZWFrOw0KPiA+PiAgIAljYXNlIEdVQ19DQVBUVVJFX0xJU1Rf
Q0xBU1NfR1NDX09USEVSOg0KPiA+PiAtCQltYXNrID0gaW5mb19tYXBfcmVhZCh4ZSwgaW5mb19t
YXAsDQo+ID4+IGVuZ2luZV9lbmFibGVkX21hc2tzW0dVQ19HU0NfT1RIRVJfQ0xBU1NdKTsNCj4g
Pj4gKwkJbWFzayA9IGVuZ2luZV9lbmFibGVfbWFzayhndCwgWEVfRU5HSU5FX0NMQVNTX09USEVS
KTsNCj4gPj4gICAJCWJyZWFrOw0KPiA+PiAgIAlkZWZhdWx0Og0KPiA+PiAgIAkJbWFzayA9IDA7
DQo+ID4+IEBAIC05MDcsOCArOTAyLDYgQEAgc3RhdGljIHZvaWQgZ3VjX3BvcHVsYXRlX2dvbGRl
bl9scmMoc3RydWN0DQo+ID4+IHhlX2d1Y19hZHMgKmFkcykNCj4gPj4gICB7DQo+ID4+ICAgCXN0
cnVjdCB4ZV9kZXZpY2UgKnhlID0gYWRzX3RvX3hlKGFkcyk7DQo+ID4+ICAgCXN0cnVjdCB4ZV9n
dCAqZ3QgPSBhZHNfdG9fZ3QoYWRzKTsNCj4gPj4gLQlzdHJ1Y3QgaW9zeXNfbWFwIGluZm9fbWFw
ID0NCj4gPj4gSU9TWVNfTUFQX0lOSVRfT0ZGU0VUKGFkc190b19tYXAoYWRzKSwNCj4gPj4gLQkJ
CW9mZnNldG9mKHN0cnVjdCBfX2d1Y19hZHNfYmxvYiwgc3lzdGVtX2luZm8pKTsNCj4gPj4gICAJ
c2l6ZV90IHRvdGFsX3NpemUgPSAwLCBhbGxvY19zaXplLCByZWFsX3NpemU7DQo+ID4+ICAgCXUz
MiBhZGRyX2dndHQsIG9mZnNldDsNCj4gPj4gICAJaW50IGNsYXNzOw0KPiA+PiBAQCAtOTE3LDEy
ICs5MTAsOSBAQCBzdGF0aWMgdm9pZCBndWNfcG9wdWxhdGVfZ29sZGVuX2xyYyhzdHJ1Y3QNCj4g
Pj4geGVfZ3VjX2FkcyAqYWRzKQ0KPiA+PiAgIAlhZGRyX2dndHQgPSB4ZV9ib19nZ3R0X2FkZHIo
YWRzLT5ibykgKyBvZmZzZXQ7DQo+ID4+DQo+ID4+ICAgCWZvciAoY2xhc3MgPSAwOyBjbGFzcyA8
IFhFX0VOR0lORV9DTEFTU19NQVg7ICsrY2xhc3MpIHsNCj4gPj4gLQkJdTggZ3VjX2NsYXNzOw0K
PiA+PiArCQl1OCBndWNfY2xhc3MgPSB4ZV9lbmdpbmVfY2xhc3NfdG9fZ3VjX2NsYXNzKGNsYXNz
KTsNCj4gPj4NCj4gPj4gLQkJZ3VjX2NsYXNzID0geGVfZW5naW5lX2NsYXNzX3RvX2d1Y19jbGFz
cyhjbGFzcyk7DQo+ID4+IC0NCj4gPj4gLQkJaWYgKCFpbmZvX21hcF9yZWFkKHhlLCAmaW5mb19t
YXAsDQo+ID4+IC0JCQkJICAgZW5naW5lX2VuYWJsZWRfbWFza3NbZ3VjX2NsYXNzXSkpDQo+ID4+
ICsJCWlmICghZW5naW5lX2VuYWJsZV9tYXNrKGd0LCBjbGFzcykpDQo+ID4+ICAgCQkJY29udGlu
dWU7DQo+ID4+DQo+ID4+ICAgCQl4ZV9ndF9hc3NlcnQoZ3QsIGd0LT5kZWZhdWx0X2xyY1tjbGFz
c10pOw0KPiA+PiAtLQ0KPiA+PiAyLjQzLjANCg0K
