Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70129C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 15:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2C10E2CA;
	Mon, 29 May 2023 15:16:51 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2530110E2C6
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685373409; x=1716909409;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=LJqLlH8mHjRghVNHurd+eCLEa1uR5halOwPT1oVy5VU=;
 b=PAG8D0nn+V7VkdUF6teKm1hYFHfjRfv/CpiWSdDu0E1zj3jI9GA9F9l5
 cmGeV0Rk+RHAdV5uyz7lErMC60cBjbJdURYATQJfqj7GtePxbGkFYvK9i
 t+uRtkml/LgzG90puHBAd73JvzJZj8p7wA4ZkOdxoKxkvJfur8WeZJihZ
 GOXEYU34/J7pd29rsJkmMdTop+Tp7D12bzRp7w/UJxtRx4xo/ta5FIQnH
 mPOs4O9SEbW6qwUyrdKllU6+/e0n0B5do4eNSsgnL5TGq1dcHy7YMop02
 f1tz4KjiICKhM+GrTmFY4CwjgyJNZghjO3o2AUVOB5Y6uJtL3j8ROr8UK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441084468"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="441084468"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="771197644"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="771197644"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 29 May 2023 08:16:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 08:16:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 08:16:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 08:16:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpuFQpTbndgQ9oaEuCNQhbYQseJJ71TRRCIMZGJtSwH48spQdKUUZv3BZC+D+VHi+HmR1C/TWFb2bC1UISiIXrRYrYpeqOLWwSCIP79r4ADIB5kYWxycC9S5kaYKgnSpGSCmrvzupMXvobSBz+ITr2LB++KSKrLrXl4Iu4sIQAjMD41LJxU4qem7YxEMnoe7peCJjufbCNanQ37B28sKg7pHWjbbob8g/GXcA0g9w/+aYEz33kNHp1P/ivS9QrPR85YQjaAOtZEUbYT1y3FHOa1aXhevTXAWx/6pGC7TwBx+U7EqYXs1CEFZdHKJBQtTCzxKTBkH2N1N4Capk7Wbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksKXQO+4ZM2r96CkQp25uIaczJDnHw61gihNsz+BhhE=;
 b=JnETgtxgIri692JgyNLGNTEWMCL0aaYuOta2CgNnOur/2Ypk0RD2KhqFHdW+VJp8Zsbmflyln+/CoywlIuoxxSUrgWOv5fRHA/PbJmaap/PyghEAkZKoggoqFbGP+PyS0d0TI9LvmqrAvsWBO33qRZ7FxZLy2phG3JYMWu+ON0I03htbXimW1T+kOU4lsZ4xPzJMUbYNo5w0R+bd4L76/Gv9VZ7OPQPBo6PXEDT3brtp5CPUkf3atmEY3228YD1ni6I//OLWTVfNtBl9A2k2LNT6zupsZsiz6KIxKC0Ar4gF5JrqnZl7i8yFR6w85Iaf4D+gkUM2r6Ds2fTpIoBhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Mon, 29 May
 2023 15:16:44 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%4]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 15:16:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230529150831.259733-1-gustavo.sousa@intel.com>
References: <20230529150831.259733-1-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 29 May 2023 12:16:40 -0300
Message-ID: <168537340010.259912.3352027659683200868@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|PH8PR11MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d78947f-eb00-43f0-620b-08db6057b66b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMRVoF3rTlEIdTD5UYeGXSyA0UiwCe0fdDKBIArIkZIIS110nY2mcSQct3Xi8Qkqnn/JdTw9lgV1phFo6uJHB9tYjphQozeHYUE3u1ZPIXlZs+0WAYn0wxbaNWRUkOZbixfU3mcBs9x4fDOv5X12YO8T5BbAPlmZIrF00nxySkxWUzr0p/X1dXopz+Ss+q0wW8SCRZgxcs9OS8tMpyhgcGgb6trTgXb0yic/iq1uXi/q3FCc5VJCSIiKBRnewt69BvXCPeGvdI9T7eq62fAmuNnqBQT9In+G3twkrBLj0gZZXen9xwGeZ5k5hGVMTtfzRr6lZg8nzWrGy4P0Vf5GOf/fbly27xGoHcW/xWve8P5Ew/4hnHZ1uwh/cYHo91S0btfiSJJgdRVFcV+Jw7VZ7aSxSQIbS3o1VOvvfhtTdvGrAqyPLuFkQMomA8Ie6Oi1ckfOclJmNst5T/xQXAhq1m+3IMeCcenXCWekk24z5K43MQiICr8bjJkho6RLylFRZ7o6IeYQTgHeN5W2hvxPRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(966005)(186003)(107886003)(38100700002)(41300700001)(83380400001)(6506007)(6512007)(9686003)(26005)(6486002)(6666004)(478600001)(54906003)(4326008)(82960400001)(66556008)(66476007)(66946007)(6916009)(316002)(5660300002)(8676002)(8936002)(44832011)(2906002)(4744005)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGtzdThtdHM2eTFOVGh4Y0pXbFRuY3A1TTRpYzN3K2tlVnZ0bFBpL21jYWpn?=
 =?utf-8?B?QVVPTVhQbmRmTVFkcUdyUU5QUG54MWxzV0M0b212YkkvdnpGK2loRUxXQm9I?=
 =?utf-8?B?bndySlRva2FtMFd3VGZ4MXdTNE90eDUrSUxZMlRVbVNPYWlGSy9DWmIvRmpJ?=
 =?utf-8?B?QUM0OG9SRnAwdTAwSEFxOTFGWTg0dWk0dGVSdjB4eVR6RkZYNmNwbDRGbFVJ?=
 =?utf-8?B?bE5XWTl1dGpqbGhjZEM5c3Z1ZGZNSFlJSUN1ZzNzbXZtaGhYeTd0MHlJQS9F?=
 =?utf-8?B?eXRPVlVBMXdBTy9GZDZ5RUhPQ01nRTEzNU50QTczUmRpN0s4cDliaERDQk9Z?=
 =?utf-8?B?OVJJbkpsWWNqR0xjM2FaVkJtR2dwaGI0Z1JEdnRyZHllZDJ4V0xzZ3A4YTZv?=
 =?utf-8?B?aXRENUhzazRIRHJzbVlXU1dPeGNSRlhDSkJRbEpybTZwRThmcWMrZUtDOTlw?=
 =?utf-8?B?QytZMmR3bFJGUDBxZDVmMWlRNmRTamRnN0J2T053czBQSmRRR1BSZWpsdFRK?=
 =?utf-8?B?UVJWVDZZR3JaVlpxUzdBWEdhZS9JaGVPUW1LekFhblJYbDIyaG1PQXZNN3po?=
 =?utf-8?B?YkFpOHV0WWpSSDRDRmxqOEdIdnVmME1tYm9HVjFHU2ZibnFkVTBsbW1QK01E?=
 =?utf-8?B?NkNvdEpuZmpLL1doZS9KTHVnTXJLcHl2S3VZQU9ZS0Z5U1NUTUIxQXpZazBm?=
 =?utf-8?B?SjVsTHMvUktDODJjMjE3Z3YzQlE4NHYyZ21qc0ZGK2xMdjNXM25LMXhsdHY4?=
 =?utf-8?B?czRlay9LTWNhSFpydXJtb3BUSlFFbEVrWUhsRndTTzJNSUlYc2hublFCQUxH?=
 =?utf-8?B?NWw0cHkxeGVXb1hTak1ZRjlFcGJYODdWa2h0dUI0MXgva3ROT3I5Mk5tTk5Q?=
 =?utf-8?B?UDBxb2RFdEZIN0Z4dUJ4WU81ZFJ5cnVqWmhvZ0M2Qmd4R2laK1BYQXY0UWhO?=
 =?utf-8?B?Lzh6ZklrYUg5cHRkRW9PTmlCdVJMZXhSanJXQ0NqbkVsZ04yMllMMjExMjhw?=
 =?utf-8?B?NDdUc2xhTXJhU0VNeCtkYzloVWdDdklLOXhncG9iSFBrVjc2Z1BxZ0JCMS9t?=
 =?utf-8?B?QXhhMjMwUTlSV1pLTHpBYStyRjhIVlRuWTBEWEd5WGRHMG1QVFRvRU1vZ1lB?=
 =?utf-8?B?bExTblhOUElDNTMvZVlRa2ErNXpvRlYrMUNwL3FDcnRHZGJNUWwvcHBzeFBJ?=
 =?utf-8?B?QzBmaVRBdHErTDV1alB2SkNmMC9NdExpUU5lNThCOE9jZ0gvZXNtOW1uS0V1?=
 =?utf-8?B?SkRlYXI5SGoyb0RlRHRnQWdhN3ZHMFRwSUhWcEtDWTlOY0VNYW94dmRWNnpS?=
 =?utf-8?B?aEhNMlBRcnhqeCt3ZTV0d1NqVzJ4VnZMUmMyM04yZUF2eUppTlNwUk9heFpM?=
 =?utf-8?B?aVUrWXlOK1YzcXF1akJsdkZVZ0kwSUZlanZpbEJ5ME1CQWQrb3dSSGUrUHBo?=
 =?utf-8?B?SmZUbVdNbEhpM2h5LzBhUzZtSkl4OVRNTGRmVWhaczh0R0xuNWlmRjZCSDdh?=
 =?utf-8?B?NEhpQjlFTithRDRjeS9HUUJKek1CZjRzb3NVN0VEa3hRMGRJaEp5NUxsL3Vz?=
 =?utf-8?B?TnJCejZUdko5NWNRd2hCRDlVc2V0RUl2dzJ3QndhbG5UR0ZBdmpINjNhbVF6?=
 =?utf-8?B?SHBWRjRuQkU0M29obDFGYld3T2swYmU3WG12OFBRVXJQOUN3SmFocHlMc2hT?=
 =?utf-8?B?MXB2Qzg1cHNXMEZSZ1pPdzN4akdpK1pRbHdsNlNlcC9ISWlRaklzbGpDZFJU?=
 =?utf-8?B?SUsvdE5VbnJoOGpwc1RQckFRcDBZOVlzTkNpRkwxRVFDdjBmOHRDUFBLUi9O?=
 =?utf-8?B?LzQvajF0RWY4ZEk0M0ZNbEVPVmNrRThzZi9JSFNaSURHcTZXMEdnSHRhRVc2?=
 =?utf-8?B?R1U4amdwZzk1N3dlRS92RDdQMnltbWUzd2JyVzlqNDBNL0NrUitwazFwM1oz?=
 =?utf-8?B?U1o0emFpWmVLOHgrb3pwVEt0V2UvY003U3ZhSVN0dms4by9JdS9seFl4dG1E?=
 =?utf-8?B?MFRFQ0tIaHROWmlqeXlsL096ZHVvVnFyVzJncHZaWm1yeXRNMFhZd0ZEWlpK?=
 =?utf-8?B?SktQNXBVUk1IMFJudXFBbXArNlZiVmRIUERRMXo0aHgrZkMzS0pYK0t6SjlD?=
 =?utf-8?B?ZHJTS21Vb2tHSWJMSWlKdUNMSGdReURwUGQxUENsTG4ybGI1YmJiRWp1b3V5?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d78947f-eb00-43f0-620b-08db6057b66b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 15:16:44.4952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOA4sQPCAO3EEDH4kDNYoR3aVs4gu6MCqGh+bsaPK+jjUeGvkH+Nm6xxvJMwsMH6Qhg8YnNSeINlzOxB4ZXafA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8040
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Replace DRM_ERROR() with drm_err()
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
Cc: Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-05-29 12:08:31-03:00)
>DRM_ERROR() has been deprecated in favor of pr_err(). However, we should
>prefer to use drm_err() whenever possible so we get device-specific
>output with the error message.
>
>Adding an "xe" member to struct xe_reg_sr does not seem very
>justifiable, since the only as of now is to register a clean up function
>and, with this change, print error messages. So let's just add a
>parameter to xe_reg_sr_add().
>
>v2:
>  - Prefer drm_err() over pr_err(). (Matt, Jani)

This is a v2, with a different subject, of [1].

[1] https://patchwork.freedesktop.org/patch/539584/?series=3D118402&rev=3D1

--
Gustavo Sousa
