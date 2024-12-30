Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89064E77188
	for <intel-xe@archiver.kernel.org>; Mon, 30 Dec 2024 19:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECC110E0C9;
	Mon, 30 Dec 2024 19:48:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A375E10E0C9;
 Mon, 30 Dec 2024 19:48:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64D435C5EB0;
 Mon, 30 Dec 2024 19:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898EAC4CED0;
 Mon, 30 Dec 2024 19:48:53 +0000 (UTC)
Date: Mon, 30 Dec 2024 14:50:02 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Genes Lists <lists@sapience.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, stable@vger.kernel.org,
 regressions@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
Message-ID: <20241230145002.3cc11717@gandalf.local.home>
In-Reply-To: <20241230141329.5f698715@batman.local.home>
References: <2e9332ab19c44918dbaacecd8c039fb0bbe6e1db.camel@sapience.com>
 <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
 <20241230141329.5f698715@batman.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 30 Dec 2024 14:13:29 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> I guess the "fix" would be to have the check code ignore pointer to
> arrays, assuming they are "ok".

Can you try this patch?

-- Steve

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 1545cc8b49d0..770e7ed91716 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -364,6 +364,18 @@ static bool process_string(const char *fmt, int len, struct trace_event_call *ca
 		s = r + 1;
 	} while (s < e);
 
+	/*
+	 * Check for arrays. If the argument has: foo[REC->val]
+	 * then it is very likely that foo is an array of strings
+	 * that are safe to use.
+	 */
+	r = strstr(s, "[");
+	if (r && r < e) {
+		r = strstr(r, "REC->");
+		if (r && r < e)
+			return true;
+	}
+
 	/*
 	 * If there's any strings in the argument consider this arg OK as it
 	 * could be: REC->field ? "foo" : "bar" and we don't want to get into
