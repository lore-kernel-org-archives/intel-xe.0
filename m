Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC82CE71062
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 12:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC39E10E0C3;
	Thu, 21 Sep 2023 12:34:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770BA10E0C3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 12:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695299657; x=1726835657;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=d9phxaoNuAuWYK66hOpvtV2L0K7um+k9UFdHLRTKfH8=;
 b=PS9tIGQv8Q2b/Ih1boyNdFbgMH5jNvIgGrwEJVRWkRDoQFPbgLqf3E2R
 pBKXhFJLNIN7g3Zhuq8FObF768efuU3ZNUfathi0CuAJYYaQEe+fdk6Xa
 Kft/IKN/4B5tvOZWFblBUIsanG3+BrM5gVnyz3WZ4PXDASNiArP7doPjp
 Qjt2gKBFp7FfpxR1svJUTtqtsaGomV/em5scZWKgXhMRU9WPC10VXs/oU
 vh5FYjjNRM8KqbelL6RiT+zwzGMSrYySho6ANmKSFHFwJRlRbh1T8TcZX
 oYdpSTOEFwZcHKZjmtlMUoalAQ9P7iwzK9ga3tRl7mvihjmkCRmytIoeK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="466813529"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="466813529"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 05:34:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="723728922"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="723728922"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 05:34:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 05:34:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 05:34:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 05:34:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7IhlGIqrjOcKTOpLvFosqbsTja7Pi9oLfXsfr7lFe35Gen5hhVmqrfwQnUCITjV5Q7dCfSoI0mlKz+kxd2uwsGYQmuRvyycmVkty2r+y5Sg7ApTv3vWTbAMpF/PSC4sg1yYUOHcdfUwX5P97UANMYbFs/CM0OnnkLhI0NYiunpnNwAkVD4zXVfj10PzfHsf9GqYjH9tZq4TUyFcFly8nydtoBsUZCjTCAI/zrBny+W5jsN9HmZKWZe2eSoheoK4fbIyBwTBj8F8p+KvLNauK3tAsl9Lr+/Kg8NlhdEcbO6VAjzlwW6Agi+t/33JMCwwMuGVAD0NQ4hU3WvOnA5LhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JfH2Ib5ALoAB/Kq6vntO0m9EQVZ16YkRS9b/KdlnPU=;
 b=dWjDlSTl8uU9gEANzivky3jWDuQG4G4E9qf7y0Q4RDnR0NWTZdtJ8qEAMpXVA8xdl6flR3fJPoH086QsGYSkVNnhhpA8Nuz/EiexTLN7uOYAUZHDrK3opZIrPpJlAx1ZHnYsWoMS8TUtrIHAkenX1HHiFaRfMT5hZ6V05SKRVqerOFRhwWlCr5MiWjCsVN9+gzZpKqtHtoez02zzeBJtpCI7CB++4T5tvkG3oBPNxkIDwOk4EosimVKTzMJiOsAB3mvtK2fGu6sMNI/pPzNuJWuXZz9JQwVoLlipenFFW3uGzXgaekBgONDXwrHfT6TiDf8pYlTwgEjTa1ZeOYh4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Thu, 21 Sep
 2023 12:34:06 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6813.018; Thu, 21 Sep 2023
 12:34:06 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <169420276656.14896.8044156734521786611@emeril.freedesktop.org>
References: <20230908184928.65815-1-gustavo.sousa@intel.com>
 <169420276656.14896.8044156734521786611@emeril.freedesktop.org>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 21 Sep 2023 09:34:01 -0300
Message-ID: <169529964115.1903.18437159931556831422@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::35) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|LV2PR11MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 343507a0-fe01-4fc2-d214-08dbba9f0b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iIDa50+XutkAwbuLACNcPscRUKmqJzgeyPJqj6lW/sMrI9QU8UnpPj0iv3t/BO/kO2+KGWBi8VFluP7YvEAKZuzKc1E6RDwY1Spy+r5DCHDrGEaKH7mNfj1q/Kg20QDt2SIHA8dFKSffbVUcriMnOgK1Ng1xkHKl7UDaC7UWd3Hlr44gXgBTilgt317B/CQjOrEwhvx5sl0Ebp/ZTGDazVVy+a/I2WsCgISPcAK5XhuTjpwuBxksitizCl6i+4F/XcFu4ayfPoDn5kr4GQXcxh2JtBogjGTOykQnPAjne9j+qy4AvDPmj7QEgPmLa8yPdkA3i/GAQAHSOnTJ5ABnSQTOJgK8iJKGVzUkDs0fBJ/ewpqciw8b+CS8hH8pVAa6YsjfFVKFnxJJu5aIkYh4MSGPXojCL4YH9+Wpp9GdTEBkMlAC0I3Qs7sQlDzfbTZX82BuBAcekgQcWlvmn/WN4mw5lu+sB0aV9n6QCF2khf92S71NDrp2+4oHU2JvkLyYoZ7+xhH+kvTZmN7EXVEspUJckzRpoN1NYDduVIQuJH79E4FBvuAMHEydD8I9D1GZ9kIWo002+zlcVfDpuqFRCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(186009)(451199024)(1800799009)(6486002)(6666004)(6506007)(38100700002)(107886003)(82960400001)(86362001)(26005)(6512007)(478600001)(2906002)(966005)(5660300002)(66556008)(8936002)(41300700001)(33716001)(9686003)(66946007)(44832011)(66476007)(4326008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blBPMGpDOXFDWVdmSWMrMEh5RndRZk95aTlFZWJ0dUtMc0M3KzFZU0J5UVpo?=
 =?utf-8?B?UjVzelVLcWttN3hoOHFXdVdpanpVMy93Wm05VDN0VHU2SnJQVERuSWQ1cURj?=
 =?utf-8?B?Y05HcnRsNEd0bVFZNVZYdGFwZ3RibTNYZ2tHd0dNWExKSHV4dld4UFA0TVBK?=
 =?utf-8?B?Z2xveGViaXIwZDlxOUFjUWRXRDY5UzlYMnIyM0NweVl1YTk5Z3d0VjJna0M1?=
 =?utf-8?B?VlhMcDNBSWtjT29IRGRENjB5L21DZ2o1V3hMQ2QzcXJZcUxnNUVXbFh0d2x3?=
 =?utf-8?B?Ni9UbzJHUDlhbk5FdUFLNytEUXAvWmpFZFYxUXI4VmZhZVdqcXk2dm8rd0RQ?=
 =?utf-8?B?ZDkxZnRUTG94YkpTWUQ2eUQ3QXIwYlVHSitmOHo1WXk3SEUxZENoMHBLMnlO?=
 =?utf-8?B?aEZZZTFvVWg2TGlnM1BUZ01qdC94Yk9WazV0QnBoeDloVWZYb2RrODJ2ck9F?=
 =?utf-8?B?aTFZSTUvUlE2aDZtWGRVOVdXeHpLODJIY1BIWFVvSXpYSll4QTJRVTBGOGNZ?=
 =?utf-8?B?c2RGUHdud0kzTzhKblFjbk9ScVBBcC9ndFNXenZmWHVpaGhnWUhidEUzK0p1?=
 =?utf-8?B?ZXJLUWVJQndINGwvcE1wMkVJelF0dlVLTHk5dTZTaGlRUGVHSjh0TkloZFIx?=
 =?utf-8?B?b3RsS2Q2b0ludVJEb0k1VWJKRnpjSVNyR3haN01qT21qRFNoSGNvSkdFcTJs?=
 =?utf-8?B?S3IyVG1ZZ0x6ZGtOYXA1Nk1UeXMvWEVSSkxhMDdHV05RdGJDR3UrSDNvTmRQ?=
 =?utf-8?B?YitFbzRWenMwRVhIZEVUcFZndk12akhaOU12UjN6UktOTWVFUHhLeHJkbG1T?=
 =?utf-8?B?Z3Y1M0lRSFZjN2Z1VFFJRGNBaVE3WTZWTi83Q2JLWDFzS0lySjlCUFZ2ekIx?=
 =?utf-8?B?UjlyWjArNW9RcFlESjZ6YVZ5UnJXNUZEdEZVR0VVUjFUNGZmb29XYWMxa1hK?=
 =?utf-8?B?NDFxM2gyWk1YUTFYNnpPdEp2STBJeStjdURjem4rWEtrWWJhUGE2R1htM3dI?=
 =?utf-8?B?aWRjcjdZUkZvR2xsRVRSL0ZJMzJKU3hac0pmTGJKcTRVRHJnbkNlWWpPUVNU?=
 =?utf-8?B?cDBrYVJIUDhLeTMzRmUrNWhiNDJVdkExY09BNGZBOXZYNTFzRW1RWkNwOTkw?=
 =?utf-8?B?QWx6Z08rS0EzQ0t2OUwwVjNSYWRrSjA2dzFaUzA0dnBhYnVYaDB2MkNMcFVn?=
 =?utf-8?B?a2lsanJSeHlseml5ZWJZWDMrK3JZT1hiSjdFUHJuVm45NmpkWXhURmFWRVEz?=
 =?utf-8?B?RVE0S0VxeWRObjhMNFEzRTFLdUpoZkhPTnpnOFcramtNUFFyTGZBWmpBOTlO?=
 =?utf-8?B?bGJ0NmxDc28wclJzSndMSlM2a3BTZzI1S21qVlArSjcvZUFBNi9iSUZDd0Er?=
 =?utf-8?B?VStwemlja2ZoZ1lQMHVrbHlNVlRQMUIwdThUVnVwbmNTTnhRVHFUTDNBT2p6?=
 =?utf-8?B?TXNDYkpsQi9sNGQxZlVaRm85NnA2eGVTSmtTZEo3S3BrWlR3bHMrUHVLQWhx?=
 =?utf-8?B?eFV0Rlg1dURHSXVxZUJLa3RyRjdqS3l5bTVGUUF4WHE1TFpkSU9tS2NickJJ?=
 =?utf-8?B?NlBCMXdoTU84S3ZSeW9RZHM4Z1dyTEovaGx4ZUpaMldXblZNK1JNRjR5L1Fm?=
 =?utf-8?B?UGYxOUxBaEtJVko5WlExT2dTNnNiTi9BMVF2UW1xMVQ0KzExOEp0MVhqenhL?=
 =?utf-8?B?WUphb1NwWG9TMlBlQ0p5SStwZ0hob0NLL3d6YVhqWXJpYnVQdDdFZVhkNXRL?=
 =?utf-8?B?bDk3WkVaWU45RmYra0d1MVJtbks2RVZQRWNrN1dMUy92Z0NYTDBjWFhpOWVt?=
 =?utf-8?B?eVBkM1ZkV2tJbFU4KzVYZTNZUHNwMGxUcjI1WFlhUzJsenJGZFhYdVF1c1c1?=
 =?utf-8?B?T08yVUE1bG96ZWRrSy9BWDZra1U4cCtwS0pEZTdydDBYcGdvS28xVlhqZytZ?=
 =?utf-8?B?b3pFc2Y3RW5NdHhwaVExSElSZ3lXa3phVHZHZzRsKzR2bUZvd3Fma0lNKzBu?=
 =?utf-8?B?YTZyU1IxRVFiYU10ZWU2MmlwVXVkT2lRWUVEVEdVUjVZdklYZGFGZ05KSk56?=
 =?utf-8?B?Rkx4VDV0Rkk4OGdvYi90ZnpTUm5xK0VRT2wwVlFhR0RiL3loYWM4MTg4aUhQ?=
 =?utf-8?B?UWJKQStWQk5manBOMndKdE1kUUdPa2VKOUNMcERjeHV5SW5vUkRXZEw4UGsz?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 343507a0-fe01-4fc2-d214-08dbba9f0b0e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 12:34:05.3257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4qJQSE9O9KBS7l3MO/8cnKlzeMso2VVexb9sZ/o2VpkEx4aCLCyTQiVa83YaQrzwQksBKUBM2nlzqu4Nowxew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6069
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Remove_re?=
 =?utf-8?q?dundant_call_to_intel=5Finit=5Fdisplay=5Fhooks=28=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Patchwork (2023-09-08 16:52:46-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: Remove redundant call to intel_init_display_hooks()
>URL   : https://patchwork.freedesktop.org/series/123456/
>State : success
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459_=
BAT -> xe-pw-123456v1_BAT
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **SUCCESS**
>
>  No regressions found.

Pushed to drm-xe-next. Thanks Bala for the review!

--
Gustavo Sousa

>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Known issues
>------------
>
>  Here are the changes found in xe-pw-123456v1_BAT that come from known is=
sues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@kms_addfb_basic@addfb25-4-tiled:
>    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([i915#6077])
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/bat-atsm-=
2/igt@kms_addfb_basic@addfb25-4-tiled.html
>
> =20
>#### Possible fixes ####
>
>  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>    - bat-dg2-oem2:       [FAIL][2] ([i915#2346]) -> [PASS][3]
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a7=
6a8a68020896bdbe0cab459/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after=
-cursor-varying-size.html
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/bat-dg2-o=
em2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>
>  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
>    - bat-adlp-7:         [FAIL][4] ([Intel XE#480]) -> [PASS][5] +2 other=
 tests pass
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-363-92bbb05964b2237a7=
6a8a68020896bdbe0cab459/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-e=
dp1.html
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123456v1/bat-adlp-=
7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
>
> =20
>  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
>  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
>
>
>Build changes
>-------------
>
>  * IGT: IGT_7476 -> IGT_7477
>  * Linux: xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459 -> xe-pw-123456=
v1
>
>  IGT_7476: 848905faf8476f4e6d77f383af1c1d7396be5764 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git
>  IGT_7477: 7477
>  xe-363-92bbb05964b2237a76a8a68020896bdbe0cab459: 92bbb05964b2237a76a8a68=
020896bdbe0cab459
>  xe-pw-123456v1: 123456v1
>
>=3D=3D Logs =3D=3D
>
>For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1234=
56v1/index.html
