Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECFCC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 01:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1C710E2CE;
	Tue, 16 May 2023 01:23:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9684010E2CE
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 01:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684200232; x=1715736232;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=EAMlUnvOqczpjOnTzHydP5r72N3zgAwuZ4QYyTfPdoU=;
 b=VWP0yjiUYV60FznDzRwpr2cTkrVP1w3BGMMn4HHUVJSIqM8SbZxn7Lgu
 0Nj3KQmrM4U5qc9ODfAZReW9IFWsrXC87CxWNKf26DLvIEq2ksYTb9Y8B
 DidtW3+r4b4zUNRWQ1P01WYTP+3BGKYlmBtMw3bGVHiyCab66lLYieDNq
 1kSxLeEXyyCq0ZnzXmuQYwFIdVOrqD+i9rbYoG5hlHLLVCoCXIq38hWcp
 AVdR7Rebm1zBygFwYjW/MQ7hIpWqM2GPdp+yv+BTxrvES6VdpPe5C5Xvj
 G3CHNoDt0X79NmbEpQvHKZ+7RbtXi1sbAA4xOzu6DZC0Mqr7T5csI4Trm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="330965177"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="330965177"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 18:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1031092256"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="1031092256"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 15 May 2023 18:23:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 18:23:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 18:23:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 18:23:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 18:23:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g61hMtLM2PRDvOUwBy3Q+qprS8qMEdbN9ujsUVx2AVVOHbKNJ1DdPu/4sdOCvGqCMJniVn9zfMX3UzZCTxF+LBgTIqi8TbVkVbPqnqXuJSaW1c6JHeF9O27SHAwqIoC8i5Au7xqPAL3zilxKtAUATQhwYsZALt2pz1+YT0zguKqA25QiY8JUvYF8k8Joj2pEfvtk4fhD1p0XwzANqCUPz0xYc9uJkmZW4i71wHxfxLU7qmh2H7FeJ5pc4dcsayP2UvBZ+eMMFvI8fkny8jQ74G4PMXqf3dmEDnuwK3sJ69kACaHCq6+isIvIP+RMF01AnqE5luZG4BROucLJOrRWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iqSu/Ab5ET3os2BIeOWt1aYc5ZSGPqewEunuu0JTqI=;
 b=mfztbCyIctIueiCXo3eTAnuVMRV+Tseqr5vG6ocnfmFzZpqcnXfIsyRvd5qRZ3cGYjjYDvCn9HNyQ/FtAhv9E7pl81Hoz2+uDzBJL/VIDlYzgvVx1nfVXrAyY7uNiNlqvZ//FJzaI1SOPLrB/Qs1G14tOcsD4u50FxuEUwDsSOYORoBaGfRcxf1TeZoI7EYIgrcLwQJy1tZujaH0pa5Qh4Pfz+6iqlNrmemg0IcgnU34POrygUvNAqm7jzn1qW9UcYZ6jEJ6TZI28a4Ro5dsoyF8HTEzY7eTNVoyTZ6E5tnU3NqDd6RuxHHybqKq8uPf2uSzi/3VXu7M1rtHf5hUzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 01:23:48 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 01:23:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168388880559.26101.11929545409498758841@emeril.freedesktop.org>
References: <20230511194822.626036-1-gustavo.sousa@intel.com>
 <168388880559.26101.11929545409498758841@emeril.freedesktop.org>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 15 May 2023 22:23:41 -0300
Message-ID: <168420022142.13184.14005986251398268905@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c2282e3-db90-4180-4090-08db55ac32e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qhWxwetdbLkcRwhgUOgvpZhLAAwWZxJv+kPVLPBJdy1pgqTYwgUdBV1Wj+GWjC1z++LBA68bciy4TMmP5IaLjc4U5+yXr7gMZnBIbgaaMOzNE8DXxRv/u04lsUgfagiZfp7LH5aOtdHqHlQyAntiDMee2Q9jvSYIspmYAw2Z+fi6w+81VUVTTEMMsTyF9zL7+KIKtuLoveFuzz4k4hbVmT2jW9Hu+2eKoQT3zTqszMidqWSdHp2ui1hP7VCAkhA8OcC+dDBcRqk757rtZDwn6XD10EKXw9q6etk8mRfZIQKT2rJHrtIC+g84L0K6L00UVdE2snyw7iApXshFMF5fgz0CJxQfi/KZ13ew89zUGY6RUyy0HudlSaQkfGg62fjGh9OCtgh72w8M1V+tp7FPlciypNAXD4QAgB6VDVAFn4xHxoRzgwgv1VLG8IVxRK8YfvqDOhfnz/HbIgVMFA3PkRQH8ePAuZ3B3JQ8b2maW78n+7Gs0cw4H1BCAur/0grEVVkWgtSEvQlK+vc754bGVNhHZM7Z5nw+vaCO3eFaqlg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199021)(86362001)(316002)(4326008)(66946007)(66556008)(66476007)(478600001)(966005)(6486002)(33716001)(4744005)(5660300002)(8936002)(2906002)(44832011)(6666004)(38100700002)(82960400001)(41300700001)(6512007)(26005)(186003)(9686003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OURERjRab0NGZFc0cTFvQk9PSWtpa1V0U3dqdnF5eXplbHBEZXpFSzU0OERT?=
 =?utf-8?B?RXJUc2tZMEt1Uk44dDVxMGIzTm43NEIwMjVsc2k5eXZQWmFZaFl4cEhBRnFI?=
 =?utf-8?B?OEdNSDZsb0JBTHJZei82MWgzUVZoQkFoSHBHZGZrRTA2ZVMvODJiWEkyNm41?=
 =?utf-8?B?WHNNbTVEWXBFZzFRcm5SZ3NJcHhINTRvUm51Rkp6aElmblNoN3lUM0RwREVr?=
 =?utf-8?B?czNzQ09oQXV3MEFTcUJFK1NwUzRQTG12WVBuYm05SmJJaWNpL3hCZTZ3NnEy?=
 =?utf-8?B?VXRSem9BMTBhWjNhc0VLb3hJK1FVUm0zamJTb1lOMG9wL0RDVGdmUTg4Q1pF?=
 =?utf-8?B?Vnk3ZnlmZHRYNG5sZXNSeE9kR09maXFWaEpYUUFnYW5aQlQreDdVTlNoN21w?=
 =?utf-8?B?LzAwQ25jM0ttVmxjUDhRWGIzZTBvWEptN21rbG1LVk8rNGJTeXZUNjFNYVhX?=
 =?utf-8?B?K3FCeE1xWU1NbUpxbEtnaWhHWnBibFNVdnVJY0dUT1d2dHIvWlRGUS9OSita?=
 =?utf-8?B?VVhPa0d1NWtxYWh2QnZTdWI4WnFjTURrc0w4Umk3VkpmeFBEelNFMHRJUFFt?=
 =?utf-8?B?Q2gyb3lmS0FlY3N3RmNjSmtkV3V6MWJIT0NGSjMrZ01yMnIzTzBKSjFjdHZx?=
 =?utf-8?B?NW5neWs0eW5xM05ZUXkvSzVyQnV3RUI3dDlGMVlUL2o5REJ6cWtUdkliazl1?=
 =?utf-8?B?OGdyYXdWMjZlQ1QzdlE0MDhDTGdacWl1UmFFRVN0VmdpaGxLSkwvOWJac29h?=
 =?utf-8?B?RWNQVTZmV2taRU9rdlpmWVRXZVQ3TnRpL2hSNWpxTkUxMlZoWklhUzAvdzRS?=
 =?utf-8?B?VDJHQ21ENkwxcXpDK0NyRjU2TEFCYUxsQ2tKU090TWZPNGVkNDVXQy9xeVRY?=
 =?utf-8?B?QlFvS0o1WTlaVW5kUWd2elVwWEJrRGJ0elpQM1ZFRjFEaldzTkM0VEJSd1V0?=
 =?utf-8?B?Yzh0ZUxFQWZqdVZFNThoMjZBd2psSE5ydFhzSGhMQTAycFpOOVU2UXp4VFlT?=
 =?utf-8?B?Z1kyR0c4K3hhbE9jNkJsVERhNURIQzllZG9Xb1NmVEUxYjhoVVk1UXdvY01H?=
 =?utf-8?B?NnphZXVGZThzSGUrSG5PMVNUejFSTEljRjI1dFVVNUUzTG5nb3NSZmd2UndQ?=
 =?utf-8?B?ZUQ1dG16aWkyL3l3ZEhtUUZLZzF3ZlpLZVJRRU9ldW5IazkzWUVjZWp2eFEr?=
 =?utf-8?B?V0JhaGk5WlBod0lLQ3hKY1gvM1F2dC9tb3l0eDlHV3V6dFN1OENCMG1uMHJh?=
 =?utf-8?B?QzQ5NFBUUVRiaDNOWHNIcTV6SFJld2hjN0ptUDJORUtoNEEzQ3lUUkRXbVk4?=
 =?utf-8?B?N3J4Mlk1ZC9xQnJ3VjB6ZHVVclNKcG5haWRhaUpnTjhaQWVrQ21uVWxqamp1?=
 =?utf-8?B?dk51SmNkRE56MTE3bWkwbDNERzlyamlGczE1L1BNMDgvei8rcFVUU1NPUVdX?=
 =?utf-8?B?enZVSlg5K0p5czlkQndXNHgybWFlUnFZSzY2QkZPUFB1N1NkbzNQSGZSeU1V?=
 =?utf-8?B?TEh5Nm1SM05INWpvdzNzS0FwcHVNdkYzWWFXUGdwU013UlI1NzNCRWhQS1cy?=
 =?utf-8?B?aHpkZWVpZXVscEc2U01IVkNOd2R5VkdJc1g5ME92TFR6MW5malJoU2lmbURr?=
 =?utf-8?B?MDIzZmJvQis3TWpxeXhGSnU1VW1ZeUc0NFg3bys2S0dNb2EzRUdDSDNKOWph?=
 =?utf-8?B?YlJSblRvMHU1SXpKZzVQMjZKdEhzVjVVMEdMOS9Fc3BvNTl3NFJoeEpMM3Ro?=
 =?utf-8?B?cEEyS3kvdHpOU2tnbTJlTndwNmY5RnpqUGprNmhIeW9WTnc4bE5ZaDRRNjdR?=
 =?utf-8?B?WUgyclN0L1lPMk05TFN4MkVkZVBSNmpLbnROdksyWnlYb1dyR3RReTJZdi9B?=
 =?utf-8?B?NTJLN1k2RTFUZGFrbHpudXZJVkRlWlk4aGd2V3owODVmV1pzdWZBNGpjeE11?=
 =?utf-8?B?RkRqYzQ4dWJmS0ZGUHVxUENUOThBc25mbVBsOTl2MFJnYjc1NkdManQvYncv?=
 =?utf-8?B?N1ZFZlpXZGlWZHEzbU9ab3hOZUI0dGxzS1Axem1OVHNwR0hoRjZQamhvQUNs?=
 =?utf-8?B?NndFcGE0ZXZEMXNVOGd4QnhhNllZTGVDb1BBYXNVOU5LOUlET3g1QUxoNlNm?=
 =?utf-8?B?VVcyLzRjK0FSamZpREh4dHBPNlRtaEF5SEc1WEQyNnYwakkwb0pHNno1NXVS?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2282e3-db90-4180-4090-08db55ac32e0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 01:23:48.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpDGCxV3iBu3f4MRDAawNvrSf+GULRdC2Ae+DwXUeYKdoN2Sal8HIVTc+YbWTZ9EnFMpw7654TFE3xyA7yKBFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=97=8B_CI=2EBAT=3A_info_for_drm/xe=3A_Ca?=
 =?utf-8?q?ll_exit_functions_when_xe=5Fregister=5Fpci=5Fdriver=28=29_fails?=
 =?utf-8?q?_=28rev2=29?=
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

Quoting Patchwork (2023-05-12 07:53:25)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe: Call exit functions when xe_register_pci_driver() fails (r=
ev2)
>URL   : https://patchwork.freedesktop.org/series/117559/
>State : info
>
>=3D=3D Summary =3D=3D
>
>Participating hosts:
>bat-dg2-oem2
>bat-adlp-7
>Missing hosts results[0]:
>Results: [xe-pw-117559v2](https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
117559v2/index.html)
>

The only difference of CI result with respected to the latest drm-xe-next
(xe-164-9e6366d33f771328bee3f570c220bdcf8ba057a5) is for:

    bat-adlp-7 igt@xe_huc_copy@huc_copy: pass -> skip

The skip there is for HuC not being loaded. This shouldn't be related to th=
is
patch.

--
Gustavo Sousa
