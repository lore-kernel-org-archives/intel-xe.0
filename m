Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D72C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 20:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EE310E0D6;
	Tue, 16 May 2023 20:54:11 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2977B10E0D6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 20:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684270449; x=1715806449;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=57EPSgHz9E5SGrjEcckZOWNraxKvJUz+6QvvsNFLQAc=;
 b=Rqa2LcHgbvYeXntIbXZYB+ZBRx07CiiFmQyHeLrU18wQglvs6mCvbzyR
 Saf09byVAWy/fxV4Ay+tKeL2kivLUKlNZvT/n5kOjmjrQvYHICGyyOW8g
 y4lGrVICDBv09eREybLvWI7YuGcyTYIODQ0YGfDEz/Dunn44ILPKWo2CT
 X5DsiORh81LunNSq671hlw6gC6sjpYPBrzN6VSq10oB/1ytbiwoIMkGCm
 xCfCComt4+uaAvkDvchCer5ygPedtmc3ffP4nTcc4nSD8xdRr4KWIMaiC
 yXiG53yRoRfdy9PasBgLyqZmbNEoOeXubEXgx2jgDUGlw4yecp+pLIwkS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="379776062"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="379776062"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 13:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="825696906"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="825696906"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 16 May 2023 13:54:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 13:54:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 13:54:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 13:54:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 13:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfTt+vRbAbHYZg6PZNrXw7nkM7sroOShvDOOLyyoboLhitjh8/6EQEVdjUhqvhaFZtUI2R6tZEFPQ1bYQmeOPksPMvwMlYfAkZu6IvQV9GZ1t/LszmUu/RM7ntTmeks1uW0mz9tZbJWvzJFCJUaCb67/cIAZBAp8USx7dp+VKwJKVI5gm+gb9lx/p8PPZT1McxXm6Eeu5evEm67/nnIGxLXE1uUkaUTtbkmh/Bn6ZePgtwnjXDiSRnduG3HFxJMyTEDuYcPrzyr+coTBw98wJ6Lqp1m2nYxauqC/o8w34pZEkNPvoP+Cu1aMV3jGwcluh9WNJtTvln5NhqIZicqJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e43wVxNmieA9BXaVjW3QsXF8gV1Fv9QVktKWUibcHpw=;
 b=LxvnHTuOVzJ1gkrD0fkEWQHRRhFUvvv7zMergwd0oQLCDrHVbOjuy+KtrCklFEj2cAUtWEPM4LKZ20pgVKW8ynVb+R63IOmE09M+0wdjHtJKrkI3bFMh41mEXl0fmtucMb+66t9FaSIXNoHSNEf9SllqrHBznaHaqPpuI9i7EoKOytoxQXdEaMH0jw/K2Zl1dEg6ITSeat4BTaOsZPGKlJ1cUUteNTPRBrIhkjZR1rBZgIInw3eKRyDNoK5/ypQcmmgtmn0lD7VI3vwKmSK2AMW1R283+/zdzQ4MM9Si5S38OZqp5YgR34cnIWcD+EmqqrA1fR3TNbH4L5ie6ZOKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CY5PR11MB6535.namprd11.prod.outlook.com (2603:10b6:930:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 20:54:05 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%3]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 20:54:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230511194822.626036-1-gustavo.sousa@intel.com>
References: <20230511194822.626036-1-gustavo.sousa@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 17:53:59 -0300
Message-ID: <168427043949.174531.6717508815255673444@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CY5PR11MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4d1466-8a4f-42bd-50c2-08db564faf25
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gl9X9wQiD+jqbsQQnmsuGgT+HxXw+6NkMU5NoTt13La5I1wyHM+xvNqFKcBpDseczXfllY/9xR67AscVYc47Xx0IEv0pKsQpFepOzOkXcHy+2mBP0hGQNMIcFYGynwMHM8hijigbFFyhH2u3lTYZg8KcjbfLYMWcXAftfo1ID/bfOk5Kqs8sVQ2pzi7kB/+aM4S1dw+pYaD0u05ee8+n5EsWPt1ieuu98Ybd2SfAqV6ODXlRklOROEfiNB9P4/lwb8MTn+IFZLaUT/5NtjsVQ8HI7/FOCnECTxEyjyCnEvzl11QOPUndQRh1ETnPkAmOR0W9Dn6fg+12xRzt5TUQ94MrEl93x+mohW59jTymcY71SZscGb+EapgR9pDucNM/rsbsa/4BhtoJsv2HLeCnGLyyEkJlDeblTSkYWZ8LTaQrEwPfaIyOIRdZTn0B8eb7yR6UunEJyd2IYWz+uBBh4Mn6f+qQ4/AQmyXT9YFJCHQPjCuKw1IdACEzT7vgAL+3KPSrdivUo2hCv0Eu22Zo0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(4326008)(478600001)(66946007)(6916009)(66476007)(66556008)(6486002)(316002)(86362001)(54906003)(966005)(4744005)(186003)(107886003)(6512007)(26005)(9686003)(6506007)(6666004)(8936002)(2906002)(8676002)(5660300002)(44832011)(82960400001)(33716001)(38100700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVJ5NVZVWEtFNnE3ZHR4amJyc2hjcm5mS2xpRXlMb1U1bjNxMTV1QlRsMnJa?=
 =?utf-8?B?Sm8rTG9yUGp3S1owOU1CdE04WlMwNEd4MEsxTzFrdnRld1oxejIxVUhJMTBZ?=
 =?utf-8?B?eTZabFpWL2FkRWgwR09obXFxNEpWNTduTFJ4WGRkWGdNL2VKWWFLaVdJbktS?=
 =?utf-8?B?QlBqMGtXbjhxWW9LZDJIKzkrTHZyQU5VNFlQWllYUW4xVnNDbkIzdHR4MEdz?=
 =?utf-8?B?M3hacGFYZUhYTVhDbFJ6ZzhBblU4ZDJDUzl2TkFKcjJBL3UvNlEyZlZrZkUw?=
 =?utf-8?B?NEtXZzR3OXJ2amRSUVFCdFUzYm1qZllCc3hFQm43aHJkWS9sWHJsSGdTc05q?=
 =?utf-8?B?cTBUS3ZKcFJiaXVZNG9SZGxhUzR4R0tJT0lMSi9ZYTZnM1VWbmlzOU5HTWRH?=
 =?utf-8?B?bGg1aGZhOEVQMmNiT1M0eGxhVExsTERCUllUT1FJZXFLOGw1MXZ3bHNPZjdR?=
 =?utf-8?B?NWErcEcyVktRT0FIdTIySE5UaDdRWlBadXBpS1lkazBDS3VZeVRpODRzUCtj?=
 =?utf-8?B?aHU1Z0phMUlWM3J0aVdCeXQ1WXc2RTFpcVVweVR0dWFHcEJEMVFES2Mwd0lP?=
 =?utf-8?B?cG4yMkgvWFFWdFlUTEgzYkhxWElPcTBtT0tkdmtscU9hZ1RCaEQzTXljMzUw?=
 =?utf-8?B?NTQvSkszaHpvRkV2VFdDQTJ4bFZWZWhiN25lZ3hXd1pNL0h3R1NobHY1OHVB?=
 =?utf-8?B?U1pWczFMVGp4ZzQvWHBrMWdVY2hSdThNUEQyYWk0cTl3TGQ3UjhsL3QxMkRI?=
 =?utf-8?B?OEM3VTM3RCtYLzNudml2cVV1clNJeitkaFFhdWRhRDZuVGJlcEdiQW5ZM1pl?=
 =?utf-8?B?SklyZWROVG14d3ZGYWlwUGxSbWcxV1BIQjRKUFkrckV2aVFqOTdmMnRCOGNp?=
 =?utf-8?B?ZFdUL3lzZUwxV1hrS2FqZk43N3JMUlY5OTNtYmJRRjduL2o1NW9vUEwyRlA5?=
 =?utf-8?B?WUpKSWpVK3F3U1M1ZThGdEg3c1F1MWVPekNjSWpTNitlbGN6VnNxSk9YV0tH?=
 =?utf-8?B?dXkwS1pHQ1lBKy9pdXkzZ3lYQnJxRU5sdXo3a0pMQVhveWowdDl0djRqNUZF?=
 =?utf-8?B?V0l6Um9QTFFKZk1vVGp0VzJqRU1EQmRhRmVyR0NaSS9JZXlkR0lxUC9UNmd3?=
 =?utf-8?B?QUljNEZRUkRZSytrdmh4bmxTdEltRnRQcmJoR3QrOXNRUE1ML3pqa1QyOVlL?=
 =?utf-8?B?Y1RmVVRkcWZwVnZoTU1FY0YrMUwxWTU1Rk1jVlNoQm1mUUVGRU84ekNwa3Ev?=
 =?utf-8?B?bjB4UE9sOHR6WjJXNmtuQ3hsek5tT2VCQXFwYUxkdWZ2MVJ3cVBaN3Jkek45?=
 =?utf-8?B?RzZsaVMvYlN4ckNidEw1QkZFL0loQWtUcERPa2JsZktBWWNlc1JTdWY2MWN5?=
 =?utf-8?B?RDZ1QnhXamhFSldlaS9ta3BLZStQaHpSRnNhMElNNVQ1S2RKMGFRcC9WN1V5?=
 =?utf-8?B?NzJ2RDBZSFBVVzEvYm5Kb0wrbFhqU1B0b3NtLzh4aFpZTU5abHl0cVlqU0pz?=
 =?utf-8?B?VlpXMzh3OEtDTGpCditVei9ZY2RBUmhXYksrTS8vNVRVN1JtV3BZUlFsZGY3?=
 =?utf-8?B?b2R4d0tiMysvRmZ5bzRvNk9vRHRsUHUzVktZYkdiQXk1djZRTFlRVHNEMm5p?=
 =?utf-8?B?NVdHeVFsUFc2SFpJSFljN29wT2Mzd29TYUlKazBRRzNEV1VybXJZSU40YnZ0?=
 =?utf-8?B?K0tDYkMrWG8wUTd0cTNsZW14VXBTdzB1R3VNNXE0azVTc29INkhOS3hwby9W?=
 =?utf-8?B?bENUb3FzTjBMOGRLZU55dXJ4S1cwU0YxT2NWUmVHWmhYZVdzZEVmb1FwN0RB?=
 =?utf-8?B?STV6ZHlRT1pwdmE3OEEvQVh2RU9DdWhXTDdZQTU4c2tpOTBPWjhrZmRnclNL?=
 =?utf-8?B?akNiUmN0Vk5sb0FUaEhZOEtkNzVWMmZHWk1ScGJTRG9UeTR4b1NmVGJkOThw?=
 =?utf-8?B?bE00NDlyUmdoUmdKclhiZjI5ZW1nK08vM2RnMDJ1Y1NPVTlSUTl5MXZBWHFM?=
 =?utf-8?B?MXRFQURjV0M1eTRKdk90RUN5bDBwU21OS3dnbVhqdVFtU0VJNy9zclZ0TDNW?=
 =?utf-8?B?eUJxeGwwSmVpYXlNTW5RVm1VWGF3Vy8rbUtac0ozZVRhOEVST294OTZCN3dG?=
 =?utf-8?B?WS9yT2drNjkrWVprUC9lR29GRmxOLzVtT2FxdkswcW03aUlUUkNWOFV4NEJk?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4d1466-8a4f-42bd-50c2-08db564faf25
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 20:54:04.6179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HULKTh/P16KXQdD/oZy5CEKOzX3Fs7H1l8U24VPKXOr52B5up0UVf1W/Gu69aou7PN+lFbWiamqZR6Slz96YtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6535
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] drm/xe: Call exit functions when
 xe_register_pci_driver() fails
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 11 May 2023 16:48:20 -0300, Gustavo Sousa wrote:
> This is a v2 of this[1] single-patch series.
>=20
> [1] https://patchwork.freedesktop.org/series/117559/
>=20
> Gustavo Sousa (2):
>   drm/xe: Get rid of MAKE_INIT_EXIT_FUNCS
>   drm/xe: Call exit functions when xe_register_pci_driver() fails
>=20
> [...]

Applied, thank you all for the reviews!

[1/2] drm/xe: Get rid of MAKE_INIT_EXIT_FUNCS
      commit: ae321ced335d51f9d8ecaab46226ffd8a783b466
[2/2] drm/xe: Call exit functions when xe_register_pci_driver() fails
      commit: 68b73294f59496a03c5fb4102776c23baf9f1a5d

Best regards,
--=20
Gustavo Sousa <gustavo.sousa@intel.com>
