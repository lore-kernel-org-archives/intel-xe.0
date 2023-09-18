Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFF7C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 19:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CCB10E2DE;
	Mon, 18 Sep 2023 19:27:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3861110E2DE
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 19:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695065230; x=1726601230;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=rXUxBT8pyZp+S3BU1W3AOaCI00Oi0Hhm7+vhiselWjQ=;
 b=POzG2ykut9G6SSPFdQXJakU1Goo5rY3vJd6BpSgqJGXchz0oKbNr1iHs
 x1U9jE7ISVqDzr0fUv9qEgjFT3tb4PvGIBJ5Qw9mUO70FVrnB9wfZfLZh
 cJKf8ryExPF0o1SdfTijSE0P3xQ5WaxWbqkazYjyMow4nzpikJDMvXVGg
 e80hMO9XtXW67zrE041WJnYT6wuurUF6CjKRqzAmnN2jYvefF5jBRtmM2
 qANyTxGlYXfshpDy+zKM5+aR4TgM1s0yjMu1EmEOed/2Dp8myLAag2eal
 RzkqFD6Ov4bH85aIgUHJiluE4llvNcx3T+WMZUGYjgOpYaswKfOo6ZV+F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364793239"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="364793239"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 12:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775245910"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="775245910"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 12:27:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 12:27:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 12:27:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 12:27:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 12:27:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn6/HEvP9Tmaf0Qo4d09miKc+1P1sPlLJkRf+jts08w+eaJLjQ6yeM+i9uTaE6bR9avMIU+YN1p7CshWYT10FOpGrIfBe2UXrMhtKmMRlu86HAAc09THymcjrMJDIyBbLoNPfWFsOvPQTAODJhmcgCz98AvAQt5ltyGnfLmVkQLjApl+ps6m/76Wh6VanHGKdC/KnJ/N1GE9LS4S+41bsTWfNOgEKLMRdcAiGoXKwaJrqygCpuY0nQ53wFQcLRFi9fpMZYLhnzZ+kF2tG+3wKLT67j6bkoy3sxqGmARvXL9onuVVdyui+YJlqrVzInKIa3XMjYJqZ/CSAZRLkq5hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKfN8+UnlbYD5TsENjyVY6lCIOjAJ23qRmcooFPJU64=;
 b=aiyqhwaQnZCKguF81GceUdJi9qbSrBc0K3X+Q13sekMW4CO1KJXsFnfXV+QLo1cU8JO3OWfQ862hrFJuP8CduaGf3+tOQgk246SuPw3CNm0sEC18WC19F6jPvR5snnE9aklWb6xkBTKYUB7fWBDXJ5WkTvN131m55O57b2ATWc4JuiiOscvN/XtTC30wcSljlV2Zsy7QtS8VE69H9JZbK77uU2mfMF4nz3Mrzhn2gt97qQgTu5cuxHZxH+NPSEZKSnIq9X61b3egftrDB64JP58uD3pVZS3T5t2SuhG9mzSOTNvRfRZun8O7QXEwC+8a1ooerd3irRMKfIfuMsupdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 19:27:04 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 19:27:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <169505366028.32418.7953204472390472169@emeril.freedesktop.org>
References: <20230915220233.59736-1-gustavo.sousa@intel.com>
 <169505366028.32418.7953204472390472169@emeril.freedesktop.org>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 18 Sep 2023 16:26:44 -0300
Message-ID: <169506520400.2120.861898345738739152@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR06CA0051.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::28) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SA2PR11MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: d73c9931-c4cf-458a-89bf-08dbb87d3cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MwoNHOy5Jg7BEbpn0NKcSHUshJR/lTJWIL2LAxwslI1DMLHpg1OTvBZS/VUB7yJOXwmFfD93GBAyiAECUyTUsGl+zPnRu9pD3DqYJzPv3MlVPrbOKk48gEAAAZLO0wO8vXrHpiK2HfQxhkPn6iS510qw3XVJACS6Ew5BubbYym51FLTxtcGVRsO8X3GQQo5Ej+Ys7VEjkNcBmNmd27p/+Fuv4Lxe1+JQy6s3p9Nuvw0bn5EpFkD2gWmkTPxMV6JsH5azUo6yML3RaQZhM4FS6Za861YAV9IaQH2XCxgDmGjq4yQ1kD2tMBgbi6fPHNUTEFVzu9pOap8Plsrb56hrWhNo7+gbxoqvUSe2fTiRLdcP6+296G1+sBPO/f0vh52n/P63UJRCSgYwi12Gi54mlhG7y8mB61jJ7DcMcNn2dVQJ/xCFXZYxztEF3R5UN/0HCCxuC3c9help+QWFhLMCkniltESOtLXX160VldR+GmJZ3aJ0TRljXjB4PbYKsI0qA95F8sRkEj2vpNDe8pcSxdXNINW9oPWpfknNNXChQEsniXxfxX1TFuJIvsnGtPEonOaxw6khF3GX0/kbRvApAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(136003)(39860400002)(346002)(376002)(186009)(1800799009)(451199024)(6666004)(6506007)(6486002)(9686003)(6512007)(966005)(83380400001)(478600001)(26005)(30864003)(2906002)(44832011)(33716001)(66476007)(66946007)(66556008)(8936002)(316002)(5660300002)(4326008)(41300700001)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0NBdlNwMXdyVTZtN1ZFa0VrbDFvSEdvRXc3MEpKL2t2S1JLbWtLSHBTVm50?=
 =?utf-8?B?MWYvaUpnU3dBd0lkUzdGc0FZTldqVFFLdjJRaThVMGRBWTFpOUluRWNSYnBB?=
 =?utf-8?B?a1l6d0VXcW1ORnQvU0c3dm1mUHQ1QmlFOFZya1owSWVwZ1RYRThsNEIreVJ1?=
 =?utf-8?B?MDgrSGdJVEo5VTdyeklCOWkyR1V6Tll1TkRwdGVCRkhmck9qREw0S25XNkVZ?=
 =?utf-8?B?TWE4N0lnb25PbXhvZkw5enZONGE0NjdwMEtiSFUzY3NTL09PSDBNUW01TUtS?=
 =?utf-8?B?S0NkbFcwRFZNQk1YeTJvQ2M5RmpaL1VlaUlnUnBQMGRtV0RKejQxaGZvRE5n?=
 =?utf-8?B?OWpIY3k0M0p6NTZ0RDRBQ3JZNzJOQ1JxaWlCcmhEbTRlcXp0eVRKMFl6Z0hm?=
 =?utf-8?B?UFFUcjh4NGl4WWVDSmo2dE9hWVVrV2tCems1d3hrbkZ5c3ZDNnFhRDE1VlAy?=
 =?utf-8?B?Y3ZwbHpGYzhkejFXVnUzeHYraTAwQTFVeDFTbFlYZVhSdXZBRU9JK3FSTlBi?=
 =?utf-8?B?Y3NiTnFFRXA4YjFOOVFyYUdCR0F2bzBtb3k3Nlo5SEhGcWlkTjdzdEJsYzN0?=
 =?utf-8?B?SThHcEtJVUd5NUorWVhtWGROM2d5L0h6Y2FoZTdySTlocTBUVmZKRU9UMEMv?=
 =?utf-8?B?VEJaOXpaVk5UQ0lNZDlyK3ZMT1B0blFvZzRpYW5tYTNhVjA1V1ZjOFZ2Wmlx?=
 =?utf-8?B?QkdndzJZbys4VVB3Nlh6OUJBNGNwS3dteEF5emZtOWtQc1MvTUJkampyL2tQ?=
 =?utf-8?B?UGdxTDYwcUQyeWRuZHlLazVSRE5LNnBGb2dWeWdYS292b3JGR3psaTlYdVVu?=
 =?utf-8?B?aC9MM2I0OThiRVh6dWMwVWJSVEhhR0d5VHhCVk8xcHdEUjlyMXNyd0FWSUQy?=
 =?utf-8?B?V0lMUVlzRGRNQzdyVk82MnhXeXRJbkU1NW1Da1dQV216QlMrK29CUkNOMWpN?=
 =?utf-8?B?Y2dZYjBXMjVEeFRreE5FbU5HRDZYSmM3dEtSVmpZeTFISWhrVUNybGtuQWJW?=
 =?utf-8?B?Ui95MlQzbVhoU3d5cSswUHFGUlYrWU5EMnJCcUw0OSszd3FZSmtQb21SN0Nw?=
 =?utf-8?B?TFhJbitOQ1JiMWZZSVB5NDVkakxlNjllUTd2Qnk5aUNnTkN6WmxRMVdVci9X?=
 =?utf-8?B?V0JrVlNENjVPN1pPMDg2OGFzSEc4eTlhalBHcWxpd2RGbnVtMmIvYlBSSHpH?=
 =?utf-8?B?ekpFWmVNWUM0VFo4MFhqellHNUFKMXptY2daZEYrYlE2NjNodDJsbWg2bEk4?=
 =?utf-8?B?S1FnMzJ2YzN1WUZmVEF3TGpEaHlnVExBUlI1UlRaRVZvblkxQ1U4aHlYc3ZU?=
 =?utf-8?B?NU5JWHpMbmVCNFFzeW5lbDZUWm9FemUwVzBlQjVhRTd4NXcxNmQvWEJyNmtB?=
 =?utf-8?B?eEppZ01PYWVwYnVVbVM0RS95WFg0dXJGQ3NYdW1XZnA1WFBtOWRuTDBtdUVM?=
 =?utf-8?B?NVBzclpyWS9CczVKSHhnTnpvTVgyVU05ZjZXaU1jRFdXODVNQ1VjSllwVTFP?=
 =?utf-8?B?NXh1QUhEWkR0OWZvdVhTN3J3c1FoVVVFZDJyUGpYRXBCR0h2NTN6QWtxNWx6?=
 =?utf-8?B?bHZBNk8wV0xQdVhSY3RPK0VRU3RobmZ0NEVzRXd4SjNHaHZpbXVTOWl4aEU1?=
 =?utf-8?B?d01PQXVYUDVYSjV5U3lLVDhrTWFZQTBCZDlwOUZ0cmE4bTRwT1FzRUxJbVBC?=
 =?utf-8?B?dXVYaGVWOG1aWVB3WVZId3JreHNxOXhWOTcxciszcDNJQTUydDltK0xKclJO?=
 =?utf-8?B?RzNDUjRvdUZINUhLVmp3d1dUUy9udmw2UStxaFFDUmtFREM3czNlOGNuNTVm?=
 =?utf-8?B?VmRDRE1HcmhwVjNjbjgrMWN5UGE3VzIrNlVuSTZsUjc4ZC9va0gvaVIwWSty?=
 =?utf-8?B?RnRzUGE1aVgrS0M5ZTRyVE5OZUpNRkR2TERPN1dwS251Zm1Sc3EvN09WdUY4?=
 =?utf-8?B?UTdXV3N6cmxOZFhoNi84d0syR0dlSHc1ZXhZUnB4cWljaDVZMWYwbHJrOWh0?=
 =?utf-8?B?V2NTeDVOM2FwL29lU2p3VmZGM3JzbUNESEQrYXNXTEFWZUc0UmNrK0ppTHJW?=
 =?utf-8?B?b3o4djhURlgycEx1a2dNclhUZE4xRG1jVGkyVWowaTFOdTdPaHNxLzNIdno5?=
 =?utf-8?B?Y0xqNnlJMEY5bWMzcGMxb2FKSlNjZGZPelBUWFpXd2hOQ1hIZmF1eUIvbVpN?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d73c9931-c4cf-458a-89bf-08dbb87d3cf4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 19:27:03.9297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vgWhQoMT8LBE8ue/bW+c+sm/wGWZ0UlLs5NHe7P34EAX7nEc/K58WnJgnOASX/B9RiX6+4Nw4OaqG+7D7iEuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EHooks=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_Simplify_final_return_from_xe=5Firq=5Finstall=28=29_=28rev2?=
 =?utf-8?q?=29?=
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

Quoting Patchwork (2023-09-18 13:14:20-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe: Simplify final return from xe_irq_install() (rev2)
>URL   : https://patchwork.freedesktop.org/series/123814/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>run-parts: executing /workspace/ci/hooks/00-showenv
>+ pwd
>+ ls -la
>/workspace
>total 868
>drwxrwxr-x 10 1003 1003   4096 Sep 18 16:14 .
>drwxr-xr-x  1 root root   4096 Sep 18 16:14 ..
>-rw-rw-r--  1 1003 1003 788938 Sep 18 16:13 build.log
>-rw-rw-r--  1 1003 1003    957 Sep 18 16:05 checkpatch.log
>drwxrwxr-x  5 1003 1003   4096 Sep 18 16:04 ci
>drwxrwxr-x  9 1003 1003   4096 Sep 18 16:03 docker
>drwxrwxr-x  8 1003 1003   4096 Sep 18 16:03 .git
>-rw-rw-r--  1 1003 1003    233 Sep 18 16:05 git_apply.log
>drwxrwxr-x  4 1003 1003   4096 Sep 18 16:03 .github
>-rw-rw-r--  1 1003 1003    233 Sep 18 16:03 .groovylintrc.json
>-rw-rw-r--  1 1003 1003     78 Sep 18 16:14 hooks.log
>drwxrwxr-x 31 1003 1003   4096 Sep 18 16:13 kernel
>-rw-rw-r--  1 1003 1003   1237 Sep 18 16:05 kernel.mbox
>-rw-rw-r--  1 1003 1003  26482 Sep 18 16:06 kunit.log
>-rw-rw-r--  1 1003 1003     48 Sep 18 16:05 parent.tag
>drwxrwxr-x 45 1003 1003   4096 Sep 18 16:03 pipelines
>-rw-rw-r--  1 1003 1003    793 Sep 18 16:03 README.adoc
>drwxrwxr-x  3 1003 1003   4096 Sep 18 16:03 scripts
>drwxrwxr-x  2 1003 1003   4096 Sep 18 16:03 .vscode
>+ uname -a
>Linux f0029d4df503 5.4.0-149-generic #166-Ubuntu SMP Tue Apr 18 16:51:45 U=
TC 2023 x86_64 x86_64 x86_64 GNU/Linux
>+ export
>+ grep -Ei '(^|\W)CI_'
>declare -x CI_KERNEL_BUILD_DIR=3D"/workspace/kernel/build64-default"
>declare -x CI_KERNEL_SRC_DIR=3D"/workspace/kernel"
>declare -x CI_TOOLS_SRC_DIR=3D"/workspace/ci"
>declare -x CI_WORKSPACE_DIR=3D"/workspace"
>+ '[' -n /workspace ']'
>+ git_args=3D'-C /workspace/kernel'
>+ git_log_args=3D
>+ git --no-pager -C /workspace/kernel log --format=3Doneline --abbrev-comm=
it
>f9dde6a21 drm/xe: Simplify final return from xe_irq_install()
>717f01815 drm/xe: Reinstate pipelined fence enable_signaling
>run-parts: executing /workspace/ci/hooks/10-build-W1
>+ SRC_DIR=3D/workspace/kernel
>+ RESTORE_DISPLAY_CONFIG=3D0
>+ '[' -n /workspace/kernel/build64-default ']'
>+ BUILD_DIR=3D/workspace/kernel/build64-default
>+ cd /workspace/kernel
>+ grep -q -e '^CONFIG_DRM_XE_DISPLAY=3D[yY]' /workspace/kernel/build64-def=
ault/.config
>+ RESTORE_DISPLAY_CONFIG=3D1
>+ trap cleanup EXIT
>+ ./scripts/config --file /workspace/kernel/build64-default/.config --disa=
ble CONFIG_DRM_XE_DISPLAY
>++ nproc
>+ make -j48 O=3D/workspace/kernel/build64-default modules_prepare
>make[1]: Entering directory '/workspace/kernel/build64-default'
>  SYNC    include/config/auto.conf.cmd
>  GEN     Makefile
>  GEN     Makefile
>  UPD     include/config/kernel.release
>  UPD     include/generated/compile.h
>  UPD     include/generated/utsrelease.h
>  DESCEND objtool
>  HOSTCC  /workspace/kernel/build64-default/tools/objtool/fixdep.o
>  CALL    ../scripts/checksyscalls.sh
>  HOSTLD  /workspace/kernel/build64-default/tools/objtool/fixdep-in.o
>  LINK    /workspace/kernel/build64-default/tools/objtool/fixdep
>  INSTALL libsubcmd_headers
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/exec-c=
md.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/help.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/pager.=
o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/parse-=
options.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/run-co=
mmand.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/sigcha=
in.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/subcmd=
-config.o
>  LD      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsub=
cmd-in.o
>  AR      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsub=
cmd.a
>  CC      /workspace/kernel/build64-default/tools/objtool/weak.o
>  CC      /workspace/kernel/build64-default/tools/objtool/check.o
>  CC      /workspace/kernel/build64-default/tools/objtool/special.o
>  CC      /workspace/kernel/build64-default/tools/objtool/builtin-check.o
>  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
>  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
>  CC      /workspace/kernel/build64-default/tools/objtool/orc_gen.o
>  CC      /workspace/kernel/build64-default/tools/objtool/orc_dump.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libstring.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libctype.o
>  CC      /workspace/kernel/build64-default/tools/objtool/str_error_r.o
>  CC      /workspace/kernel/build64-default/tools/objtool/librbtree.o
>  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/special=
.o
>  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decode.=
o
>  LD      /workspace/kernel/build64-default/tools/objtool/arch/x86/objtool=
-in.o
>  LD      /workspace/kernel/build64-default/tools/objtool/objtool-in.o
>  LINK    /workspace/kernel/build64-default/tools/objtool/objtool
>make[1]: Leaving directory '/workspace/kernel/build64-default'
>++ nproc
>+ make -j48 O=3D/workspace/kernel/build64-default M=3Ddrivers/gpu/drm/xe W=
=3D1
>make[1]: Entering directory '/workspace/kernel/build64-default'
>  CC [M]  drivers/gpu/drm/xe/xe_bb.o
>  CC [M]  drivers/gpu/drm/xe/xe_bo.o
>  CC [M]  drivers/gpu/drm/xe/xe_bo_evict.o
>  CC [M]  drivers/gpu/drm/xe/xe_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_devcoredump.o
>  CC [M]  drivers/gpu/drm/xe/xe_device.o
>  CC [M]  drivers/gpu/drm/xe/xe_device_sysfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_dma_buf.o
>  CC [M]  drivers/gpu/drm/xe/xe_exec.o
>  CC [M]  drivers/gpu/drm/xe/xe_execlist.o
>  CC [M]  drivers/gpu/drm/xe/xe_exec_queue.o
>  CC [M]  drivers/gpu/drm/xe/xe_force_wake.o
>  CC [M]  drivers/gpu/drm/xe/xe_ggtt.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_clock.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_idle_sysfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_mcr.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_pagefault.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_sysfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o
>  HOSTCC  drivers/gpu/drm/xe/xe_gen_wa_oob
>  CC [M]  drivers/gpu/drm/xe/xe_gt_topology.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_ads.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_ct.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_hwconfig.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_log.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_pc.o
>  CC [M]  drivers/gpu/drm/xe/xe_guc_submit.o
>  CC [M]  drivers/gpu/drm/xe/xe_hw_engine.o
>  CC [M]  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_hw_fence.o
>  CC [M]  drivers/gpu/drm/xe/xe_huc.o
>  CC [M]  drivers/gpu/drm/xe/xe_huc_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_irq.o
>  CC [M]  drivers/gpu/drm/xe/xe_lrc.o
>  CC [M]  drivers/gpu/drm/xe/xe_mmio.o
>  CC [M]  drivers/gpu/drm/xe/xe_mocs.o
>  CC [M]  drivers/gpu/drm/xe/xe_module.o
>  CC [M]  drivers/gpu/drm/xe/xe_pat.o
>  CC [M]  drivers/gpu/drm/xe/xe_pci.o
>  CC [M]  drivers/gpu/drm/xe/xe_pcode.o
>  CC [M]  drivers/gpu/drm/xe/xe_pm.o
>  CC [M]  drivers/gpu/drm/xe/xe_preempt_fence.o
>  CC [M]  drivers/gpu/drm/xe/xe_pt.o
>  CC [M]  drivers/gpu/drm/xe/xe_pt_walk.o
>  CC [M]  drivers/gpu/drm/xe/xe_query.o
>  CC [M]  drivers/gpu/drm/xe/xe_range_fence.o
>  CC [M]  drivers/gpu/drm/xe/xe_reg_sr.o
>  CC [M]  drivers/gpu/drm/xe/xe_reg_whitelist.o
>  CC [M]  drivers/gpu/drm/xe/xe_rtp.o
>  CC [M]  drivers/gpu/drm/xe/xe_sa.o
>  CC [M]  drivers/gpu/drm/xe/xe_sched_job.o
>  CC [M]  drivers/gpu/drm/xe/xe_step.o
>  CC [M]  drivers/gpu/drm/xe/xe_sync.o
>  CC [M]  drivers/gpu/drm/xe/xe_tile.o
>  CC [M]  drivers/gpu/drm/xe/xe_trace.o
>  CC [M]  drivers/gpu/drm/xe/xe_tile_sysfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_ttm_sys_mgr.o
>  CC [M]  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.o
>  CC [M]  drivers/gpu/drm/xe/xe_ttm_vram_mgr.o
>  CC [M]  drivers/gpu/drm/xe/xe_tuning.o
>  CC [M]  drivers/gpu/drm/xe/xe_uc.o
>  CC [M]  drivers/gpu/drm/xe/xe_uc_debugfs.o
>  CC [M]  drivers/gpu/drm/xe/xe_uc_fw.o
>  CC [M]  drivers/gpu/drm/xe/xe_vm_madvise.o
>  CC [M]  drivers/gpu/drm/xe/xe_wait_user_fence.o
>  CC [M]  drivers/gpu/drm/xe/xe_wopcm.o
>  CC [M]  drivers/gpu/drm/xe/xe_pmu.o
>  HDRTEST drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.o
>  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.o
>  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.o
>  HDRTEST drivers/gpu/drm/xe/abi/guc_errors_abi.h
>  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h
>  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
>  HDRTEST drivers/gpu/drm/xe/abi/guc_actions_abi.h
>  HDRTEST drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.o
>  HDRTEST drivers/gpu/drm/xe/abi/guc_messages_abi.h
>  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.o
>  HDRTEST drivers/gpu/drm/xe/regs/xe_reg_defs.h
>  HDRTEST drivers/gpu/drm/xe/regs/xe_guc_regs.h
>  HDRTEST drivers/gpu/drm/xe/regs/xe_gt_regs.h
>  HDRTEST drivers/gpu/drm/xe/regs/xe_regs.h
>  HDRTEST drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>  HDRTEST drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>  HDRTEST drivers/gpu/drm/xe/regs/xe_engine_regs.h
>  HDRTEST drivers/gpu/drm/xe/tests/xe_test.h
>  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.o
>  HDRTEST drivers/gpu/drm/xe/tests/xe_pci_test.h
>  HDRTEST drivers/gpu/drm/xe/tests/xe_migrate_test.h
>  HDRTEST drivers/gpu/drm/xe/tests/xe_dma_buf_test.h
>  HDRTEST drivers/gpu/drm/xe/tests/xe_bo_test.h
>  HDRTEST drivers/gpu/drm/xe/xe_assert.h
>  HDRTEST drivers/gpu/drm/xe/xe_bb.h
>  HDRTEST drivers/gpu/drm/xe/xe_bb_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_bo.h
>  HDRTEST drivers/gpu/drm/xe/xe_bo_doc.h
>  HDRTEST drivers/gpu/drm/xe/xe_bo_evict.h
>  HDRTEST drivers/gpu/drm/xe/xe_bo_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_debugfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_devcoredump.h
>  HDRTEST drivers/gpu/drm/xe/xe_devcoredump_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_device.h
>  HDRTEST drivers/gpu/drm/xe/xe_device_sysfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_device_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_dma_buf.h
>  HDRTEST drivers/gpu/drm/xe/xe_drv.h
>  HDRTEST drivers/gpu/drm/xe/xe_exec.h
>  HDRTEST drivers/gpu/drm/xe/xe_exec_queue.h
>  HDRTEST drivers/gpu/drm/xe/xe_exec_queue_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_execlist.h
>  HDRTEST drivers/gpu/drm/xe/xe_execlist_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_force_wake.h
>  HDRTEST drivers/gpu/drm/xe/xe_force_wake_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_ggtt.h
>  HDRTEST drivers/gpu/drm/xe/xe_ggtt_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_clock.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_debugfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_mcr.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_pagefault.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_printk.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_sysfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_topology.h
>  HDRTEST drivers/gpu/drm/xe/xe_gt_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_ads.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_ads_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_ct.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_ct_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_debugfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_fwif.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_hwconfig.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_log.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_log_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_pc.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_pc_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_submit.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_submit_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_guc_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_huc.h
>  HDRTEST drivers/gpu/drm/xe/xe_huc_debugfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_huc_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_hw_engine.h
>  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_hw_engine_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_hw_fence.h
>  HDRTEST drivers/gpu/drm/xe/xe_hw_fence_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_irq.h
>  HDRTEST drivers/gpu/drm/xe/xe_lrc.h
>  HDRTEST drivers/gpu/drm/xe/xe_lrc_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_macros.h
>  HDRTEST drivers/gpu/drm/xe/xe_map.h
>  HDRTEST drivers/gpu/drm/xe/xe_migrate.h
>  HDRTEST drivers/gpu/drm/xe/xe_migrate_doc.h
>  HDRTEST drivers/gpu/drm/xe/xe_mmio.h
>  HDRTEST drivers/gpu/drm/xe/xe_mocs.h
>  HDRTEST drivers/gpu/drm/xe/xe_module.h
>  HDRTEST drivers/gpu/drm/xe/xe_pat.h
>  HDRTEST drivers/gpu/drm/xe/xe_pci_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_pci.h
>  HDRTEST drivers/gpu/drm/xe/xe_pcode.h
>  HDRTEST drivers/gpu/drm/xe/xe_pcode_api.h
>  HDRTEST drivers/gpu/drm/xe/xe_platform_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_pm.h
>  HDRTEST drivers/gpu/drm/xe/xe_pmu.h
>  HDRTEST drivers/gpu/drm/xe/xe_pmu_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence.h
>  HDRTEST drivers/gpu/drm/xe/xe_preempt_fence_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_pt.h
>  HDRTEST drivers/gpu/drm/xe/xe_pt_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_pt_walk.h
>  HDRTEST drivers/gpu/drm/xe/xe_query.h
>  HDRTEST drivers/gpu/drm/xe/xe_range_fence.h
>  HDRTEST drivers/gpu/drm/xe/xe_reg_sr.h
>  HDRTEST drivers/gpu/drm/xe/xe_reg_sr_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_reg_whitelist.h
>  HDRTEST drivers/gpu/drm/xe/xe_res_cursor.h
>  HDRTEST drivers/gpu/drm/xe/xe_ring_ops.h
>  HDRTEST drivers/gpu/drm/xe/xe_ring_ops_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_rtp.h
>  HDRTEST drivers/gpu/drm/xe/xe_rtp_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_sa.h
>  HDRTEST drivers/gpu/drm/xe/xe_sa_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_sched_job.h
>  HDRTEST drivers/gpu/drm/xe/xe_sched_job_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_step.h
>  HDRTEST drivers/gpu/drm/xe/xe_step_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_sync.h
>  HDRTEST drivers/gpu/drm/xe/xe_sync_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_tile.h
>  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_tile_sysfs_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_trace.h
>  HDRTEST drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
>  HDRTEST drivers/gpu/drm/xe/xe_ttm_sys_mgr.h
>  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>  HDRTEST drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_tuning.h
>  HDRTEST drivers/gpu/drm/xe/xe_uc.h
>  HDRTEST drivers/gpu/drm/xe/xe_uc_debugfs.h
>  HDRTEST drivers/gpu/drm/xe/xe_uc_fw.h
>  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_abi.h
>  HDRTEST drivers/gpu/drm/xe/xe_uc_fw_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_uc_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_vm.h
>  HDRTEST drivers/gpu/drm/xe/xe_vm_doc.h
>  HDRTEST drivers/gpu/drm/xe/xe_vm_madvise.h
>  HDRTEST drivers/gpu/drm/xe/xe_vm_types.h
>  HDRTEST drivers/gpu/drm/xe/xe_wa.h
>  HDRTEST drivers/gpu/drm/xe/xe_wait_user_fence.h
>  HDRTEST drivers/gpu/drm/xe/xe_wopcm.h
>  HDRTEST drivers/gpu/drm/xe/xe_wopcm_types.h
>  GEN     xe_wa_oob.c xe_wa_oob.h
>  GEN     xe_wa_oob.c xe_wa_oob.h
>  CC [M]  drivers/gpu/drm/xe/xe_guc.o
>  CC [M]  drivers/gpu/drm/xe/xe_migrate.o
>  CC [M]  drivers/gpu/drm/xe/xe_ring_ops.o
>  CC [M]  drivers/gpu/drm/xe/xe_vm.o
>  CC [M]  drivers/gpu/drm/xe/xe_wa.o
>  LD [M]  drivers/gpu/drm/xe/xe.o
>  MODPOST drivers/gpu/drm/xe/Module.symvers
>WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests=
/xe_bo_test.o
>WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests=
/xe_dma_buf_test.o
>WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests=
/xe_migrate_test.o
>WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests=
/xe_pci_test.o
>WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests=
/xe_rtp_test.o
>WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests=
/xe_wa_test.o
>  CC [M]  drivers/gpu/drm/xe/xe.mod.o
>  CC [M]  drivers/gpu/drm/xe/tests/xe_bo_test.mod.o
>  CC [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.mod.o
>  CC [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.mod.o
>  CC [M]  drivers/gpu/drm/xe/tests/xe_pci_test.mod.o
>  CC [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.mod.o
>  CC [M]  drivers/gpu/drm/xe/tests/xe_wa_test.mod.o
>  LD [M]  drivers/gpu/drm/xe/tests/xe_migrate_test.ko
>  LD [M]  drivers/gpu/drm/xe/tests/xe_wa_test.ko
>  LD [M]  drivers/gpu/drm/xe/xe.ko
>  LD [M]  drivers/gpu/drm/xe/tests/xe_bo_test.ko
>  LD [M]  drivers/gpu/drm/xe/tests/xe_pci_test.ko
>  LD [M]  drivers/gpu/drm/xe/tests/xe_dma_buf_test.ko
>  LD [M]  drivers/gpu/drm/xe/tests/xe_rtp_test.ko
>make[1]: Leaving directory '/workspace/kernel/build64-default'
>+ cleanup
>+ '[' 1 -eq 1 ']'
>+ ./scripts/config --file /workspace/kernel/build64-default/.config --enab=
le CONFIG_DRM_XE_DISPLAY
>run-parts: executing /workspace/ci/hooks/20-kernel-doc
>+ SRC_DIR=3D/workspace/kernel
>+ cd /workspace/kernel
>+ find drivers/gpu/drm/xe/ -name '*.[ch]' -not -path 'drivers/gpu/drm/xe/d=
isplay/*'
>+ xargs ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
>include/uapi/drm/xe_drm.h:1057: warning: This comment starts with '/**', b=
ut isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> * XE PMU event config IDs
>1 warnings as Errors

This is not caused by this series. I have posted [1] for a quick fix for th=
is.

[1] https://patchwork.freedesktop.org/series/123870/

Gustavo Sousa

>run-parts: /workspace/ci/hooks/20-kernel-doc exited with return code 123
>
>
