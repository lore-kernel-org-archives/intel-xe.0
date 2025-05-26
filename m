Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EDAC54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 20:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8529810E029;
	Mon, 26 May 2025 20:59:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA12D10E27C;
 Mon, 26 May 2025 20:59:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_on_linux-next_=28next-202?=
 =?utf-8?q?50507=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 20:59:20 -0000
Message-ID: <174829316082.21264.2662230482087885225@1538d3639d33>
X-Patchwork-Hint: ignore
References: <SJ1PR11MB61292CE72D7BE06B8810021CB997A@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61292CE72D7BE06B8810021CB997A@SJ1PR11MB6129.namprd11.prod.outlook.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: on linux-next (next-20250507)
URL   : https://patchwork.freedesktop.org/series/148879/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 780df7d4fb6840439582313bd71874e1c87125a5
Author: Jason Gunthorpe <jgg@ziepe.ca>
Date:   Mon May 12 09:21:02 2025 -0300

    on linux-next (next-20250507)
    
    On Mon, May 12, 2025 at 06:00:39AM +0000, Borah, Chaitanya Kumar wrote:
    
    > `````````````````````````````````````````````````````````````````````````````````````````````````````````
    > commit 13f43d7cf3e0570004a0d960bc1be23db827c2ff
    > Author: Jason Gunthorpe mailto:jgg@nvidia.com
    > Date:   Tue Apr 8 13:53:56 2025 -0300
    >
    >     iommu/pages: Formalize the freelist API
    > `````````````````````````````````````````````````````````````````````````````````````````````````````````
    >
    > We could not revert the patch because of merge conflicts but resetting to the parent of the commit seems to fix the issue.
    >
    > Could you please check why the patch causes this regression and provide a fix if necessary?
    
    Could this be the solution?
    
    Jason
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
780df7d4fb68 on linux-next (next-20250507)
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
> `````````````````````````````````````````````````````````````````````````````````````````````````````````

-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '13f43d7cf3e0570004a0d960bc1be23db827c2ff', maybe rebased or not pulled?
#12: 
> commit 13f43d7cf3e0570004a0d960bc1be23db827c2ff

-:39: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 8 lines checked


